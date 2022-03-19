package net.bizlogin.oauth.kakao.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.scribejava.apis.KakaoApi;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2Authorization;
import com.github.scribejava.core.oauth.OAuth20Service;

import net.bizlogin.oauth.AbstractOAuthService;

@Service
public class KakaoServiceImpl extends AbstractOAuthService {

	private static final Logger logger = LoggerFactory.getLogger(KakaoServiceImpl.class);

	@Value("${bizlogin.kakao.appKey}")
	private String appKey;

	@Value("${bizlogin.kakao.callbackUrl}")
	private String callbackUrl;
	
	@Transactional(rollbackFor = { Exception.class }, readOnly = false)
	public void signin(OAuth2Authorization auth) {
		logger.debug(oauthService.toString());
	}
	
	@Override
	public OAuth20Service createService() {
		OAuth20Service oauthService = new ServiceBuilder(appKey).callback(callbackUrl).build(KakaoApi.instance());
		return oauthService;
	}

	@Override
	public boolean isValidToken(String token) {
		return true;
	}

}
