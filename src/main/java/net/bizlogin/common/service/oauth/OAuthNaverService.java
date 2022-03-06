package net.bizlogin.common.service.oauth;

import javax.annotation.PostConstruct;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

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
public class OAuthNaverService extends OAuthService {

	@SuppressWarnings("unused")
	private static final Logger logger = LoggerFactory.getLogger(OAuthNaverService.class);

	@Value("${bizlogin.naver.appKey}")
	private String appKey;

	@Value("${bizlogin.naver.appSecret}")
	private String appSecret;

	@Value("${bizlogin.naver.callbackUrl}")
	private String callbackUrl;

	private String authorizationUrlName = "naver_url";

	private String stateName = "naver_state";
	
	@PostConstruct
	public void set() {
		this.oauthService = createService();
	}

	@Override
	public String getAuthorizationUrlName() throws Exception {
		return this.authorizationUrlName;
	}

	@Override
	public String getStateName() throws Exception {
		return this.stateName;
	}

	@Override
	public OAuth20Service createService() {
		OAuth20Service oauthService = new ServiceBuilder(appKey)
				.apiSecret(appSecret)
				.callback(callbackUrl)
				.build(NaverApi.instance());
		return oauthService;
	}

	@Override
	public boolean isValidToken(String token) throws Exception {
		return true;
	}

	@Override
	public Response getUserProfile(OAuth2AccessToken token) throws Exception {
		OAuthRequest request = new OAuthRequest(Verb.GET, "https://openapi.naver.com/v1/nid/me");
		oauthService.signRequest(token, request);

		Response response = this.oauthService.execute(request);
		return response;
	}

}
