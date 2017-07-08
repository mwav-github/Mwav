package net.common.Interceptor;

import java.net.InetAddress;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.mwav.common.module.Common_Utils;
import net.mwav.common.module.DomReadXMLFile;
import net.mwav.member.vo.Member_tbl_VO;
import net.mwav.statistics.controller.StatisticsController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

//

public class StatisticsInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	Member_tbl_VO member_tbl_VO;

	protected Log log = LogFactory.getLog(StatisticsInterceptor.class);

	@Autowired
	private StatisticsController statisticsController;

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		log.info("======================================          START         ======================================");
		log.info(" Request URI \t:  " + request.getRequestURI());

		HttpSession session = request.getSession();
		String member_id = null;
		String statistics_id = null;
		member_tbl_VO = null;

		try {

			member_tbl_VO = (Member_tbl_VO) session.getAttribute("member");
			if (member_tbl_VO != null) {
				member_id = String.valueOf(member_tbl_VO.getMember_id());
			}
			statistics_id = (String) session.getAttribute("statistics_id");

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
			if (statistics_id == null || statistics_id.equals("")) {
				statistics_id = statisticsController.insertFirstStatics(
						request, member_id, statistics_id, session_id);

				log.info("statistics_id" + statistics_id);
				// 세션으로 지정.
				session.setAttribute("statistics_id", statistics_id);
			} else {
				statisticsController.insertStatics(request, statistics_id);
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