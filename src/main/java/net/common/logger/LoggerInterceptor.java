package net.common.logger;

import java.util.List;

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

public class LoggerInterceptor extends HandlerInterceptorAdapter {
	// private final Logger log = LoggerFactory.getLogger(this.getClass());
	// Logger log = Logger.getLogger(this.getClass());

	List<String> urls;

	public void setUrls(List urls) {
		this.urls = urls;
	}

	protected Log log = LogFactory.getLog(LoggerInterceptor.class);

	@Autowired
	private StatisticsController statisticsController;

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
		HttpSession session = request.getSession();
		String uploadRootPath = session.getServletContext().getRealPath("\\");
		// 서버에서 띄우면 (호스팅서버) 루트에러 .
		String url = request.getRequestURI();

		System.out.println("루트 경로" + uploadRootPath);
		// DomReadXMLFile.xmlParser("/xConfig/general.xml.config");
		DomReadXMLFile
				.xmlParser(uploadRootPath + "/xConfig/general.xml.config");
		statisticsController.insertStatics(request);

		// 디버그 레벨일때 true
		// http://planmaster.tistory.com/66
		if (log.isDebugEnabled()) {
			log.info("======================================          START         ======================================");
			log.info(" Request URI \t:  " + request.getRequestURI());
			System.out.println(request.getRequestURI());
			System.out.println("LoggerInterceptor에 들어왔다.");
		}
		System.out.println("urls.size()" + urls.size());

	/*	int pos = url.lastIndexOf(".");
		String ext = url.substring(pos + 1);
		System.out.println("확장자 제외" + ext);
		
		if(ext.equals("jsp")){
			System.out.println("jsp 파일이다.");
			statisticsController.redirectController(request, ext);
		}*/

		for (int i = 0; i < urls.size(); i++) {
			System.out.println("== URL : " + urls.get(i)
					+ " ============================");
			if (url.matches(urls.get(i))) {
				{
					/*
					 * request.getRequestURI(); //프로젝트경로부터 파일까지의 경로값을 얻어옴
					 * (/test/index.jsp) request.getContextPath(); //프로젝트의 경로값만
					 * 가져옴(/test) request.getRequestURL(); //전체 경로를 가져옴
					 * (http://localhost:8080/test/index.jsp)
					 * request.getServletPath(); //파일명 (/index.jsp)
					 */
					System.out
							.println("== 인증 체크가 필요 있는 URL ============================");
					System.out.println("== URL : " + urls.get(i)
							+ " ============================");
					String id = "";
					String returnUrl = "";
					try {

						id = (String) session.getAttribute("member_id"); // request에서
																			// id
																			// 파라미터를
																			// 가져온다
						System.out.println("세션아이디" + id);

						returnUrl = request.getRequestURI(); // 현재 URL
						if (id == null || id.equals("")) { // id가 Null 이거나 없을 경우
							System.out.println("이쪽으로 리다이렉트");
							// response.sendRedirect("/CommonApps/Member/MbrLogin.jsp");
							// // 로그인 페이지로 리다이렉트 한다.
							System.out.println("리턴url" + uploadRootPath
									+ "MasterPage.jsp?mode=SMbrLogin");
							response.sendRedirect("/hightsofts/hightsofts.mwav");
							// response.sendRedirect("/hightsofts/hightsofts.mwav);
							// return false;
							/*
							 * RequestDispatcher rd =
							 * request.getRequestDispatcher
							 * ("/Admins/CompanyMgr/Staff/StfLogin.jsp" );
							 * rd.forward(request, response);
							 */
							return false;
							// statisticsController.redirectController(request);
							// return false;
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}

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

		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("모든 것을 수행한 후 LoggerInterceptor에 나갔다.11");

		log.info("======================================           END          ======================================\n");

	}

}