package net.common.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		String returnUrl = request.getRequestURI();

		logger.debug("====================================== START ======================================");
		logger.debug("url : " + returnUrl);
		logger.debug("member : " + session.getAttribute("member"));
		logger.debug("====================================== END ======================================\n");

		if (session.getAttribute("member") == null) {
			response.sendRedirect("/MasterPage.mwav?mode=SMbrLogin&returnUrl=" + returnUrl);
		} else {
			return true;
		}

		return super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
	}

}