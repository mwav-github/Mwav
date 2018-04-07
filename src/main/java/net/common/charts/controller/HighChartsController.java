package net.common.charts.controller;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.common.charts.service.HighChartsService;
import net.common.charts.vo.DataVO;
import net.mwav.common.module.Common_Utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;



@Controller
public class HighChartsController {

	@Autowired
    HighChartsService chartService;

	Map<String, Object> chartVar;

    @RequestMapping({"/", "/charts"})
    public String showCharts() {
    	
        return "charts";
    }

    @RequestMapping({"/charts/linechart1.mwav"})
    @ResponseBody
    public DataVO showLineChart1() {
        return chartService.getLineChartData1();
    }

    @RequestMapping({"/charts/linechart2.mwav"})
    @ResponseBody
    public DataVO showLineChart2() {
        return chartService.getLineChartData2();
    }
   

    @RequestMapping({"/charts/highsofts/WeeklyUsers.mwav"})
    @ResponseBody
    public DataVO selectListWeeklyUsers(HttpServletRequest request) {
     	chartVar = Common_Utils.typeToChar(request);
       	chartVar.put("stPromoterId", chartVar.get("value"));
  	
        return chartService.selectListWeeklyUsers(chartVar);
    }
    
    @RequestMapping({"/charts/highsofts/Top10PageList.mwav"})
    @ResponseBody
    public DataVO selectListTop10Page(HttpServletRequest request) {
     	chartVar = Common_Utils.typeToChar(request);
       	chartVar.put("stPromoterId", chartVar.get("value"));
   	
        return chartService.selectListTop10Page(chartVar);
    }
    
    @RequestMapping({"/charts/highsofts/ClientScreenSize.mwav"})
    @ResponseBody
    public DataVO selectListClientScreenSize(HttpServletRequest request) {

     	chartVar = Common_Utils.typeToChar(request);
       	chartVar.put("stPromoterId", chartVar.get("value"));

        return chartService.selectListClientScreenSize(chartVar);
    }


}
