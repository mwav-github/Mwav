package net.common.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * 프로모터 인증여부 확인
 * @author 공태현
 *
 */
public class PmtInterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = LoggerFactory.getLogger(PmtInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();

		// id가 Null 이거나 없을 경우 로그인 페이지로 redirect
		if (session.getAttribute("promoterId") == null) {
			logger.debug("promoterId is null. redirect to login page");
			response.sendRedirect("/pmt/pmtLoginForm.mwav");
		} else {
			return true;
		}

		return super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

	}

}