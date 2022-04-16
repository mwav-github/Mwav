package net.bizlogin.promoter.signout.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/bizlogin")
public class SignOutController {

	@RequestMapping(value = "/promoter/signout/kakao")
	@ResponseBody
	public String signOutKakao(HttpSession session) throws Exception {
		Object obj = session.getAttribute("promoter");

		if (obj != null) {
			session.removeAttribute("promoter");
			session.invalidate();
		}
		return "OK";
	}
}
