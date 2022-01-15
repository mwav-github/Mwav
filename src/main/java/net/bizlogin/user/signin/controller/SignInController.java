package net.bizlogin.user.signin.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import net.bizlogin.user.signin.service.SignInService;

/**
 * 로그인
 */
@Controller
public class SignInController {

	private static final Logger logger = LoggerFactory.getLogger(SignInController.class);

	@Inject
	private SignInService signInService;

	/**
	 * 로그인 form
	 */
	@RequestMapping(value = "/bizlogin/user/signin/form", method = RequestMethod.GET)
	public ModelAndView form() throws Exception {
		logger.debug("/bizlogin/user/signin/form");
		return new ModelAndView("/bizlogin/user/signin/form");
	}
	
	/**
	 * 로그인
	 */
	@RequestMapping(value = "/bizlogin/user/signin", method = RequestMethod.POST)
	public void signin() throws Exception {
		logger.debug("/bizlogin/user/signin");
	}
}
