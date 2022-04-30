package net.bizlogin.oauth.kakao.controller;

import java.io.IOException;
import java.util.UUID;
import java.util.concurrent.ExecutionException;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.github.scribejava.core.model.OAuth2Authorization;
import com.github.scribejava.core.model.OAuthConstants;

import net.bizlogin.oauth.kakao.service.KakaoService;

/**
 * 프로모터 카카오 로그인
 *
 */
@Controller
@RequestMapping(value = "/bizlogin")
public class KakaoController {

	private static final Logger logger = LoggerFactory.getLogger(KakaoController.class);

	@Inject
	private KakaoService kakaoService;

	/**
	 * 카카오 로그인 인증 사이트 접근
	 */
	@RequestMapping(value = "/oauth/kakao/access", method = RequestMethod.GET)
	public RedirectView access(HttpSession session) {
		logger.debug("/bizlogin/oauth/kakao/access");
		String state = UUID.randomUUID().toString();
		session.setAttribute(OAuthConstants.STATE, state);
		String authorizationUrl = kakaoService.getAuthorizationUrl(state);

		return new RedirectView(authorizationUrl);
	}

	/**
	 * 카카오 로그인
	 * @param auth {code, state}
	 */
	@RequestMapping(value = "/oauth/kakao/signin", method = RequestMethod.GET)
	public ModelAndView signin(@ModelAttribute OAuth2Authorization auth, HttpSession session) throws IOException, InterruptedException, ExecutionException {
		logger.debug("/bizlogin/oauth/kakao/signin");
		kakaoService.signin(auth);

		return new ModelAndView("redirect:/bizlogin");
	}
}
