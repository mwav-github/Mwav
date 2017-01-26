package net.common.common;

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
import org.springframework.web.servlet.ModelAndView;

import net.common.common.CommandMap;
import net.mwav.common.module.Common_Utils;

@Controller
public class FrontCommonController {
	Logger log = Logger.getLogger(this.getClass());

	Common_Utils cou = new Common_Utils();
	String mode;

	/*
	 * ========================================등록================================
	 * ========
	 */
	// 1번 bnsForm : Form 입력만 가능 (뒤로가기, list)
	@RequestMapping(value = "/hightsofts/hightsofts.mwav")
	// http://egloos.zum.com/nadostar/v/210497
	public ModelAndView highsots(CommandMap commandMap,
			HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView(
				"/CompanyItem/ITProducts/HighSofts/HighSofts");

		// String items =(String) request.getAttribute("items");
		String items = (String) commandMap.get("items");

		// String c_items = null;
		System.out.println("itmes" + items);
		if (items.equals("Highcharts")) {
			mv.addObject("item", "Highcharts");

			mv.addObject("demo_1", "combo-dual-axes-default");
			mv.addObject("demo_2", "areaspline-default");
			mv.addObject("demo_3", "column-drilldown-default");
			mv.addObject("demo_4", "3d-pie-default");
			
			mv.addObject("demo_1_text", "Dual axes, line and column");
			mv.addObject("demo_2_text", "Area-spline");
			mv.addObject("demo_3_text", "Column with drilldown");
			mv.addObject("demo_4_text", "3D pie");
			
		} else if (items.equals("Highstock")) {

			mv.addObject("item", "Highstock");

			mv.addObject("demo_1", "compare-default");
			mv.addObject("demo_2", "intraday-area-default");
			mv.addObject("demo_3", "markers-only-default");
			mv.addObject("demo_4", "candlestick-default");
			
			mv.addObject("demo_1_text", "Compare multiple series");
			mv.addObject("demo_2_text", "Intraday area");
			mv.addObject("demo_3_text", "Point markers only");
			mv.addObject("demo_4_text", "Candlestick");
		} else if (items.equals("Highmaps")) {

			mv.addObject("item", "Highmaps");

			mv.addObject("demo_1", "all-maps-default");
			mv.addObject("demo_2", "map-drilldown-default");
			mv.addObject("demo_3", "geojson-default");
			mv.addObject("demo_4", "map-bubble-default");
			
			mv.addObject("demo_1_text", "Overview");
			mv.addObject("demo_2_text", "Drilldown");
			mv.addObject("demo_3_text", "GetJSON areas");
			mv.addObject("demo_4_text", "Map bubble");

		}
		/*
		 * String mm = "site"; mv.addObject("mm", mm); mv.addObject("item",
		 * "m_bnsForm"); mv.addObject("breadcrumb", "IT Trends");
		 * mv.addObject("page_header", "IT Trends");
		 * 
		 * // mv.addObject("insertBnsForm", insertBnsForm); //
		 * mv.addObject("IDX", commandMap.get("IDX"));
		 */
		return mv;
	}

	@RequestMapping(value = "/CompanyItem/**")
	public ModelAndView redirectController(HttpServletRequest request) throws Exception {
		
		System.out.println("열로들어오나");
		String url = request.getRequestURI();
		int pos = url.lastIndexOf(".");
		String ext = url.substring(pos + 1);
		String ext_url = url.substring(0, pos);
		System.out.println("확장자 제외" + ext);
		System.out.println("return URL"+ext_url);
		ModelAndView mv = new ModelAndView(
				ext_url);

		return mv;
	}

}