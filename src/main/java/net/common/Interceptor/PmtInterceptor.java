package net.common.Interceptor;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class PmtInterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = LoggerFactory.getLogger(PmtInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		logger.info("======================================          START(PmtInterceptor)         ======================================");

		if (logger.isDebugEnabled()) {
			logger.info(" Request URI \t:  " + request.getRequestURI());

			logger.info(request.getRequestURI());
			logger.info("pmtLoginInterceptor에 들어왔다.");
		}

		HttpSession session = request.getSession();

		if(session.getAttribute("promoterId") == null){                            // id가 Null 이거나 없을 경우
			//if(getAutoLogin(request, session)==true) return true; //원래페이지로 감
			 response.sendRedirect("/pmt/pmtLoginForm.mwav");    // 로그인 페이지로 리다이렉트 한다.
		}else{
			return true;
		}

		return super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		logger.debug("모든 것을 수행한 후  promoterInterCeptor에 나갔다.11");

		logger.info("======================================           END(PmtInterceptor)          ======================================\n");
	}


}