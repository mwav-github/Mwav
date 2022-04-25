package net.bizlogin.oauth.naver.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ExecutionException;

import javax.annotation.PostConstruct;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.apis.NaverApi;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.exceptions.OAuthException;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuth2Authorization;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

import net.bizlogin.oauth.naver.dao.NaverDao;

/**
 * 프로모터 네이버 로그인 
 *
 */
@Service
public class NaverServiceImpl {

	@SuppressWarnings("unused")
	private static final Logger logger = LoggerFactory.getLogger(NaverServiceImpl.class);

	@Value("${bizlogin.naver.appKey}")
	private String appKey;

	@Value("${bizlogin.naver.appSecret}")
	private String appSecret;

	@Value("${bizlogin.naver.callbackUrl}")
	private String callbackUrl;

	private OAuth20Service oauthService;

	@Inject
	private NaverDao naverDao;

	/**
	 * 네이버 oauthService 생성
	 */
	@PostConstruct
	public void createService() {
		this.oauthService = new ServiceBuilder(appKey).apiSecret(appSecret)
				.callback(callbackUrl)
				.build(NaverApi.instance());
	}

	/**
	 * 네이버 로그인 인증 url 생성
	 * @param state
	 * @return url
	 */
	public String getAuthorizationUrl(String state) {
		String authorizationUrl = this.oauthService.getAuthorizationUrl(state);
		return authorizationUrl;
	}

	/**
	 * 네이버 로그인
	 * @param auth {code, state}
	 * @param param {spIpAddress}
	 */
	@Transactional(rollbackFor = { Exception.class }, readOnly = false)
	@SuppressWarnings("unchecked")
	public Map<String, Object> signin(OAuth2Authorization auth, Map<String, Object> param) throws JsonParseException, JsonMappingException, IOException, InterruptedException, ExecutionException {
		Map<String, Object> result = new HashMap<String, Object>();
		OAuth2AccessToken accessToken = getAccessToken(auth.getCode());
		Response response = getUserProfile(accessToken);

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> responseMap = mapper.readValue(response.getBody(), Map.class);

		if (!"00".equals(responseMap.get("resultcode"))) {
			throw new OAuthException("문제가 발생하였습니다.\n고객센터로 문의해주세요.");
		}

		Map<String, Object> userProfile = (Map<String, Object>) responseMap.get("response");
		userProfile.putAll(param);

		Map<String, Object> naverPromoter = naverDao.getSnsPromoter(userProfile);
		if (naverPromoter == null || naverPromoter.isEmpty()) {
			naverDao.createSnsPromoter(userProfile);
		}

		result.put("promoter", naverPromoter);
		return result;
	}

	/**
	 * 토큰 유효성 검증
	 */
	public boolean isValidToken(String token) throws IOException, InterruptedException, ExecutionException {
		return true;
	}

	/**
	 * 접근 토큰 발행
	 * @param code
	 * @return {accessToken, refreshToken, tokenType, expiresIn, ...}
	 */
	public OAuth2AccessToken getAccessToken(String code) throws IOException, InterruptedException, ExecutionException {
		OAuth2AccessToken token = this.oauthService.getAccessToken(code);
		return token;
	}

	/**
	 * 토큰 재발급
	 * @param refreshToken
	 * @return {accessToken, refreshToken, tokenType, expiresIn, ...}
	 */
	public OAuth2AccessToken refreshToken(String refreshToken) throws IOException, InterruptedException, ExecutionException {
		OAuth2AccessToken token = this.oauthService.refreshAccessToken(refreshToken);
		return token;
	}

	/**
	 * 토큰 회수
	 * @param tokenToRevoke
	 */
	public void revokeToken(String tokenToRevoke) throws IOException, InterruptedException, ExecutionException {
		this.oauthService.revokeToken(tokenToRevoke);
	}

	/**
	 * 네이버 프로필 조회
	 * @param token {accessToken, refreshToken, tokenType, expiresIn, ...}
	 * @return Response {resultcode, message, response : { profile }}
	 */
	public Response getUserProfile(OAuth2AccessToken token) throws InterruptedException, ExecutionException, IOException {
		OAuthRequest request = new OAuthRequest(Verb.GET, "https://openapi.naver.com/v1/nid/me");
		oauthService.signRequest(token, request);

		Response response = oauthService.execute(request);
		return response;
	}

}
