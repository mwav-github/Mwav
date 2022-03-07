package net.bizlogin.oauth.naver.service;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.github.scribejava.apis.NaverApi;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuth2Authorization;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

import net.bizlogin.oauth.AbstractOAuthService;

@Service
public class NaverServiceImpl extends AbstractOAuthService {

	@Value("${bizlogin.naver.appKey}")
	private String appKey;

	@Value("${bizlogin.naver.appSecret}")
	private String appSecret;

	@Value("${bizlogin.naver.callbackUrl}")
	private String callbackUrl;

	private static final Logger logger = LoggerFactory.getLogger(NaverServiceImpl.class);
	
	/**
	 * 
	 * @param param {code, state}
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> signin(OAuth2Authorization auth) throws Exception {
		OAuth2AccessToken token = getAccessToken(auth.getCode());
		logger.debug(token.getRawResponse());
		logger.debug("address : " + oauthService);

		return null;
	}

	@Override
	public OAuth20Service createService() {
		OAuth20Service oauthService = new ServiceBuilder(appKey).apiSecret(appSecret).callback(callbackUrl)
				.build(NaverApi.instance());
		return oauthService;
	}

	@Override
	public boolean isValidToken(String token) throws Exception {
		return true;
	}

	public Response getUserProfile(OAuth2AccessToken token) throws Exception {
		OAuthRequest request = new OAuthRequest(Verb.GET, "https://openapi.naver.com/v1/nid/me");
		oauthService.signRequest(token, request);

		Response response = oauthService.execute(request);
		return response;
	}
}
