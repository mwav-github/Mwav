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

import net.bizlogin.oauth.naver.service.NaverServiceImpl;
import net.mwav.framework.web.RequestLib;

@Controller
@RequestMapping(value = "/bizlogin")
public class NaverController {

	private static final Logger logger = LoggerFactory.getLogger(NaverController.class);

	@Inject
	private NaverServiceImpl naverServiceImpl;
	
	/**
	 * 네이버 로그인 접근
	 */
	@RequestMapping(value = "/oauth/naver/access", method = RequestMethod.GET)
	public RedirectView access(HttpSession session) {
		String state = UUID.randomUUID().toString();
		session.setAttribute(OAuthConstants.STATE, state);
		String authorizationUrl = naverServiceImpl.getAuthorizationUrl(state);

		return new RedirectView(authorizationUrl);
	}
	
	/**
	 * 네이버 로그인 후 callback되는 경로 
	 * @param auth {code, state}
	 */
	@RequestMapping(value = "/oauth/naver/signin", method = RequestMethod.GET)
	public ModelAndView signin(@ModelAttribute OAuth2Authorization auth, HttpServletRequest request) throws JsonParseException, JsonMappingException, IOException, InterruptedException, ExecutionException {
		logger.debug("/bizlogin/oauth/naver/signin");
		RequestLib requestLib = RequestLib.getInstance(request);
		
		Map<String, Object> param = new HashMap<>();
		param.put("spIpAddress", requestLib.getRemoteAddr());
		
		naverServiceImpl.signin(auth, param);
		return new ModelAndView("redirect:/bizlogin");
	}
}
