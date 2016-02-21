package net.common.logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import net.common.logger.LoggerInterceptor;

//
public class LoggerInterceptor extends HandlerInterceptorAdapter {
	// private final Logger log = LoggerFactory.getLogger(this.getClass());
	Logger log = Logger.getLogger(this.getClass());

	// protected Log log = LogFactory.getLog(LoggerInterceptor.class);

	// http://dev.anyframejava.org/docs/anyframe/plugin/essential/core/1.6.0/reference/html/ch21.html

	// *전, 후 처리기 만들기 :
	// http://debop.blogspot.kr/2013/02/spring-mvc-controller.html 사이트 참조
	// *인터셉터 로그인 등 사용예제 : http://roqkffhwk.tistory.com/116
	// http://hellogk.tistory.com/m/post/90
	// http://viralpatel.net/blogs/spring-mvc-interceptor-example/

	/*
	 * preHandle() : Controller가 수행되기 전 호출 (이후 Controller를 수행할지 여부를 boolean으로
	 * return 함) postHandle() : Controller가 수행된 후 View를 호출하기 전 호출
	 * afterCompletion() : View 작업까지 완료한 후 호출 (responseBody를 이용할 경우 UI에 이미 값을
	 * 전달한 후 해당부분이 호출 됨)
	 * 
	 * 
	 * 메소드 명 return 값 설명 preHandle boolean 1. 클라이언트의 요청을 컨트롤러에 전달 하기 전에 호출 2.
	 * false 인 경우 intercepter 또는 controller 를 실행 시키지 않고 요청 종료 postHandle void 1.
	 * 컨트롤러 로직 실행 된 후 호출됨 2. 컨트롤러 실행 도중 error 발생의 경우 postHandle() 는 실행 되지 않음 3.
	 * request 로 넘어온 데이터 가공시 많이 쓰임 afterCompletion void 1. 컨트롤러 로직 실행 된 후 호출 됨
	 * 2. 컨트롤러 실행 도중이나 view 페이지 실행 도중 error 발생 해도 실행됨 3. 공통 Exception 처리 로직 작성시
	 * 많이 쓰임
	 */
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {

		System.out.println(request.getRequestURI());
		System.out.println(request.getRequestURL());
		System.out.println("LoggerInterceptor에 들어왔다.");
		if (log.isDebugEnabled()) {
			log.debug("======================================          START         ======================================");
			log.debug(" Request URI \t:  " + request.getRequestURI());
			System.out.println(request.getRequestURI());
			System.out.println("LoggerInterceptor에 들어왔다.");
		}
		String URL = request.getRequestURL().toString();
		String URI = request.getRequestURI().toString();
		// String contextPath = request.getContextPath();

		if (URI.length() >= 7) {
			String command_1 = URI.substring(0, 6);
			String command_2 = URI.substring(0, 7);
			System.out.println("command_1=" + command_1);
			System.out.println("command_2=" + command_2);

			// String command = URI.IndexOf("/admin");
			System.out.println("String URL=" + URL);
			System.out.println("String URI=" + URI);

			// System.out.println("contextPath="+command);

			if (command_1.equals("/admin") || command_2.equals("/Admins")) {
				System.out.println("권한부여 필요.");

				HttpSession session = request.getSession();
				try {
					if (session.getAttribute("staff_id") == null) {
						System.out.println("콜");
						response.sendRedirect("/Admins/CompanyMgr/Staff/StfLogin");
						return false;
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		// if(request.getRequestURL() == "/admin")
		/*
		 * try{ if(request.getSession().getAttribute("mbrLoginId") == null){
		 * //로그인페이지로 리다이렉트 response.sendRedirect("/"); return false; }
		 * }catch(Exception e){ e.printStackTrace(); }
		 */
		/*
		 * try { //admin이라는 세션key를 가진 정보가 널일경우 로그인페이지로 이동
		 * if(request.getSession().getAttribute("admin") == null ){
		 * response.sendRedirect("/"); return false; } } catch (Exception e) {
		 * e.printStackTrace(); } //admin 세션key 존재시 main 페이지 이동 return true;
		 */

		return super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("LoggerInterceptor에 나갔다.11");
		log.debug("======================================           END          ======================================\n");
		log.info("======================================           END          ======================================\n");

	}
}