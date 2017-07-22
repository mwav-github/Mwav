package net.mwav.statistics.controller;

import java.sql.Timestamp;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.common.common.CommandMap;
import net.mwav.statistics.service.StatisticsService;
import net.mwav.statistics.vo.StatisticsLogVO;
import net.mwav.statistics.vo.StatisticsVO;
import net.mwav.common.module.Common_Utils;

@Controller
public class StatisticsController {
	Logger log = Logger.getLogger(this.getClass());

	@Autowired
	private HttpServletRequest request;

	static Common_Utils cou = new Common_Utils();
	String mode;
	String statistics_id;

	@Resource(name = "statisticsService")
	private StatisticsService statisticsService;

	public String insertFirstStatics(HttpServletRequest request,
			String member_id, String statistics_id, String session_id)
			throws Exception {

		Map<String, Object> staticMap = cou.getHeadersInfo(request);
		// 실 IP
		String realIp = cou.getClientIP(request);
		// staticMap.put("IP", realIp);

		cou.selectMap(staticMap);

		int m_id = 0;

		System.out.println("member_id" + member_id);
		// string.valueof 로 member_id == "null"
		if (member_id == null || member_id == "" || member_id == "null") {
			m_id = 0;
		} else {
			m_id = Integer.valueOf(member_id);
		}

		String st_id = null;
		if (statistics_id == null || statistics_id == "") {
			st_id = statisticsService.selectNextPk();

			// 세션생성

		} else {

			st_id = statistics_id;
		}

		try {
			StatisticsVO vo = new StatisticsVO();

			// http://helols.tistory.com/15
			// http://jhleed.tistory.com/43
			vo.setStatistics_id(Long.parseLong(st_id));
			// 유져Screen

			vo.setStMember_id(m_id);

			// 우리 서버내의 페이지이름
			vo.setStPageName(request.getServletPath());
			// 이전페이지; ex) 유니텔검색엔진

			String prePageName = null;
			String referer = null;
			referer = request.getHeader("Referer");
			if (referer != null) {
				prePageName = request.getHeader("Referer").substring(
						request.getHeader("Referer").lastIndexOf("/") + 1);
			}
			vo.setStPrePageName(prePageName);
			// urlReferrer.PathAndQuery = 211.238.38.238 어느 페이지에서 왔노?
			vo.setStUrlReferrer(referer);

			// 프로모터 PK_id
			vo.setStPromoterId(Integer.parseInt("123"));
			// 무슨내용인가?
			vo.setStPromoterType('A');
			// 세션아이디
			vo.setStSessionId(session_id);

			// url.Host; 어느서버 URL이 인기가 있는가?
			vo.setStUrlHost(request.getRemoteHost());

			// ========================================
			// url.PathAndQuery; /CustomerServices/QnA/QnA_form.aspx
			vo.setStUrlLocalPath(request.getRequestURI());
			// qgrp=etc&ga=bbc
			vo.setStQueryString(request.getQueryString());
			// url.PathAndQuery; /CustomerServices/QnA/QnA_form.aspx?qgrp=etc
			vo.setStUrlPathAndQuery(request.getRequestURI() + "?"
					+ request.getQueryString());
			// ========================================

			vo.setStUrlPort(request.getServerPort());
			// urlReferrer.Host = 211.238.38.238 어느 서버에서 왔노?
			vo.setStUrlReferrerHost(request.getServerName());

			vo.setStUrlReferrerHost(request.getServerName());
			// 둘중 몰로할지 고민 request.getServerName() : http://mwav.net or localhost
			// request.getLocalAddr() : 127.0.0.1
			// http, shttp, ftp...
			vo.setStUrlScheme(request.getScheme());
			// userAgent(클라이언트 환경)
			vo.setStUserAgent(request.getHeader("User-Agent"));
			// userHostAddress(클라이언트IP)
			vo.setStUserHostAddress(realIp);
			// 무슨내용인가?
			vo.setStWhatsAbout(Integer.parseInt("123"));

			// 통계적용일
			Timestamp stamp = new Timestamp(System.currentTimeMillis());
			vo.setStStatisticsDt(stamp);

			// String stClientScreen = (String)
			// request.getAttribute("screenSize");
			// (String) staticMap.get("browser") 사용자 브라우저
			vo.setStClientScreen(null);
			// 유져CPU (브라우저 와 운영체제 정보포함 분리 희망시 - getUserAgentDetail()) 사용
			vo.setStHTTP_UA_CPU((String) staticMap.get("os"));
			//
			statisticsService.insertFirstStatics(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("Request-URI" + staticMap.get("Request-URI"));
		System.out.println("Refer" + staticMap.get("Refer"));
		/*
		 * System.out.println("Request-URI"+staticMap.get("Request-URI"));
		 * System.out.println("Request-URI"+staticMap.get("Request-URI"));
		 * System.out.println("Request-URI"+staticMap.get("Request-URI"));
		 * System.out.println("Request-URI"+staticMap.get("Request-URI"));
		 */

		return st_id;

	}

	public StatisticsVO insertStatics(HttpServletRequest request,
			String statistics_id) throws Exception {

		String st_id = null;
		st_id = statistics_id;
		String getURI = request.getRequestURI();

		System.out.println("st_id" + st_id);
		try {
			StatisticsLogVO log_vo = new StatisticsLogVO();

			log_vo.setStatistics_id(Long.parseLong(st_id));
			Timestamp stamp = new Timestamp(System.currentTimeMillis());
			log_vo.setSlStatLogDt(stamp);

			String prePageName = null;
			String referer = null;
			referer = request.getHeader("Referer");
			if (referer != null) {
				prePageName = request.getHeader("Referer").substring(
						request.getHeader("Referer").lastIndexOf("/"));
			}
			log_vo.setSlPageName(prePageName);

			// url.Host; 어느서버 URL이 인기가 있는가?
			log_vo.setSlUrlHost(request.getRemoteHost());
			// url.PathAndQuery; /CustomerServices/QnA/QnA_form.aspx
			log_vo.setSlUrlLocalPath(request.getRequestURI());
			// qgrp=etc&ga=bbc
			String queryString = null;

			// (중요).jsp 형태라면 ok but .mwav라서 null 값 찍힌다.
			queryString = request.getQueryString();
			/*
			 * queryString = getURI.substring(getURI.indexOf('?') + 1,
			 * getURI.length());
			 */
			System.out.println("queryString" + queryString);
			log_vo.setSlQueryString(queryString);

			statisticsService.insertStatistics(log_vo);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;

	}

	@RequestMapping(value = "/statistics/stClientScreenUpdateAjax.mwav")
	public @ResponseBody void updateStClientScreen(CommandMap commandMap,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		try {

			HttpSession session = request.getSession();

			statistics_id = (String) session.getAttribute("statistics_id");
			commandMap.put("statistics_id", statistics_id);
			System.out.println("statistics_id찍힝?" + statistics_id);
		/*	//가로: screen.width
			세로: screen.height
			※ 단 클라이언트 PC의 메인이 되는 정보만을 참조하므로 듀얼로 사용할경우 
			두가지 화면에 다른 크기정보를 얻을 수 없다*/
			
			//System.out.println("stClientScreen"+commandMap.get("stClientScreen"));
			
			statisticsService.updateStClientScreen(commandMap.getMap());

		} catch (Exception e) {
			e.printStackTrace();
		}
		return;
	}

}