package net.bizlogin.user.signup.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import net.bizlogin.user.signup.service.SignUpService;

/**
 * 회원가입
 */
@Controller
public class SignUpController {

	private static final Logger logger = LoggerFactory.getLogger(SignUpController.class);

	@Inject
	private SignUpService signUpService;

	/**
	 * 회원가입 form
	 */
	@RequestMapping(value = "/bizlogin/user/signup/form", method = RequestMethod.GET)
	public ModelAndView form() throws Exception {
		logger.debug("/bizlogin/user/signup/form");
		return new ModelAndView("/bizlogin/user/signup/form");
	}
	
	/**
	 * 회원가입
	 */
	@RequestMapping(value = "/bizlogin/user/signup", method = RequestMethod.POST)
	public void signup() throws Exception {
		logger.debug("/bizlogin/user/signup");
	}

}
