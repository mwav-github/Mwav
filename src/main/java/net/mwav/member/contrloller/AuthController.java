package net.mwav.member.contrloller;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import net.mwav.member.auth.AuthUser;
import net.mwav.member.auth.GoogleAuthentication;
import net.mwav.member.auth.UserInfo;
import net.mwav.member.auth.VersionProperty;
import net.mwav.member.service.AuthService;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class AuthController {
	
	private static final Logger logger = Logger.getLogger(AuthController.class);
	
	@Autowired private AuthService authService;
	
	@Autowired 
	private VersionProperty property;

	@RequestMapping(value = "/google", method = RequestMethod.GET)
	public String login(Model model) {
		model.addAttribute("mainUrl", property.getUrl());
		model.addAttribute("apiUrl", property.getApiUrl());
		return "login";
	}

	@RequestMapping(value = "/accessDenied", method = RequestMethod.GET)
	public String accessDenied(Model model) {
		model.addAttribute("message", "접근 권한이 없음");
		return "accessDenied";
	}

	/**
	 * 로그인이 성공했을 때, callback으로 호출되는 주소 <br />
	 * 인증 코드를 받아서 유저 정보를 받아오며, groups에서 이 사이트에 접근할 권한이 있는지 확인한다. <br />
	 * 접근할 권한이 있다면 security에 인증 정보를 셋팅해 주고, <br />
	 * 없으면 에러 페이지로 넘긴다. <br />
	 * @param authCode
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/authentication", method = RequestMethod.GET)
	public String authentication(HttpServletRequest request, Model model, @RequestParam(value = "token", required = false) String authCode, 
						@RequestParam(value = "result", required = false) boolean result) throws IOException {
		logger.info("authentication!!");
		if(authCode == null) {
			return "login";
		}
		
		UserInfo googleUserInfo = authService.readUserInfo(authCode);
		if(googleUserInfo==null) {
			throw new RuntimeException("GoogleUserInfo can`t null!");
		}
		UserDetails authInfo=AuthUser.changeUser(googleUserInfo);
		if(authInfo!=null) {
			SecurityContextHolder.getContext().setAuthentication(new GoogleAuthentication(authInfo));
		}
		
		request.getSession().setAttribute("currentUserUid", googleUserInfo.getName());
		
		return "redirect:/";
	}
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "redirect:/login";
	}
	
}
