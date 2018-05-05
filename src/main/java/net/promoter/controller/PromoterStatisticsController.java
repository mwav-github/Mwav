package net.promoter.controller;

import java.io.PrintWriter;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.admins.service.StatisticsAdminsService;
import net.common.common.CommandMap;
import net.mwav.common.module.Common_Utils;
import net.mwav.common.module.Paging;
import net.mwav.common.module.PagingVO;
import net.promoter.service.PromoterService;
import net.promoter.vo.Promoter_VO;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class PromoterStatisticsController {
	Logger log = Logger.getLogger(this.getClass());

	Common_Utils cou = new Common_Utils();

	String mode;

	@Resource(name = "promoterService")
	private PromoterService promoterService;

	@Resource(name = "statisticsAdminsService")
	private StatisticsAdminsService statisticsAdminsService;

	@RequestMapping(value = "/Promoters/StatList.mwav")
	public ModelAndView selectListStatistics(CommandMap commandMap,
			HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView(
				"/AdminPmt/Marketing/Statistics/StatsList"); ///Admins/Marketing/Statistics/StatsList

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



}
