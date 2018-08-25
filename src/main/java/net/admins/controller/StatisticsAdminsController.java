package net.admins.controller;

import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import net.admins.service.StatisticsAdminsService;
import net.common.common.CommandMap;
import net.mwav.common.module.Common_Utils;
import net.mwav.common.module.FileUtils;
import net.mwav.common.module.ImageUtill;
import net.mwav.common.module.Paging;
import net.mwav.common.module.PagingVO;

@Controller
public class StatisticsAdminsController {
	Logger log = Logger.getLogger(this.getClass());
	// HttpServletRequest request = null;
	// 자바에서 세션사용을 위해서는 아래와 같이 필요
	// 세션 관련 설정은 prehandle 에서 추후 지정(들어오는 url에 따라서)
	// HttpSession session = request.getSession();

	Common_Utils cou = new Common_Utils();

	String mode;

	// - Controller > Service > ServiceImpl > DAO > SQL(XML) > Controller > JSP

	@Resource(name = "statisticsAdminsService")
	private StatisticsAdminsService statisticsAdminsService;

	Common_Utils cu = new Common_Utils();

	/*
	 * ========================================등록================================
	 * ========
	 */

	/*
	 * ========================================리스트================================
	 * ========
	 */

	@RequestMapping(value = "/admins/marketing/statistics/statsList.mwav")
	public ModelAndView selectListStatistics(CommandMap commandMap,
			HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView(
				"/Admins/Marketing/Statistics/StatsList"); ///Admins/Marketing/Statistics/StatsList

		Map<String, Object> chartVar;
		chartVar = Common_Utils.typeToChar(request);
		System.out.println("dpdpd"+chartVar.get("value"));
		commandMap.put("stPromoterId", chartVar.get("value"));
		

		// MwavFramework 내 예외처리하지않으면, pageNum에 대한 검사로인하여,
		// java.lang.NumberFormatException: For input string: ""
		// 예외처리 필요.
		String pageNum = (String) commandMap.get("pageNum");
		Paging paging = new Paging();
		if (pageNum == null || pageNum == "") {
			pageNum = "1";
		}
		int totalRow = statisticsAdminsService
				.selectOneGetStatisticsTotalCount();
		System.out.println("totalRow=" + totalRow);
		System.out.println("pageNum=" + pageNum);
		// Paging pv = new Paging(pageNum, 10 , 10, totalCount);
		List<Map<String, Object>> selectListStatistics;
		PagingVO pagingVO = paging.setPagingInfo(totalRow, 10, pageNum); // 총
																			// 숫자,
																			// 한페이지에
																			// 노출
																			// 수
		commandMap.put("startRow", paging.getStartRow(pageNum)); // 시작 열
		commandMap.put("endRow", paging.getEndRow(pageNum)); // 끝 열
		if (totalRow > 0) {
			selectListStatistics = statisticsAdminsService
					.selectListStatistics(commandMap.getMap());

			// selectboardList =
			// boardService.selectbnsList(commandMap.getMap());

		} else {
			selectListStatistics = Collections.emptyList();
		}
		mv.addObject("pagingVO", pagingVO);
		mv.addObject("totalRow", totalRow);
		mv.addObject("selectListStatistics", selectListStatistics);
		String mm = "crm";
		mv.addObject("mm", mm);

		return mv;
	}

	/*
	 * ========================================수정================================
	 * ========
	 */

	/*
	 * ========================================보기================================
	 * ========
	 */

	// 1번 bnsView : 수정/삭제가능
	@RequestMapping(value = "/admins/marketing/statistics/statsView.mwav")
	public ModelAndView selectOneStatsView(CommandMap commandMap,
			HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView(
				"/Admins/Marketing/Statistics/StatsView");

		log.debug("인터셉터 테스트");
		int statistics_id = Integer.parseInt((String) commandMap
				.get("statistics_id"));
		System.out.println("statistics_id" + statistics_id);
		Map<String, Object> selectOneStatView = statisticsAdminsService
				.selectOneStatView(statistics_id);

		List<Map<String, Object>> selectListStatLogDateList = statisticsAdminsService
				.selectListStatLogDateList(statistics_id);

		List<Map<String, Object>> selectListStatLogList = statisticsAdminsService
				.selectListStatLogList(statistics_id);

		if (selectOneStatView != null && !selectOneStatView.isEmpty()) {
			String mm = "crm";
			mv.addObject("mm", mm);
			mv.addObject("selectOneStatView", selectOneStatView);
			mv.addObject("selectListStatLogDateList", selectListStatLogDateList);
			mv.addObject("selectListStatLogList", selectListStatLogList);
		}

		return mv;
	}

}