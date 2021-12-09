package net.common.Interceptor;

import java.net.InetAddress;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import net.mwav.common.module.Common_Utils;
import net.mwav.member.service.MemberService;
import net.mwav.member.vo.Member_tbl_VO;
import net.mwav.statistics.controller.StatisticsController;

/**
 * 사용자 통계분석
 * @author 김주성
 *
 */
public class StatisticsInterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = LoggerFactory.getLogger(StatisticsInterceptor.class);

	@Inject
	private Member_tbl_VO member_tbl_VO;

	@Inject
	private MemberService memberService;

	@Inject
	private StatisticsController statisticsController;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		HttpSession session = request.getSession();
		String member_id = null;
		String statistics_id = null;

		if (session.getAttribute("member") == null) {
			getAutoLogin(request, request.getSession());
		}

		member_tbl_VO = null;

		try {

			// member id 추출
			member_tbl_VO = (Member_tbl_VO) session.getAttribute("member");
			if (member_tbl_VO != null) {
				member_id = String.valueOf(member_tbl_VO.getMember_id());
			}

			// session id, statistics id 추출
			statistics_id = (String) session.getAttribute("statistics_id");
			String session_id = request.getSession().getId();

			String uploadRootPath = session.getServletContext().getRealPath("\\");
			InetAddress localMachine = InetAddress.getLocalHost();
			String localMachineName = localMachine.getHostName();
			String auth_url = request.getRequestURI();
			String userAgent = request.getHeader("User-Agent");

			logger.debug("====================================== START ======================================");
			logger.debug("url : " + request.getRequestURI());
			logger.debug("path : " + uploadRootPath);
			logger.debug("Hostname : " + localMachineName);
			logger.debug("auth url : " + auth_url);
			logger.debug("statistics id : " + statistics_id);
			logger.debug("member_id : " + member_id);
			logger.debug("====================================== END ======================================");

			//중요  
			/*
			 * 통계가 중복되서 넣어서 에러가 발생하는 케이스 방지(추후 밀리세컨드까지 갔을때에는 고민 필요)
			 * 1. .jsp -> include 파일인 경우 .jsp로 끝난다.
			 * 2. /charts -> 차트관련 제외
			 * 3. /Index.mwav -> 루트의 경우 /로 찍히며 /Index.mwav의 경우 로그인 후 포워딩할때 한다 이때 중복에러 발생.
			 * 4. /statistics/stClientScreenUpdateAjax -> 해상도 찍는거도 제외 처리.
			 * 5. /MessageView -> 에러의 경우 파일단위로 떨구며, 통계쪽에 별도로 기입하지 않는다.
			 */
			if (auth_url != null && !(auth_url.contains(".jsp")) && !(auth_url.contains("Index.mwav")) && !(auth_url.contains("/charts"))
					&& !(auth_url.contains("/statistics/stClientScreenUpdateAjax")) && !(auth_url.contains("/MessageView"))) {

				String PageName = null;
				PageName = Common_Utils.setPageName(auth_url);

				if (statistics_id == null || statistics_id.equals("")) {
					// Java/1.8.0_25
					if (userAgent.contains("Java")) {
						request.setAttribute("stPageName", "서버재시작");
					} else {
						request.setAttribute("stPageName", PageName);
					}

					statistics_id = statisticsController.insertFirstStatics(request, member_id, statistics_id, session_id);

					session.setAttribute("statistics_id", statistics_id);
					request.setAttribute("stClientScreen", "firstTime");

				} else {

					if (!statisticsController.isValidSessionId(statistics_id)) {
						statistics_id = statisticsController.insertFirstStatics(request, member_id, statistics_id, session_id);
					}

					request.setAttribute("slPageName", PageName);
					statisticsController.insertStatics(request, statistics_id);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return true;
	}

	@SuppressWarnings("unchecked")
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		try {
			Map<String, Object> map = new HashMap<String, Object>();

			// meta 태그 내 title 지정
			map = Common_Utils.setMetaData(request.getRequestURI(), (Map<String, Object>) request.getAttribute("boardMetaData"));

			request.setAttribute("metaData", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private Boolean getAutoLogin(HttpServletRequest request, HttpSession session) {

		try {
			Cookie loginCookie = WebUtils.getCookie(request, "autoLogin");
			if (loginCookie != null && loginCookie.getValue() != null && !loginCookie.getValue().equals("")) {

				Member_tbl_VO member = memberService.selectAutoLogin(Integer.parseInt(loginCookie.getValue()));
				if (member != null) {

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