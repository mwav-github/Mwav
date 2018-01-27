package net.common.charts.controller;

import javax.inject.Inject;

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
    public DataVO selectListWeeklyUsers() {
        return chartService.selectListWeeklyUsers();
    }
    
    @RequestMapping({"/charts/highsofts/Top10PageList.mwav"})
    @ResponseBody
    public DataVO selectListTop10Page() {
        return chartService.selectListTop10Page();
    }
    
    @RequestMapping({"/charts/highsofts/ClientScreenSize.mwav"})
    @ResponseBody
    public DataVO selectListClientScreenSize() {
        return chartService.selectListClientScreenSize();
    }


}
