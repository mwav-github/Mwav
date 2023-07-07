package net.bizlogin.goods.order.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class OrderController {

	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);

	@RequestMapping(value = "/bizlogin/goods/order/wishList", method = RequestMethod.GET)
	public ModelAndView wishList() {
		logger.debug("/bizlogin/goods/order/wishList");
		return new ModelAndView("/bizlogin/goods/order/wishList");
	}
}
