package net.common.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class MemberInterceptor implements HandlerInterceptor {

	protected Log log = LogFactory.getLog(MemberInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		String param = request.getParameter("mode");
		String referer = request.getHeader("referer");
		HttpSession session = request.getSession(true);
		
		switch (param) {
		case "Default":
			session.setAttribute("step", "1");
			break;
		case "SMbrInput":
			if (session.getAttribute("step") == null || referer == null || !(session.getAttribute("step").toString().equals("1") || session.getAttribute("step").toString().equals("2"))) {
				response.sendRedirect("/MasterPage_1.mwav?mode=Default");
			} else {
				session.setAttribute("step", "2");				
			}
			break;
		case "SDMbrInput":
			if (session.getAttribute("step") == null || referer == null || !session.getAttribute("step").toString().equals("2")) {
				response.sendRedirect("/MasterPage_1.mwav?mode=Default");
			}
			break;
		}	
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
		// TODO Auto-generated method stub

	}

}
