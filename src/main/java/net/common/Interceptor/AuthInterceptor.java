package net.common.Interceptor;

import java.net.InetAddress;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.mwav.common.module.Common_Utils;
import net.mwav.common.module.DomReadXMLFile;
import net.mwav.member.vo.Member_tbl_VO;
import net.mwav.statistics.controller.StatisticsController;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

//

public class AuthInterceptor extends HandlerInterceptorAdapter {
	// private final Logger log = LoggerFactory.getLogger(this.getClass());
	// Logger log = Logger.getLogger(this.getClass());
	@Autowired
	Member_tbl_VO member_tbl_VO;

	List<String> urls;

	public void setUrls(List urls) {
		this.urls = urls;
	}

	protected Log log = LogFactory.getLog(AuthInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		log.info("======================================          START         ======================================");
		log.info(" Request URI \t:  " + request.getRequestURI());

		String member_id = null;
		// member_id 및 비교할 값.
		String key_id = "";
		String returnUrl = "";
		String url = request.getRequestURI();
		String staff = null;
		member_tbl_VO = null;
		try {

			HttpSession session = request.getSession();
			if (member_tbl_VO != null) {
				member_id = String.valueOf(member_tbl_VO.getMember_id());
			}
			staff = (String) session.getAttribute("staff");
			// 디버그 레벨일때 true
			// http://planmaster.tistory.com/66
			if (log.isDebugEnabled()) {
				log.info("======================================          START         ======================================");
				log.info(" Request URI \t:  " + request.getRequestURI());
				// System.out.println(request.getRequestURI());
				// System.out.println("LoggerInterceptor에 들어왔다.");
			}
			log.info("urls.size()" + urls.size());

			/*
			 * int pos = url.lastIndexOf("."); String ext = url.substring(pos +
			 * 1); System.out.println("확장자 제외" + ext);
			 * 
			 * if(ext.equals("jsp")){ System.out.println("jsp 파일이다.");
			 * statisticsController.redirectController(request, ext); }
			 */

			// Admin(관리자) 회원 관리
			String auth_url = request.getRequestURI().substring(0, 7); // 현재 URL
			System.out.println("auth_url" + auth_url);
			// staff 권한 체크.
			key_id = staff;

			System.out.println("staff" + staff);
			// System.out.println("returnUrl" + returnUrl);
			if (auth_url.equals("/Admins")) {
				if (key_id == null || key_id.equals("")
						|| key_id.equals("null")) {
					// Admins/CompanyMgr/Staff/StfLogin.jsp 이경우에도 들어온다.
					String Referer = request.getHeader("referer");
					returnUrl = Referer;
					System.out.println("returnUrl" + returnUrl);
					response.sendRedirect("/Admins/CompanyMgr/Staff/StfLogin.mwav?returnUrl="
							+ returnUrl);

					return false;
				}
			} else {
				// 일반회원 관리

				for (int i = 0; i < urls.size(); i++) {
					// System.out.println("== URL : " + urls.get(i)+
					// " ============================");
					if (url.matches(urls.get(i))) {
						{
							/*
							 * request.getRequestURI(); //프로젝트경로부터 파일까지의 경로값을
							 * 얻어옴 (/test/index.jsp) request.getContextPath();
							 * //프로젝트의 경로값만 가져옴(/test) request.getRequestURL();
							 * //전체 경로를 가져옴
							 * (http://localhost:8080/test/index.jsp)
							 * request.getServletPath(); //파일명 (/index.jsp)
							 */
							// System.out.println("== 인증 체크가 필요 있는 URL ============================");
							// System.out.println("== URL : " + urls.get(i)+
							// " ============================");

							try {

								key_id = member_id; // request에서
								// id
								// 파라미터를
								// 가져온다
								// System.out.println("세션아이디" + id);

								returnUrl = request.getRequestURI(); // 현재 URL
								if (key_id == null || key_id.equals("")
										|| key_id.equals("null")) { // id가 Null
																	// 이거나
									// 없을 경우
									// System.out.println("이쪽으로 리다이렉트");
									// response.sendRedirect("/CommonApps/Member/MbrLogin.jsp");
									// // 로그인 페이지로 리다이렉트 한다.
									/*
									 * 중요
									 * 
									 * .jsp -> jsp는 서블릿을 안탄다 즉 서블릿을 안타는 대상은 포워딩이
									 * 불가 !! 밑에 redirect는 되나
									 */
									/*
									 * System.out .println("리턴url" +
									 * uploadRootPath +
									 * "MasterPage.jsp?mode=SMbrLogin&returnUrl="
									 * );
									 */
									response.sendRedirect("/MasterPage.mwav?mode=SMbrLogin&returnUrl="
											+ returnUrl);
									// response.sendRedirect("/hightsofts/hightsofts.mwav);
									// return false;
									/*
									 * RequestDispatcher rd =
									 * request.getRequestDispatcher
									 * ("/Admins/CompanyMgr/Staff/StfLogin.jsp"
									 * ); rd.forward(request, response);
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
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		try {
			String setTitle = null;
			// meta 태그 내 title 지정
			setTitle = Common_Utils.setTitle(request.getRequestURI());

			request.setAttribute("setTitle", setTitle.trim());
		} catch (Exception e) {
			e.printStackTrace();
		}
		log.info("======================================           END          ======================================\n");

	}

}