package net.bizlogin.cs.notice.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/bizlogin")
public class NoticeController {

	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);

	@RequestMapping(value = "/cs/notice/list", method = RequestMethod.GET)
	public ModelAndView list() throws Exception {
		logger.debug("/bizlogin/cs/notice/list");
		return new ModelAndView("/bizlogin/cs/notice/list");
	}
	
	@RequestMapping(value = "/cs/notice/detail", method = RequestMethod.GET)
	public ModelAndView detail() throws Exception {
		logger.debug("/bizlogin/cs/notice/detail");
		return new ModelAndView("/bizlogin/cs/notice/detail");
	}
}
