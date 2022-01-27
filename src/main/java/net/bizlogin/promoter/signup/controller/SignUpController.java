package net.bizlogin.promoter.signup.controller;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import net.bizlogin.promoter.signup.service.SignUpService;
import net.mwav.framework.web.RequestLib;

/**
 * 회원가입
 */
@Controller
@RequestMapping("/bizlogin")
public class SignUpController {

	private static final Logger logger = LoggerFactory.getLogger(SignUpController.class);

	@Inject
	private SignUpService signUpService;

	/**
	 * 회원가입 form
	 */
	@RequestMapping(value = "/promoter/signup/form", method = RequestMethod.GET)
	public ModelAndView form() throws Exception {
		logger.debug("/promoter/signup/form");
		return new ModelAndView("/bizlogin/promoter/signup/form");
	}

	/**
	 * 회원가입
	 */
	@RequestMapping(value = "/promoter/signup", method = RequestMethod.POST)
	public ModelAndView signup(@RequestParam Map<String, Object> param, HttpServletRequest request) throws Exception {
		logger.debug("/promoter/signup");

		// 1. MaV의 View를 정의하여 성공시 로그인 페이지로 리다이렉트
		ModelAndView view = new ModelAndView("redirect:/bizlogin/promoter/signin/form");

		// 2. PromoterValueLog_tbl 로그를 위해 최초 IP를 map에 등록
		RequestLib requestLib = RequestLib.getInstance(request);
		param.put("pvlIpAddress", requestLib.getRemoteAddr());

		// 3. 비즈니스 로직 실행
		signUpService.signup(param);
		
		Map<String, Object> promoter = signUpService.getPromoter(param);
		param.put("promoter_id", promoter.get("promoter_id"));

		// 4. 이메일 발송
		param.put("serverUrl", request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort());
		signUpService.sendVerificationMail(param);

		return view;
	}

}
