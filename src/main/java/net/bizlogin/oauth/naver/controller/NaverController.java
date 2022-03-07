package net.bizlogin.oauth.naver.controller;

import java.util.UUID;

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

import net.bizlogin.oauth.naver.service.NaverServiceImpl;

@Controller
@RequestMapping(value = "/bizlogin")
public class NaverController {

	private static final Logger logger = LoggerFactory.getLogger(NaverController.class);

	@Inject
	private NaverServiceImpl naverService;

	@RequestMapping(value = "/oauth/naver/access", method = RequestMethod.GET)
	public RedirectView access(HttpSession session) throws Exception {
		String state = UUID.randomUUID().toString();
		session.setAttribute(OAuthConstants.STATE, state);
		String authorizationUrl = naverService.getAuthorizationUrl(state);

		logger.debug("naver state : " + state);
		logger.debug("naver authorization url : " + authorizationUrl);

		return new RedirectView(authorizationUrl);
	}

	@RequestMapping(value = "/oauth/naver/signin", method = RequestMethod.GET)
	public ModelAndView signin(@ModelAttribute OAuth2Authorization auth, HttpSession session) throws Exception {
		logger.debug(auth.toString());
		naverService.signin(auth);

		return new ModelAndView("redirect:/bizlogin");
	}
}
