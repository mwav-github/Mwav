package net.bizlogin.oauth.naver.service;

import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.github.scribejava.core.model.OAuth2AccessToken;

import net.bizlogin.common.service.oauth.OAuthNaverService;

@Service
public class NaverService {
	
	private static final Logger logger = LoggerFactory.getLogger(NaverService.class);
	
	@Inject
	private OAuthNaverService oauthNaverService;
	
	public Map<String, Object> signin(Map<String, Object> param) throws Exception {
		OAuth2AccessToken token = getAccessToken(param);
		logger.debug(token.getRawResponse());
		
		return null;
	}
	
	// access_token, refresh_token, token_type, expires_in
	public OAuth2AccessToken getAccessToken(Map<String, Object> param) throws Exception {
		OAuth2AccessToken token = oauthNaverService.getAccessToken(String.valueOf(param.get("code")));
		return token;
	}
}
