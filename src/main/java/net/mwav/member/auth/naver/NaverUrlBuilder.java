package net.mwav.member.auth.naver;

import java.io.IOException;
import java.util.UUID;
import java.util.concurrent.ExecutionException;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import com.github.scribejava.apis.NaverApi;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

/**
 * 네이버 로그인 인증 url 생성
 * @author 남동희
 */
@Configuration
@PropertySource("classpath:googleProperties/application.properties")
@Component
public class NaverUrlBuilder {

	private static final Logger logger = LoggerFactory.getLogger(NaverUrlBuilder.class);

	@Value("${naver.appKey}")
	private String appKey;

	@Value("${naver.appSecret}")
	private String appSecret;

	@Value("${naver.callbackUrl}")
	private String callbackUrl;

	private String generateRandomString() {
		return UUID.randomUUID().toString();
	}

	private void setSession(HttpSession session, String name, String state) {
		session.setAttribute(name, state);
	}

	private String getSession(HttpSession session, String name) {
		return (String) session.getAttribute(name);
	}

	public String getAuthorizationUrl(HttpSession session) {
		String state = generateRandomString();
		logger.debug("appKey :" + appKey);
		logger.debug("appSecret : " + appSecret);
		logger.debug("callbackUrl : " + callbackUrl);

		setSession(session, "state", state);

		OAuth20Service oauthService = new ServiceBuilder(appKey)
									.apiSecret(appSecret)
									.callback(callbackUrl)
									.build(NaverApi.instance());
		return oauthService.getAuthorizationUrl(state);
	}

	public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws IOException, InterruptedException, ExecutionException {
		String sessionState = getSession(session, "state");

		if (StringUtils.pathEquals(sessionState, state)) {
			OAuth20Service oauthService = new ServiceBuilder(appKey)
										.apiSecret(appSecret)
										.callback(callbackUrl)
										.build(NaverApi.instance());

			OAuth2AccessToken token = oauthService.getAccessToken(code);
			return token;
		}
		return null;
	}

	public String getUserProfile(OAuth2AccessToken token) throws IOException, InterruptedException, ExecutionException {
		OAuth20Service oauthService = new ServiceBuilder(appKey)
										.apiSecret(appSecret)
										.callback(callbackUrl)
										.build(NaverApi.instance());
		OAuthRequest request = new OAuthRequest(Verb.GET, "https://openapi.naver.com/v1/nid/me");
		oauthService.signRequest(token, request);
		
		Response response = oauthService.execute(request);
		return response.getBody();
	}
}
