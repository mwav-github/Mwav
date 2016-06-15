package net.common.logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
//
public class LoggerInterceptor extends HandlerInterceptorAdapter {
	// private final Logger log = LoggerFactory.getLogger(this.getClass());
	//Logger log = Logger.getLogger(this.getClass());

	 protected Log log = LogFactory.getLog(LoggerInterceptor.class);

	// Log4js 설정
	// http://dev.anyframejava.org/docs/anyframe/plugin/essential/core/1.6.0/reference/html/ch21.html
	// http://logging.apache.org/log4j/1.2/apidocs/index.html

	// *전, 후 처리기 만들기 :
	// http://debop.blogspot.kr/2013/02/spring-mvc-controller.html 사이트 참조
	// *인터셉터 로그인 등 사용예제 : http://roqkffhwk.tistory.com/116
	// http://hellogk.tistory.com/m/post/90
	// http://viralpatel.net/blogs/spring-mvc-interceptor-example/

	/*
	 * preHandle() : Controller가 수행되기 전 호출 (이후 Controller를 수행할지 여부를 boolean으로
	 * return 함)
	 * 
	 * postHandle() : Controller가 수행된 후 View를 호출하기 전 호출
	 * 
	 * 
	 * afterCompletion() : View 작업까지 완료된 후 Client에 응답하기 바로 전에 호출됩니다.
	 * (responseBody를 이용할 경우 UI에 이미 값을 전달한 후 해당부분이 호출 됨)
	 * 
	 * 
	 * 메소드 명 return 값 설명
	 * 
	 * preHandle boolean 1. 클라이언트의 요청을 컨트롤러에 전달 하기 전에 호출 2. false 인 경우
	 * intercepter 또는 controller 를 실행 시키지 않고 요청 종료
	 * 
	 * postHandle void 1. 컨트롤러 로직 실행 된 후 호출됨 2. 컨트롤러 실행 도중 error 발생의 경우
	 * postHandle() 는 실행 되지 않음 3. request 로 넘어온 데이터 가공시 많이 쓰임
	 * 
	 * afterCompletion void 1. 컨트롤러 로직 실행 된 후 호출 됨 2. 컨트롤러 실행 도중이나 view 페이지 실행
	 * 도중 error 발생 해도 실행됨 3. 공통 Exception 처리 로직 작성시 많이 쓰임
	 */

	/*
	 * 최초 actionservlet 에서 mapping 가능하다 ~!! 즉 분류별로 나눠서 관리 가능
	 */
	
	/*
	 * redirect 와 response 차이 
	 */
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		log.info("======================================          START         ======================================");
		log.info(" Request URI \t:  " + request.getRequestURI());
		System.out.println("LoggerInterceptor에 들어왔다.");
		if (log.isDebugEnabled()) {
			log.info("======================================          START         ======================================");
			log.info(" Request URI \t:  " + request.getRequestURI());
			System.out.println(request.getRequestURI());
			System.out.println("LoggerInterceptor에 들어왔다.");
		}
		
		request.setAttribute("msm", "출력되나");
		/*
		 * 1. 전체 url 중 /admins /Admins 만 substring 등을 이용해서 조건 부여 2. 그러나 여기서 계속
		 * redirect 먹히지 않음 3. url.substring // url.equals 에서 계속안먹음 원인 파악 불가 4.
		 * actionservlet에서 그냥 매핑설정하여 /admins , /Admins일때 들어오도록 설정
		 */

		/*try {
			if (request.getSession().getAttribute("staff_id") == null) {
				System.out.println("콜");
				response.sendRedirect("/Admins/CompanyMgr/Staff/StfLogin.jsp");
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}*/
		/*
		 * System.out.println("LoggerInterceptor에 들어왔다."); if
		 * (log.isDebugEnabled()) { log.debug(
		 * "======================================          START         ======================================"
		 * ); log.debug(" Request URI \t:  " + request.getRequestURI());
		 * System.out.println(request.getRequestURI());
		 * System.out.println("LoggerInterceptor에 들어왔다."); }
		 */
		// String contextPath = request.getContextPath();

		// System.out.println("contextPath="+command);

		/*
		 * else 에는 세션있으므로 메인페이지로 포워딩 진행
		 * 
		 * staff 말고 admin 쪽도 동일하게
		 */

		/*
		 * String URL = request.getRequestURL().toString(); String URI =
		 * request.getRequestURI().toString(); String command_1 =
		 * URI.substring(0, 6); String command_2 = URI.substring(0, 7);
		 * System.out.println("command_1=" + command_1);
		 * System.out.println("command_2=" + command_2);
		 * 
		 * if ("/Admins".equals(request.getRequestURI().substring(0, 7))) { //if
		 * (request.getSession().getAttribute("staff_id") == null) {
		 * System.out.println("콜");
		 * response.sendRedirect("/Admins/CompanyMgr/Staff/StfLogin.jsp");
		 * response.flushBuffer(); return false;
		 * 
		 * // System.out.println(response.getBufferSize()); //
		 * response.sendRedirect("/admins/LeftMenu.do");
		 * 
		 * // RequestDispatcher rd = //
		 * request.getRequestDispatcher("/Admins/CompanyMgr/Staff/StfLogin.jsp"
		 * ); // rd.forward(request, response);
		 * 
		 * // response.sendRedirect(URL); //
		 * http://antiqueh.tistory.com/entry/%EC%
		 * 9E%90%EB%B0%94-Servlet-responsesendRedirect-%EC%82%AC%EC%9A%A9%EC%8B%9C-%EC%9C%A0%EC%9D%98%EC%A0%90
		 * // https://blog.outsider.ne.kr/188 // sendRedirect 사용 주의점 //
		 * http://kdsr2z0.github.io/response_sendRedirect/ // return false; //}
		 * 
		 * }
		 */

		/*
		 * if (URI.length() >= 7) {
		 * 
		 * String command_1 = URI.substring(0, 6); String command_2 =
		 * URI.substring(0, 7); System.out.println("command_1=" + command_1);
		 * System.out.println("command_2=" + command_2);
		 * 
		 * 
		 * // String command = URI.IndexOf("/admin");
		 * System.out.println("String URL=" + URL);
		 * System.out.println("String URI=" + URI); if
		 * (command_2.equals("/Admins")) { System.out.println("권한부여 필요.");
		 * 
		 * if (request.getSession().getAttribute("staff_id") == null) {
		 * System.out.println("콜");
		 * response.sendRedirect("/Admins/CompanyMgr/Staff/StfLogin.jsp");
		 * return false; // System.out.println(response.getBufferSize()); //
		 * response.sendRedirect("/admins/LeftMenu.do");
		 * 
		 * 
		 * // RequestDispatcher rd = //
		 * request.getRequestDispatcher("/Admins/CompanyMgr/Staff/StfLogin.jsp"
		 * ); // rd.forward(request, response);
		 * 
		 * 
		 * // response.sendRedirect(URL); //
		 * http://antiqueh.tistory.com/entry/%EC%
		 * 9E%90%EB%B0%94-Servlet-responsesendRedirect-%EC%82%AC%EC%9A%A9%EC%8B%9C-%EC%9C%A0%EC%9D%98%EC%A0%90
		 * // https://blog.outsider.ne.kr/188 // sendRedirect 사용 주의점 //
		 * http://kdsr2z0.github.io/response_sendRedirect/ // return false; } }
		 * }
		 */

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
		System.out.println("모든 것을 수행한 후 LoggerInterceptor에 나갔다.11");
		
		log.info("======================================           END          ======================================\n");

		
		
	}
	
}