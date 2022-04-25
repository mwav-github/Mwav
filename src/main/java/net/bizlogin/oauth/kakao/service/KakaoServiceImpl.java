package net.bizlogin.oauth.kakao.service;

import javax.annotation.PostConstruct;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.scribejava.apis.NaverApi;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2Authorization;
import com.github.scribejava.core.oauth.OAuth20Service;

/**
 * 프로모터 카카오 로그인
 *
 */
@Service
public class KakaoServiceImpl {

	private static final Logger logger = LoggerFactory.getLogger(KakaoServiceImpl.class);

	@Value("${bizlogin.kakao.appKey}")
	private String appKey;

	@Value("${bizlogin.kakao.callbackUrl}")
	private String callbackUrl;

	private OAuth20Service oauthService;

	/**
	 * 카카오 oauthService 생성
	 */
	@PostConstruct
	public void createService() {
		this.oauthService = new ServiceBuilder(appKey).callback(callbackUrl).build(NaverApi.instance());
	}

	/**
	 * 카카오 로그인 인증 url 생성
	 * @param state
	 * @return url
	 */
	public String getAuthorizationUrl(String state) {
		String authorizationUrl = this.oauthService.getAuthorizationUrl(state);
		return authorizationUrl;
	}

	/**
	 * 카카오 로그인
	 * @param auth {code, state}
	 */
	@Transactional(rollbackFor = { Exception.class }, readOnly = false)
	public void signin(OAuth2Authorization auth) {
		logger.debug(oauthService.toString());
	}

}
