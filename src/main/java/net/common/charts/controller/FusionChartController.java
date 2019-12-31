package net.common.charts.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.common.charts.service.FusionChartService;
import net.mwav.common.module.Common_Utils;


@Controller
public class FusionChartController {
	
	@Autowired
	private FusionChartService fusionChartService;
	
	Map<String, Object> chartVar;
	
	
	@RequestMapping({"/charts/fushionchart/selectWeeklyUsersList.mwav"})
	@ResponseBody
	public String selectWeeklyUsersList(HttpServletRequest request) {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap = Common_Utils.typeToChar(request);
		paramMap.put("stPromoterId", paramMap.get("value"));
		
		return fusionChartService.selectWeeklyUsersList(paramMap);
	}
	
	
	@RequestMapping({"/charts/fushionchart/selectTop10PageList.mwav"})
	@ResponseBody
	public String selectTop10PageList(HttpServletRequest request, Model model) throws UnsupportedEncodingException {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap = Common_Utils.typeToChar(request);
		paramMap.put("stPromoterId", paramMap.get("value"));
		
		return URLEncoder.encode(fusionChartService.selectTop10PageList(paramMap), "UTF-8");
	}
	
	
	@RequestMapping({"/charts/fushionchart/selectClientScreenSizeList.mwav"})
	@ResponseBody
	public String selectClientScreenSizeList(HttpServletRequest request) {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap = Common_Utils.typeToChar(request);
		paramMap.put("stPromoterId", paramMap.get("value"));
		
		return fusionChartService.selectClientScreenSizeList(paramMap);
	} 
	
	
}
