package net.mwav.member.contrloller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import net.mwav.member.auth.AuthUser;
import net.mwav.member.auth.GoogleAuthHelper;
import net.mwav.member.auth.GoogleAuthentication;
import net.mwav.member.auth.GoogleUser;
import net.mwav.member.auth.UserInfo;
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
	@Autowired private GoogleAuthHelper googleAuthHelper;
	

	@RequestMapping(value = "/accessDenied", method = RequestMethod.GET)
	public String accessDenied(Model model) {
		model.addAttribute("message", "접근 권한이 없음");
		return "accessDenied";
	}
	
	/*@RequestMapping(value = "/auth/callback", method = RequestMethod.GET)
	public String authCallback(@RequestParam(value = "code", required = false) String authCode, 
								@RequestParam("state") String callbackUrl,Model model) {	
		String rdUrl = callbackUrl;

		
		GoogleUser googleUserInfo=null;
		try {
			if(authCode == null) 
				new RuntimeException("Auth Code can't null!!");
			
			googleUserInfo = googleAuthHelper.getUserInfoJson(callbackUrl, authCode);
			
			if(googleUserInfo==null) 
				new RuntimeException("GoogleUserInfo can`t null!");
			
		} catch (Exception e) {
			e.printStackTrace();
			return getAuthResult(callbackUrl, null,false);
		}


		AuthUser user = authService.getAuthUser(googleUserInfo);
		if(user.getState() == State.UNUSED)
			return getAuthResult(callbackUrl, null, false);
		
		return getAuthResult(callbackUrl, user, true);
	}


	private String getAuthResult(String url, AuthUser user, boolean result) {
		StringBuilder builder = new StringBuilder().append("redirect:").append(url);
		
		if(url.contains("?"))
			builder.append("&");
		else 
			builder.append("?");
		if(result) 
			builder.append("token=").append(tokenService.getTimeToken(user));
		else 
			builder.append("token=").append("null");
		
		builder.append("&result=").append(result);
		
		return builder.toString();
	}

	@RequestMapping(value = "/user", method = RequestMethod.GET)
	@ResponseBody
	public UserInfo getUserInfo(@RequestParam("token") String token, 
								@RequestParam(value = "hash", required = false, defaultValue="") String hash, Model model) {
		UserInfo user;
		try{
			int userIdx = tokenService.getUserInfo(token);
			
			if(userIdx == 0)
				throw new RuntimeException("잘못된 token 입력");
			
    		user = (hash.length() == 0) ? authService.getUserInfo(userIdx): authService.getUserInfo(userIdx, hash);
    	}catch(Exception e) {
    		e.printStackTrace();
    		user = UserInfo.createFailUserInfo(e.getMessage());
    	}
		return user;
	}*/

	/**
	 * 로그인이 성공했을 때, callback으로 호출되는 주소 <br />
	 * 인증 코드를 받아서 유저 정보를 받아오며, groups에서 이 사이트에 접근할 권한이 있는지 확인한다. <br />
	 * 접근할 권한이 있다면 security에 인증 정보를 셋팅해 주고, <br />
	 * 없으면 에러 페이지로 넘긴다. <br />
	 * @param authCode
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/authentication.do", method = RequestMethod.GET)
	public String authentication(HttpServletRequest request, Model model, @RequestParam(value = "code", required = false) String authCode, 
						@RequestParam(value = "state", required = false) String callbackUrl) throws IOException {
		System.out.println("authentication!!");
		System.out.println("authCode = "+authCode);
		System.out.println("state = "+callbackUrl);
		System.out.println("request = "+request);
		System.out.println("model = "+model);
		if(authCode == null) {
			return "login.do";
		}
		
		GoogleUser googleUser=null;
		try {
			if(authCode == null) 
				new RuntimeException("Auth Code can't null!!");
			
			googleUser = googleAuthHelper.getUserInfoJson(callbackUrl, authCode);
			
			if(googleUser==null) 
				new RuntimeException("GoogleUserInfo can`t null!");
			
		} catch (Exception e) {
			e.printStackTrace();
			return "accessdenied";
		}
		
		UserInfo googleUserInfo = authService.readUserInfo(authCode);
		if(googleUserInfo==null) {
			throw new RuntimeException("GoogleUserInfo can`t null!");
		}
		UserDetails authInfo=AuthUser.changeUser(googleUserInfo);
		if(authInfo!=null) {
			SecurityContextHolder.getContext().setAuthentication(new GoogleAuthentication(authInfo));
		}
		
		request.getSession().setAttribute("currentUser", googleUserInfo.getName());
		
		return "redirect:/";
	}
	
	
}
