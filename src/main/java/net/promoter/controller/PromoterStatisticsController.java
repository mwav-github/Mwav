package net.promoter.controller;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import net.admins.service.StatisticsAdminsService;
import net.common.common.CommandMap;
import net.mwav.common.module.Common_Utils;
import net.mwav.common.module.Paging;
import net.mwav.common.module.PagingVO;

@Controller
public class PromoterStatisticsController {
	Logger log = Logger.getLogger(this.getClass());

	Common_Utils cou = new Common_Utils();

	String mode;

	@Inject
	private StatisticsAdminsService statisticsAdminsService;

	@RequestMapping(value = "/Promoters/StatList.mwav")
	public ModelAndView selectListStatistics(CommandMap commandMap, HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/AdminPmt/Marketing/Statistics/StatsList"); ///Admins/Marketing/Statistics/StatsList

		Map<String, Object> chartVar;
		chartVar = Common_Utils.typeToChar(request);
		System.out.println("dpdpd" + chartVar.get("value"));
		commandMap.put("stPromoterId", chartVar.get("value"));

		// MwavFramework 내 예외처리하지않으면, pageNum에 대한 검사로인하여,
		// java.lang.NumberFormatException: For input string: ""
		// 예외처리 필요.
		String pageNum = (String) commandMap.get("pageNum");
		Paging paging = new Paging();
		if (pageNum == null || pageNum == "") {
			pageNum = "1";
		}
		int totalRow = statisticsAdminsService.selectOneGetStatisticsTotalCount();
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
			selectListStatistics = statisticsAdminsService.selectListStatistics(commandMap.getMap());

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

	@RequestMapping(value = "/Promoters/StatView.mwav")
	public ModelAndView selectOneStatsView(CommandMap commandMap, HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/Promoter/Marketing/Statistics/StatsView");

		log.debug("인터셉터 테스트");
		int statistics_id = Integer.parseInt((String) commandMap.get("statistics_id"));
		System.out.println("statistics_id" + statistics_id);
		Map<String, Object> selectOneStatView = statisticsAdminsService.selectOneStatView(statistics_id);

		List<Map<String, Object>> selectListStatLogDateList = statisticsAdminsService.selectListStatLogDateList(statistics_id);

		List<Map<String, Object>> selectListStatLogList = statisticsAdminsService.selectListStatLogList(statistics_id);

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
