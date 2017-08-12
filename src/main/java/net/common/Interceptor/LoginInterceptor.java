package net.common.Interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.mwav.member.service.MemberService;
import net.mwav.member.vo.Member_tbl_VO;
import net.mwav.statistics.controller.StatisticsController;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;
//
public class LoginInterceptor extends HandlerInterceptorAdapter {

	 protected Log log = LogFactory.getLog(LoginInterceptor.class);
	 
	 @Autowired
		private StatisticsController statisticsController;
	 @Autowired
	 	private MemberService memberService;
	 
	 
	 
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		log.info("======================================          START(LoginInterceptor)         ======================================");
		log.info(" Request URI \t:  " + request.getRequestURI());
		System.out.println("LoginInterceptor에 들어왔다.");
		//디버그 레벨일때 true
		//http://planmaster.tistory.com/66
		if (log.isDebugEnabled()) {
			log.info("======================================          START(LoginInterceptor)         ======================================");
			log.info(" Request URI \t:  " + request.getRequestURI());
			System.out.println(request.getRequestURI());
			System.out.println("LoginInterceptor에 들어왔다.");
		}
		
		HttpSession session = request.getSession();
		String returnUrl = request.getRequestURI(); // 현재 URL 
		if(session.getAttribute("member") == null){                            // id가 Null 이거나 없을 경우
			if(getAutoLogin(request, session)==true) return true; //원래페이지로 감 
			else response.sendRedirect("/MasterPage.mwav?mode=SMbrLogin&returnUrl="+returnUrl);    // 로그인 페이지로 리다이렉트 한다.	
		}else{
			return true; 
		}

		return super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("모든 것을 수행한 후 LoginInterceptor에 나갔다.11");
		
		log.info("======================================           END(LoginInterceptor)          ======================================\n");

		
		
	}
	
	private Boolean getAutoLogin(HttpServletRequest request, HttpSession session) {
		Cookie loginCookie = WebUtils.getCookie(request, "autoLogin");
		if (loginCookie != null) {
			log.info("자동로그인 실행 중");			
			Member_tbl_VO member = memberService.selectAutoLogin(Integer.parseInt(loginCookie.getValue()));
			log.info("member의 값은"+ member.toString());
			if (member != null) {
				log.info("자동로그인 VO 가져옴");
				session.setAttribute("member", member);
				return true;
			}
		}
		return false;
	}
	
}