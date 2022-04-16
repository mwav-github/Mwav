package net.common.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AutoLoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		if (request.getParameter("autoLoginChk") != null && request.getParameter("autoLoginChk").equals("on")) {
			request.getSession().setAttribute("autoLoginChk", request.getParameter("autoLoginChk"));
		}
		return true;
	}
}