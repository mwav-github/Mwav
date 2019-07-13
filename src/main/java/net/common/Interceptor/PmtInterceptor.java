package net.common.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

//
public class PmtInterceptor extends HandlerInterceptorAdapter {

	 protected Log log = LogFactory.getLog(PmtInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		log.info("======================================          START(PmtInterceptor)         ======================================");

		if (log.isDebugEnabled()) {
			log.info(" Request URI \t:  " + request.getRequestURI());

			log.info(request.getRequestURI());
			log.info("pmtLoginInterceptor에 들어왔다.");
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
		System.out.println("모든 것을 수행한 후  promoterInterCeptor에 나갔다.11");

		log.info("======================================           END(PmtInterceptor)          ======================================\n");
	}


}