package net.common.logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.mwav.common.module.Common_Utils;
import net.mwav.common.module.DomReadXMLFile;
import net.mwav.statistics.controller.StatisticsController;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
//
public class LoginInterceptor extends HandlerInterceptorAdapter {

	 protected Log log = LogFactory.getLog(LoginInterceptor.class);
	 
	 @Autowired
		private StatisticsController statisticsController;

	 
	 
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
		

		return super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("모든 것을 수행한 후 LoginInterceptor에 나갔다.11");
		
		log.info("======================================           END(LoginInterceptor)          ======================================\n");

		
		
	}
	
}