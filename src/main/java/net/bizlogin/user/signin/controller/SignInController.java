package net.bizlogin.user.signin.controller;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public ModelAndView signin(@RequestParam Map<String, Object> param, HttpSession session, RedirectAttributes redirect) throws Exception {
		logger.debug("/bizlogin/user/signin");
		ModelAndView view = new ModelAndView();

		Map<String, Object> result = signInService.signin(param);
		String status = (String) result.get("status");

		switch (status) {
		case "LOGIN_SUCCESS":
			session.setAttribute("bizPromoter", result.get("promoter"));
			view.setViewName("redirect:/bizlogin");
			break;
		case "INVALID_PARAM":
			view.setViewName("redirect:/bizlogin/user/signin/form");
			break;
		case "NOT_CERTIFICATED":
			view.setViewName("redirect:/bizlogin/user/manage/certification");
			break;
		default:
			view.setViewName("redirect:/bizlogin/user/signin/form");
			break;
		}
		redirect.addFlashAttribute("msg", result.get("msg"));
		return view;
	}
}
