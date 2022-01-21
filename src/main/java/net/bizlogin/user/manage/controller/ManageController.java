package net.bizlogin.user.manage.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ManageController {

	private static final Logger logger = LoggerFactory.getLogger(ManageController.class);
	
	/**
	 * 내 정보
	 */
	@RequestMapping(value = "/bizlogin/user/manage/profile", method = RequestMethod.GET)
	public ModelAndView profile() throws Exception {
		logger.debug("/bizlogin/user/manage/profile");
		return new ModelAndView("/bizlogin/user/manage/profile");
	}
	
	/**
	 * 이메일 인증
	 */
	@RequestMapping(value = "/bizlogin/user/manage/certification", method = RequestMethod.GET)
	public ModelAndView certification() throws Exception {
		logger.debug("/bizlogin/user/manage/certification");
		return new ModelAndView("/bizlogin/user/manage/certification");
	}
}
