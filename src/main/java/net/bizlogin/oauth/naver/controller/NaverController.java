package net.bizlogin.oauth.naver.controller;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import net.bizlogin.common.service.oauth.OAuthNaverService;
import net.bizlogin.common.service.oauth.OAuthService;
import net.bizlogin.oauth.naver.service.NaverService;

@Controller
@RequestMapping(value = "/bizlogin")
public class NaverController {

	private static final Logger logger = LoggerFactory.getLogger(NaverController.class);

	@Inject
	private NaverService naverService;

	@Inject
	private OAuthNaverService oauthNaverService;

	@RequestMapping(value = "/oauth/naver/access", method = RequestMethod.GET)
	public RedirectView access(HttpSession session) throws Exception {
		String state = oauthNaverService.generateState();
		session.setAttribute(oauthNaverService.getStateName(), state);
		String authorizationUrl = oauthNaverService.getAuthorizationUrl(state);

		logger.debug("naver state : " + state);
		logger.debug("naver authorization url : " + authorizationUrl);

		RedirectView redirect = new RedirectView();
		redirect.setUrl(authorizationUrl);

		return redirect;
	}

	@RequestMapping(value = "/oauth/naver/signin", method = RequestMethod.GET)
	public ModelAndView signin(@RequestParam Map<String, Object> param, HttpSession session) throws Exception {
		logger.debug("state : " + session.getAttribute("naver_state"));
		logger.debug(param.toString());

		naverService.signin(param);

		return new ModelAndView("redirect:/bizlogin");
	}
}
