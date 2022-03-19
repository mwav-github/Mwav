package net.bizlogin.oauth.naver.service;

import java.io.IOException;
import java.util.Map;
import java.util.concurrent.ExecutionException;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

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

import net.bizlogin.oauth.AbstractOAuthService;
import net.bizlogin.oauth.naver.dao.NaverDao;

@Service
public class NaverServiceImpl extends AbstractOAuthService {

	@Value("${bizlogin.naver.appKey}")
	private String appKey;

	@Value("${bizlogin.naver.appSecret}")
	private String appSecret;

	@Value("${bizlogin.naver.callbackUrl}")
	private String callbackUrl;

	private static final Logger logger = LoggerFactory.getLogger(NaverServiceImpl.class);

	@Inject
	private NaverDao naverDao;

	@Override
	public OAuth20Service createService() {
		OAuth20Service oauthService = new ServiceBuilder(appKey).apiSecret(appSecret).callback(callbackUrl)
				.build(NaverApi.instance());
		return oauthService;
	}

	@SuppressWarnings("unchecked")
	public void signin(OAuth2Authorization auth, Map<String, Object> param) throws JsonParseException, JsonMappingException, IOException, InterruptedException, ExecutionException {
		OAuth2AccessToken accessToken = getAccessToken(auth.getCode());
		Response response = getUserProfile(accessToken);
		logger.debug(response.toString());

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
	}

	@Override
	public boolean isValidToken(String token) throws IOException, InterruptedException, ExecutionException {
		return true;
	}

	/**
	 * 네이버 프로필 조회
	 * @param token
	 * @return Response {resultcode, message, response : { profile }}
	 */
	public Response getUserProfile(OAuth2AccessToken token) throws InterruptedException, ExecutionException, IOException {
		OAuthRequest request = new OAuthRequest(Verb.GET, "https://openapi.naver.com/v1/nid/me");
		oauthService.signRequest(token, request);

		Response response = oauthService.execute(request);
		return response;
	}
}
