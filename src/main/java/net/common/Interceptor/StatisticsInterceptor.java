package net.common.Interceptor;

import java.net.InetAddress;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.mwav.common.module.Common_Utils;
import net.mwav.common.module.CookieBox;
import net.mwav.common.module.StringLib;
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

		if (request.getSession().getAttribute("member") == null) {
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
			log.info("auth_url 추적: " + auth_url);
			log.info("statistics_id: " + statistics_id);
			/*
			 * //Java/1.8.0_25 부분 서버로그 남기지 않을 때. String userAgent =
			 * request.getHeader("User-Agent"); log.info("userAgent" +
			 * userAgent); // .jsp는 include 되는 부분에 대한 방지. .chart는 차트 include 방지
			 * if (auth_url != null && !(userAgent.contains("Java")) &&
			 * !(auth_url.contains(".jsp")) && !(auth_url.contains(".chart"))) {
			 */
			// Java/1.8.0_25 부분 서버로그 남기지 않을 때.
			String userAgent = request.getHeader("User-Agent");

			//중요  
			/*
			 * 통계가 중복되서 넣어서 에러가 발생하는 케이스 방지(추후 밀리세컨드까지 갔을때에는 고민 필요)
			 * 1. .jsp -> include 파일인 경우 .jsp로 끝난다.
			 * 2. /charts -> 차트관련 제외
			 * 3. /Index.mwav -> 루트의 경우 /로 찍히며 /Index.mwav의 경우 로그인 후 포워딩할때 한다 이때 중복에러 발생.
			 * 4. /statistics/stClientScreenUpdateAjax -> 해상도 찍는거도 제외 처리.
			 * 5. /MessageView -> 에러의 경우 파일단위로 떨구며, 통계쪽에 별도로 기입하지 않는다.
			 */
			if (auth_url != null && !(auth_url.contains(".jsp")) && !(auth_url.contains("Index.mwav")) && !(auth_url.contains("/charts")) && !(auth_url.contains("/statistics/stClientScreenUpdateAjax")) && !(auth_url.contains("/MessageView"))) {

				String PageName = null;
				PageName = Common_Utils.setPageName(auth_url);
				log.info("임시: " + PageName);

				if (statistics_id == null || statistics_id.equals("")) {
					// Java/1.8.0_25
					if (userAgent.contains("Java")) {
						request.setAttribute("stPageName", "서버재시작");
					} else {
						request.setAttribute("stPageName", PageName);
					}
					
					statistics_id = statisticsController.insertFirstStatics(
							request, member_id, statistics_id, session_id);
					
					
					
					log.info("statistics_id insertFirstStatics: " + statistics_id);
					session.setAttribute("statistics_id", statistics_id);
					request.setAttribute("stClientScreen", "firstTime");

				} else {
					log.info("debug: "+ statisticsController.isValidSessionId(statistics_id));
					if(!statisticsController.isValidSessionId(statistics_id)){
						statistics_id = statisticsController.insertFirstStatics(request, member_id, statistics_id, session_id);
						log.info("updated statistics_id insertStatics." + statistics_id);
					}
					log.info("statistics_id insertStatics." + statistics_id);
					log.info("auth_url" + auth_url);
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
			Map<String, Object> map = new HashMap<String, Object>();
			// meta 태그 내 title 지정
			
			map = Common_Utils.setMetaData(request.getRequestURI(), (Map<String, Object>) request.getAttribute("boardMetaData"));

			request.setAttribute("metaData", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		log.info("======================================           END          ======================================\n");

	}

	private Boolean getAutoLogin(HttpServletRequest request, HttpSession session) {

		try {
			Cookie loginCookie = WebUtils.getCookie(request, "autoLogin");
			if (loginCookie != null && loginCookie.getValue() != null
					&& !loginCookie.getValue().equals("")) {
				log.info("자동로그인 실행 중");

				Member_tbl_VO member = memberService.selectAutoLogin(Integer
						.parseInt(loginCookie.getValue()));
				if (member != null) {
					log.info("member의 값은" + member.toString());
					log.info("자동로그인 VO 가져옴");
					session.setAttribute("member", member);
					return true;

				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

}