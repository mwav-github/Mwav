package net.mwav.statistics.controller;

import java.util.Collections;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import net.common.common.CommandMap;
import net.mwav.order.vo.OrderCartVO;
import net.mwav.shop.service.GoodsService;
import net.mwav.statistics.service.StatisticsService;
import net.mwav.statistics.vo.StatisticsVO;
import net.mwav.common.module.Common_Utils;

@Controller
public class StatisticsController {
	Logger log = Logger.getLogger(this.getClass());

	@Autowired
	private HttpServletRequest request;

	static Common_Utils cou = new Common_Utils();
	String mode;

	@Resource(name = "statisticsService")
	private StatisticsService statisticsService;

	public StatisticsVO insertStatics(HttpServletRequest request)
			throws Exception {

		Map<String, Object> staticMap = cou.getHeadersInfo(request);
		String realIp = cou.getClientIP(request);

		staticMap.put("IP", realIp);

		cou.selectMap(staticMap);

		StatisticsVO vo = new StatisticsVO();

		statisticsService.insertStatistics(vo);

		System.out.println("Request-URI" + staticMap.get("Request-URI"));
		System.out.println("Refer" + staticMap.get("Refer"));
		/*
		 * System.out.println("Request-URI"+staticMap.get("Request-URI"));
		 * System.out.println("Request-URI"+staticMap.get("Request-URI"));
		 * System.out.println("Request-URI"+staticMap.get("Request-URI"));
		 * System.out.println("Request-URI"+staticMap.get("Request-URI"));
		 */

		return null;

	}
	public ModelAndView redirectController(HttpServletRequest request, String url) throws Exception {
		ModelAndView mv = new ModelAndView(
				"/CompanyItem/ITProducts/HighSofts/HighSofts");

		return mv;
	}

}