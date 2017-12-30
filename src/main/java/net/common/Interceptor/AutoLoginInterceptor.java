package net.common.Interceptor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

//
public class AutoLoginInterceptor extends HandlerInterceptorAdapter {

	 protected Log log = LogFactory.getLog(AutoLoginInterceptor.class);

	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		System.out.println("소셜오토로그인 인셉터 들어옴 " + request.getParameter("autoLoginSub"));
		if(request.getParameter("autoLoginSub")!=null&&request.getParameter("autoLoginSub").equals("on")){
			request.getSession().setAttribute("autoLoginSub", request.getParameter("autoLoginSub"));
		}
		return true;
	}
}