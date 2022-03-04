package net.bizlogin.common.service;

import java.io.IOException;
import java.util.UUID;
import java.util.concurrent.ExecutionException;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.oauth.OAuth20Service;

public abstract class OAuthService {

	public abstract OAuth20Service createService();
	
	public String generateState() {
		return UUID.randomUUID().toString();
	}
	
	public abstract String getAuthorizationUrlName() throws Exception;
	
	public abstract String getStateName() throws Exception;

	public String getAuthorizationUrl(String state) {
		OAuth20Service oauthService = createService();
		return oauthService.getAuthorizationUrl(state);
	}

	public OAuth2AccessToken getAccessToken(String code) throws IOException, InterruptedException, ExecutionException {
		OAuth20Service oauthService = createService();
		OAuth2AccessToken token = oauthService.getAccessToken(code);
		return token;
	}

	public abstract Response getUserProfile(OAuth2AccessToken token) throws Exception;

}
