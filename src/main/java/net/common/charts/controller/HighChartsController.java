package net.common.charts.controller;

import net.common.charts.service.HighChartsService;
import net.common.charts.vo.DataVO;
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

    @RequestMapping({"/linechart1"})
    @ResponseBody
    public DataVO showLineChart1() {
        return chartService.getLineChartData1();
    }

    @RequestMapping({"/linechart2"})
    @ResponseBody
    public DataVO showLineChart2() {
        return chartService.getLineChartData2();
    }


    @RequestMapping({"/linechart3"})
    @ResponseBody
    public DataVO selectListWeeklyUsers() {
        return chartService.selectListWeeklyUsers();
    }


}
