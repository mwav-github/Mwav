package net.bizlogin.common.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CommonController {

	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);

	@RequestMapping(value = "/bizlogin")
	public ModelAndView home() {
		logger.debug("/bizlogin");
		return new ModelAndView("/bizlogin/home/index");
	}
}
