package net.bizlogin.promoter.signin.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import net.bizlogin.common.service.OAuthService;
import net.bizlogin.promoter.signin.service.SignInService;
import net.mwav.framework.web.RequestLib;

/**
 * 로그인
 */
@Controller
@RequestMapping("/bizlogin")
public class SignInController {

	private static final Logger logger = LoggerFactory.getLogger(SignInController.class);

	@Inject
	private SignInService signInService;
	
	@Inject
	private List<OAuthService> oauthservices;

	/**
	 * 로그인 form
	 */
	@RequestMapping(value = "/promoter/signin/form", method = RequestMethod.GET)
	public ModelAndView form(HttpSession session) throws Exception {
		logger.debug("/bizlogin/promoter/signin/form");
		ModelAndView mav = new ModelAndView("/bizlogin/promoter/signin/form");
		
		String state;
		for (OAuthService o : oauthservices) {
			state = o.generateState();
			session.setAttribute(o.getStateName(), state);
			mav.addObject(o.getAuthorizationUrlName(), o.getAuthorizationUrl(state));
		}
		
		return mav;
	}

	/**
	 * 로그인 
	 * @param param {pmtLoginId, pmtLoginPw, token : Recaptcha 인증토큰}
	 */
	@RequestMapping(value = "/promoter/signin", method = RequestMethod.POST)
	public ModelAndView signin(@RequestParam Map<String, Object> param, HttpSession session,
			RedirectAttributes redirect) throws Exception {
		logger.debug("/bizlogin/promoter/signin");
		ModelAndView view = new ModelAndView();

		Map<String, Object> result = signInService.signin(param);
		String status = (String) result.get("status");

		switch (status) {
		case "LOGIN_SUCCESS":
			session.setAttribute("promoter", result.get("promoter"));
			view.setViewName("redirect:/bizlogin");
			break;
		case "NOT_CERTIFICATED":
			session.setAttribute("promoter", result.get("promoter"));
			view.setViewName("redirect:/bizlogin/promoter/manage/verification");
			break;
		case "INVALID_PARAM":
			view.setViewName("redirect:/bizlogin/promoter/signin/form");
			break;
		default:
			view.setViewName("redirect:/bizlogin/promoter/signin/form");
			break;
		}
		redirect.addFlashAttribute("msg", result.get("msg"));
		return view;
	}

	/**
	 * 카카오 로그인
	 */
	@RequestMapping(value = "/promoter/signin/kakao", method = RequestMethod.POST)
	@ResponseBody
	public String signInKakao(@RequestBody Map<String, Object> param, HttpServletRequest request) throws Exception {
		RequestLib requestLib = RequestLib.getInstance(request);
		param.put("spIpAddress", requestLib.getRemoteAddr());

		Map<String, Object> promoter = signInService.signInKakao(param);
		HttpSession session = request.getSession();
		session.setAttribute("promoter", promoter);
		return (String) promoter.get("spPromoterId");
	}

}
