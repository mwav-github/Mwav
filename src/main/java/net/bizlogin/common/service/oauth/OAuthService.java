package net.bizlogin.common.service.oauth;

import java.util.UUID;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.oauth.OAuth20Service;

public abstract class OAuthService {
	
	protected OAuth20Service oauthService;

	public String generateState() {
		return UUID.randomUUID().toString();
	}

	public abstract String getAuthorizationUrlName() throws Exception;

	public abstract String getStateName() throws Exception;

	public abstract OAuth20Service createService();

	public String getAuthorizationUrl(String state) throws Exception {
		String authorizationUrl = this.oauthService.getAuthorizationUrl(state);
		return authorizationUrl;
	}
	
	public abstract boolean isValidToken(String token) throws Exception;

	public OAuth2AccessToken getAccessToken(String code) throws Exception {
		OAuth2AccessToken token = this.oauthService.getAccessToken(code);
		return token;
	}

	public OAuth2AccessToken refreshToken(String refreshToken) throws Exception {
		OAuth2AccessToken token = this.oauthService.refreshAccessToken(refreshToken);
		return token;
	}

	public void revokeToken(String tokenToRevoke) throws Exception {
		this.oauthService.revokeToken(tokenToRevoke);
	}

	public abstract Response getUserProfile(OAuth2AccessToken token) throws Exception;

}
