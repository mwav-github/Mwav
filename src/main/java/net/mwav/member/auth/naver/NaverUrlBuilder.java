package net.mwav.member.auth.naver;

import java.io.IOException;
import java.util.UUID;
import java.util.concurrent.ExecutionException;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;


/**
 * 
 * @class name : NaverUrlBuilder.java
 * @description : 네이버 로그인 인증 url 생성<br>
 * 				  application.properties의 값을 참조
 * @author : (정) 남동희
             (부)
 * @since : 2019. 7. 13
 * @version : v1.1
 * @see
 * @history :
   ----------------------------------------
 * Modification Information(개정이력)
   ----------------------------------------
     수정일              	수정자                수정내용
   --------    --------    ----------------
 * 2019.07.13    남동희          		최초 생성		
 */
@Configuration
@PropertySource("classpath:googleProperties/application.properties")
@Component
public class NaverUrlBuilder {
	Logger log = Logger.getLogger(this.getClass());

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
		log.info("appKey :" + appKey);
		log.info("appSecret : " + appSecret);
		log.info("callbackUrl : " + callbackUrl);

		setSession(session, "state", state);

		OAuth20Service oauthService = new ServiceBuilder().apiKey(appKey).apiSecret(appSecret).callback(callbackUrl).state(state).build(NaverAPI.getInstance());

		return oauthService.getAuthorizationUrl();
	}

	public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws IOException, InterruptedException, ExecutionException {
		String sessionState = getSession(session, "state");

		if (StringUtils.pathEquals(sessionState, state)) {
			OAuth20Service oauthService = new ServiceBuilder().apiKey(appKey).apiSecret(appSecret).callback(callbackUrl).state(state).build(NaverAPI.getInstance());

			OAuth2AccessToken token = oauthService.getAccessToken(code);
			return token;
		}
		return null;
	}

	public String getUserProfile(OAuth2AccessToken token) throws IOException {
		OAuth20Service oauthService = new ServiceBuilder().apiKey(appKey).apiSecret(appSecret).callback(callbackUrl).build(NaverAPI.getInstance());
		OAuthRequest request = new OAuthRequest(Verb.GET, "https://openapi.naver.com/v1/nid/me", oauthService);
		
		oauthService.signRequest(token, request);
		Response response = request.send();
		return response.getBody();
	}
}
