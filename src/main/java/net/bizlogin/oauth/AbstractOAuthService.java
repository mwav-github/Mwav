package net.bizlogin.oauth;

import java.io.IOException;
import java.util.concurrent.ExecutionException;

import javax.annotation.PostConstruct;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.oauth.OAuth20Service;

public abstract class AbstractOAuthService {

	protected OAuth20Service oauthService;

	@PostConstruct
	public void init() {
		this.oauthService = this.createService();
	}

	public abstract OAuth20Service createService();

	public String getAuthorizationUrl(String state) {
		String authorizationUrl = this.oauthService.getAuthorizationUrl(state);
		return authorizationUrl;
	}

	public abstract boolean isValidToken(String token) throws IOException, InterruptedException, ExecutionException;

	// access_token, refresh_token, token_type, expires_in
	public OAuth2AccessToken getAccessToken(String code) throws IOException, InterruptedException, ExecutionException {
		OAuth2AccessToken token = this.oauthService.getAccessToken(code);
		return token;
	}

	public OAuth2AccessToken refreshToken(String refreshToken) throws IOException, InterruptedException, ExecutionException {
		OAuth2AccessToken token = this.oauthService.refreshAccessToken(refreshToken);
		return token;
	}

	public void revokeToken(String tokenToRevoke) throws IOException, InterruptedException, ExecutionException {
		this.oauthService.revokeToken(tokenToRevoke);
	}

}
