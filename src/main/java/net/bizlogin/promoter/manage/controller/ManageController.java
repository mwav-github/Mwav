package net.bizlogin.promoter.manage.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/bizlogin")
public class ManageController {

	private static final Logger logger = LoggerFactory.getLogger(ManageController.class);
	
	/**
	 * 내 정보
	 */
	@RequestMapping(value = "/promoter/manage/profile", method = RequestMethod.GET)
	public ModelAndView profile() {
		logger.debug("/promoter/manage/profile");
		return new ModelAndView("/bizlogin/promoter/manage/profile");
	}
	
	/**
	 * 이메일 인증
	 */
	@RequestMapping(value = "/promoter/manage/verification", method = RequestMethod.GET)
	public ModelAndView certification() {
		logger.debug("/promoter/manage/verification");
		return new ModelAndView("/bizlogin/promoter/manage/verification");
	}
	
}
