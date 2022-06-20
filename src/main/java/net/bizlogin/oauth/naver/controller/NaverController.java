package net.bizlogin.oauth.naver.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ExecutionException;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.github.scribejava.core.model.OAuth2Authorization;
import com.github.scribejava.core.model.OAuthConstants;

import net.bizlogin.oauth.naver.service.NaverService;
import net.mwav.framework.web.RequestLib;

/**
 * 프로모터 네이버 로그인 
 *
 */
@Controller
@RequestMapping(value = "/bizlogin")
public class NaverController {

	private static final Logger logger = LoggerFactory.getLogger(NaverController.class);

	@Inject
	private NaverService naverService;

	/**
	 * 네이버 로그인 인증 사이트 접근
	 */
	@RequestMapping(value = "/oauth/naver/access", method = RequestMethod.GET)
	public RedirectView access(HttpSession session) {
		logger.debug("/bizlogin/oauth/naver/access");

		String state = UUID.randomUUID().toString();
		session.setAttribute(OAuthConstants.STATE, state);
		String authorizationUrl = naverService.getAuthorizationUrl(state);

		return new RedirectView(authorizationUrl);
	}

	/**
	 * 네이버 로그인
	 * @param auth {code, state}
	 */
	@RequestMapping(value = "/oauth/naver/signin", method = RequestMethod.GET)
	public ModelAndView signin(@ModelAttribute OAuth2Authorization auth, HttpServletRequest request, HttpSession session) throws JsonParseException, JsonMappingException, IOException, InterruptedException, ExecutionException {
		logger.debug("/bizlogin/oauth/naver/signin");

		Map<String, Object> param = new HashMap<>();
		RequestLib requestLib = RequestLib.getInstance(request);
		param.put("spIpAddress", requestLib.getRemoteAddr());
		
		Map<String, Object> result = naverService.signin(auth, param);
		session.setAttribute("promoter", result.get("promoter"));
		
		return new ModelAndView("redirect:/bizlogin");
	}
}
