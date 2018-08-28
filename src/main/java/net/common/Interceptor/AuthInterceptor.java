package net.common.Interceptor;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import net.admins.vo.Staff_VO;
import net.mwav.common.module.DomReadXMLFile;
import net.mwav.member.vo.Member_tbl_VO;

//

public class AuthInterceptor extends HandlerInterceptorAdapter {
	// private final Logger log = LoggerFactory.getLogger(this.getClass());
	// Logger log = Logger.getLogger(this.getClass());
	@Autowired
	Member_tbl_VO member_tbl_VO;

	@Autowired
	Staff_VO staff;

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

		HttpSession session = request.getSession();
		String uploadRootPath = session.getServletContext().getRealPath(
				"\\");
		Map<String, Object> footerMap= DomReadXMLFile.xmlParser(uploadRootPath+"/xConfig/footer.xml.config");
		//Map<String, Object> footerMap= DomReadXMLFile.xmlParser("\\Users\\신윤상\\Documents\\mwav\\src\\main\\webapp\\xConfig\footer.xml.config");
		log.info("CompanyName !!!!!!!!" + (String)footerMap.get("companyName"));
		
		request.setAttribute("companyName", (String)footerMap.get("companyName"));
		request.setAttribute("address", (String)footerMap.get("address"));
		request.setAttribute("TEL", (String)footerMap.get("TEL"));
		request.setAttribute("FAX", (String)footerMap.get("FAX"));
		request.setAttribute("webSiteManager", (String)footerMap.get("webSiteManager"));
		request.setAttribute("marketingManager", (String)footerMap.get("marketingManager"));
		request.setAttribute("chief_IT_BusinessAdvisor", (String)footerMap.get("chief_IT_BusinessAdvisor"));


		Member_tbl_VO member = null;
		// member 및 비교할 값.
		String key_id = null;
		String returnUrl = "";
		String url = request.getRequestURI();
		// String staff = null;
		member_tbl_VO = null;
		try {

		
			staff = (Staff_VO) session.getAttribute("staff");
			member = (Member_tbl_VO) session.getAttribute("member");
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
			// System.out.println("auth_url" + auth_url);
			// staff 권한 체크.

			String auth_url = null;
			// 안하면, / 등의 경로에서는 에러 발생
			// 에러명 : java.lang.StringIndexOutOfBoundsException: String index out
			// of range: 7 (7까지는 /Admins 글자 수!)
			auth_url = request.getRequestURI().substring(0, 7); // 현재 URL

			if (request.getRequestURI().length() >= 7 && staff != null) {
				System.out.println("auth_url11"+auth_url);
				key_id = Integer.toString(staff.getStaff_id());
			}
			if (auth_url != null
					&& (auth_url.equals("/Admins") || auth_url
							.equals("/admins"))) {
				System.out.println("staff" + key_id);
				System.out.println("staff"
						+ request.getRequestURI().equals(
								"/admins/staff/stfLogin.mwav"));

				if (!(request.getRequestURI()
						.equals("/admins/staff/stfLogin.mwav"))
						&& (key_id == null || key_id.equals("") || key_id
								.equals("null"))) {

					/*
					 * [중요] http://enosent.tistory.com/34
					 * http://blog.danggun.net/4063 이 웹페이지에 리디렉션 순환 오류가 있습니다.'
					 * 또는 'ERR_TOO_MANY_REDIRECTS' 위의 오류가 나타나는 이유는 무한대로 리다이랙션이
					 * 되면서 나타나는 오류이다. 즉 권한부여 페이지/ 로그인 페이지 모두 stfLogin 페이지로
					 * 리다이렉트하니까.
					 *
					 * 이때 해당 페이지 URL 과 동일하면 그만 멈추도록 해야한다.
					 *
					 * 리다이렉션은 그 뒤의 문장까지 다실행한다.
					 */

					// 현재들어온 url 과 동일한 경우 true 제출함으로써 무한 리다이렉션을 막는다.
					if ("/Admins/CompanyMgr/Staff/StfLogin.mwav".equals(request
							.getRequestURI())) {
						// 들어왔나?
						System.out.println("제발");
						return true;
					}
					response.sendRedirect("/Admins/CompanyMgr/Staff/StfLogin.mwav");

					return false;
				} else {
					// staff 로그인한 상태 또는 로그인을 시도 (/admins/staff/stfLogin.mwav)
					// 위에서 !(auth_url.equals("/admins/staff/stfLogin.mwav") 체크
					// 안하면 로그인 시도해도 그냥 로그인페이지로 리다이렉트
					System.out.println("로그인상태 (staff)");
					return true;
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
							log.info("== 인증 체크가 필요 있는 URL ============================");
							log.info("== URL : " + urls.get(i)
									+ " ============================");

							try {

								if (member != null) {
									key_id = Integer.toString(member
											.getMember_id()); // request에서
								} else {
									key_id = null;
								}
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

	}

}