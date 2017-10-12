package net.common.Interceptor;

import java.net.InetAddress;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.mwav.common.module.Common_Utils;
import net.mwav.common.module.CookieBox;
import net.mwav.member.service.MemberService;
import net.mwav.member.vo.Member_tbl_VO;
import net.mwav.statistics.controller.StatisticsController;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

//

public class StatisticsInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	Member_tbl_VO member_tbl_VO;

	@Autowired
	MemberService memberService;
	
	protected Log log = LogFactory.getLog(StatisticsInterceptor.class);

	@Autowired
	private StatisticsController statisticsController;

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		log.info("======================================          START         ======================================");
		log.info(" Request URI \t:  " + request.getRequestURI());
		
		if(request.getSession().getAttribute("member") == null){
			getAutoLogin(request, request.getSession());
		}
		
		
		CookieBox cookieBox = new CookieBox(request);
		Cookie cookie;
		HttpSession session = request.getSession();
		String member_id = null;
		String statistics_id = null;
		// String statistics_id_session = null;
		// String statistics_id_cookie = null;
		member_tbl_VO = null;
		// String stClientScreen = null;

		try {

			/*
			 * stClientScreen = request.getParameter("stClientScreen");
			 * System.out.println("유저의스크린사이즈"+stClientScreen);
			 */

			member_tbl_VO = (Member_tbl_VO) session.getAttribute("member");
			if (member_tbl_VO != null) {
				member_id = String.valueOf(member_tbl_VO.getMember_id());
			}

			// statistics_id 아이디의 경우 보통 세션으로 지정 및 움직이지만,
			// 외부에서 get방식으로 연결된 링크를
			statistics_id = (String) session.getAttribute("statistics_id");

			// 지정한 이름의 쿠키가 존재하는지의 여부
			/*
			 * if (cookieBox.isExist("statistics_id")) {
			 * 
			 * statistics_id_cookie = cookieBox.getValue("statistics_id");
			 * System.out.println("쿠키에 저장된 statistics_id" + statistics_id);
			 * 
			 * }
			 */

			/*
			 * 소셜 로그인 쪽에 공유된 통계키의 경우 세션의 경우 유지 불가하므로, 쿠키정보를 가지고 알수있다. 즉 그정보를 가지고
			 * 소셜쪽으로 들어온 유저가 아 그유저구나 알수있다.
			 */
			/*
			 * if (statistics_id_session.equals(statistics_id_cookie)) { // 쿠키와
			 * 세션의 아이디가 같은 경우 // 무엇으로 해도이상없음. statistics_id =
			 * statistics_id_session; } else { // null이 아닌걸로 if
			 * (statistics_id_session != null && statistics_id_cookie != null) {
			 * statistics_id = statistics_id_session; } else if
			 * (statistics_id_session != null && statistics_id_cookie == null) {
			 * statistics_id = statistics_id_session; } else { statistics_id =
			 * statistics_id_cookie; }
			 * 
			 * }
			 */

			String session_id = request.getSession().getId();

			String uploadRootPath = session.getServletContext().getRealPath(
					"\\");
			log.info("루트 경로" + uploadRootPath);

			/*
			 * 노드 파싱 DomReadXMLFile.xmlParser(uploadRootPath +
			 * "/xConfig/general.xml.config");
			 * 
			 * URL : DomReadXMLFile.xmlParser("/xConfig/general.xml.config");
			 */

			InetAddress localMachine = InetAddress.getLocalHost();
			String localMachineName = localMachine.getHostName();
			log.info("Hostname of local machine: " + localMachineName);

			// statistics_id.equals("") ||statistics_id == null 순서 반대로 하면,
			// nullpointerException 발생
			// --> 생성전에 비교를 하게 되므로 에러 발생.
			/* (사용자 기기체크) if (!(localMachineName.equals("DESKTOP-T79AHJS"))) { */

			String auth_url = request.getRequestURI();
			log.info("auth_url 추적." + auth_url);

			/*
			 * //Java/1.8.0_25 부분 서버로그 남기지 않을 때. String userAgent =
			 * request.getHeader("User-Agent"); log.info("userAgent" +
			 * userAgent); // .jsp는 include 되는 부분에 대한 방지. .chart는 차트 include 방지
			 * if (auth_url != null && !(userAgent.contains("Java")) &&
			 * !(auth_url.contains(".jsp")) && !(auth_url.contains(".chart"))) {
			 */
			// Java/1.8.0_25 부분 서버로그 남기지 않을 때.
			String userAgent = request.getHeader("User-Agent");

			if (auth_url != null && !(auth_url.contains(".jsp"))
					&& !(auth_url.contains(".chart"))) {

				String PageName = Common_Utils.setPageName(auth_url);
				if (statistics_id == null || statistics_id.equals("")) {
					// Java/1.8.0_25
					if (userAgent.contains("Java")) {
						request.setAttribute("stPageName", "서버재시작");
					} else {
						request.setAttribute("stPageName", PageName);
					}
					statistics_id = statisticsController.insertFirstStatics(
							request, member_id, statistics_id, session_id);

					log.info("statistics_id insertFirstStatics."
							+ statistics_id);
					// 세션 및 쿠키 생성.
					session.setAttribute("statistics_id", statistics_id);
					request.setAttribute("stClientScreen", "firstTime");
					// cookie = CookieBox.createCookie("statistics_id",
					// statistics_id);
					/*
					 * cookie = CookieBox.createCookie("statistics_id",
					 * statistics_id, "/", 60 * 60 * 24 * 7); // 쿠키의 경우 클라이언트에게
					 * 생성된 쿠키를 전송해야한다. (삭제도 마찬가지) response.addCookie(cookie);
					 */

				}
				// /statistics/stClientScreenUpdateAjax.mwav 해당 업데이트를 막을지는 고민
				else {
					log.info("statistics_id insertStatics." + statistics_id);

					request.setAttribute("slPageName", PageName);
					statisticsController.insertStatics(request, statistics_id);
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
	
	
	private Boolean getAutoLogin(HttpServletRequest request, HttpSession session) {
		Cookie loginCookie = WebUtils.getCookie(request, "autoLogin");
		if (loginCookie != null&&loginCookie.getValue()!=null&&!loginCookie.getValue().equals("")) {
			log.info("자동로그인 실행 중");			
			
			Member_tbl_VO member = memberService.selectAutoLogin(Integer.parseInt(loginCookie.getValue()));
			log.info("member의 값은"+ member.toString());
			if (member != null) {
				log.info("자동로그인 VO 가져옴");
				session.setAttribute("member", member);
				return true;
			
			}
		}
		return false;
	}
	

}