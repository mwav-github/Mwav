package net.bizlogin.goods.catalog.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/bizlogin")
public class CatalogController {

	private static final Logger logger = LoggerFactory.getLogger(CatalogController.class);

	@RequestMapping(value = "/goods/catalog/frontList", method = RequestMethod.GET)
	public ModelAndView frontList() throws Exception {
		logger.debug("/bizlogin/goods/catalog/frontList");
		return new ModelAndView("/bizlogin/goods/catalog/frontList");
	}

	@RequestMapping(value = "/goods/catalog/list", method = RequestMethod.GET)
	public ModelAndView list() {
		logger.debug("/bizlogin/goods/catalog/list");
		return new ModelAndView("/bizlogin/goods/catalog/list");
	}

	@RequestMapping(value = "/goods/catalog/detail", method = RequestMethod.GET)
	public ModelAndView detail() {
		logger.debug("/bizlogin/goods/catalog/detail");
		return new ModelAndView("/bizlogin/goods/catalog/detail");
	}

	@RequestMapping(value = "/goods/catalog/posting", method = RequestMethod.GET)
	public ModelAndView posting() {
		logger.debug("/bizlogin/goods/catalog/posting");
		return new ModelAndView("/bizlogin/goods/catalog/posting");
	}
}
