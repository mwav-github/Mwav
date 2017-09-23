package net.common.charts.controller;

import javax.inject.Inject;

import net.common.charts.service.HighChartsService;
import net.common.charts.vo.DataVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.mwav.framework.*;

@Controller
public class HighChartsController {

	@Inject
	DateLib dateLib; 
	 
	    
    @Autowired
    HighChartsService chartService;


    @RequestMapping({"/", "/charts"})
    public String showCharts() {
    	
        return "charts";
    }

    @RequestMapping({"/linechart1.chart"})
    @ResponseBody
    public DataVO showLineChart1() {
        return chartService.getLineChartData1();
    }

    @RequestMapping({"/linechart2.chart"})
    @ResponseBody
    public DataVO showLineChart2() {
        return chartService.getLineChartData2();
    }
   

    @RequestMapping({"/linechart3.chart"})
    @ResponseBody
    public DataVO selectListWeeklyUsers() {
        return chartService.selectListWeeklyUsers();
    }
    
    @RequestMapping({"/Top10PageList.chart"})
    @ResponseBody
    public DataVO selectListTop10Page() {
        return chartService.selectListTop10Page();
    }
    
    @RequestMapping({"/ClientScreenSize.chart"})
    @ResponseBody
    public DataVO selectListClientScreenSize() {
        return chartService.selectListClientScreenSize();
    }


}
