package net.common.charts.vo;


import org.codehaus.jackson.map.annotate.JsonRootName;

import java.util.List;

@JsonRootName("dataBean")
public class DataVO {
    private String divId;
    private String title;
    private String yAxisTitle;
    private String xAxisTitle;
    private String chartType;
    private List<String> categories;
    private List<SeriesVO> series;
	private List<SeriesVO_C> seriesArrary2;
 
	public DataVO(){}
	
    public DataVO(String divId, String title, String yAxisTitle, String xAxisTitle, String chartType, List<String> categories, List<SeriesVO> series) {
        this.setDivId(divId);
        this.setTitle(title);
        this.setyAxisTitle(yAxisTitle);
        this.setxAxisTitle(xAxisTitle);
        this.setChartType(chartType);
        this.setCategories(categories);
        this.setSeries(series);
    }
    
    //생성자 오버로딩
    public DataVO(String divId, String title,  String chartType, List<SeriesVO_C> list_2) {
        this.setDivId(divId);
        this.setTitle(title);
        this.setChartType(chartType);
        this.setSeriesArrary(list_2);
    }
    
  

    public String getChartType() {
		return chartType;
	}



	public void setChartType(String chartType) {
		this.chartType = chartType;
	}



	public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getyAxisTitle() {
        return yAxisTitle;
    }

    public void setyAxisTitle(String yAxisTitle) {
        this.yAxisTitle = yAxisTitle;
    }

    public List<String> getCategories() {
        return categories;
    }

    public void setCategories(List<String> categories) {
        this.categories = categories;
    }

    public List<SeriesVO> getSeries() {
        return series;
    }

    public void setSeries(List<SeriesVO> series) {
        this.series = series;
    }
    public List<SeriesVO_C> getSeriesArrary() {
        return seriesArrary2;
    }

    public void setSeriesArrary(List<SeriesVO_C> list_2) {
        this.seriesArrary2 = list_2;
    }

    public String getDivId() {
        return divId;
    }

    public void setDivId(String divId) {
        this.divId = divId;
    }

    public String getxAxisTitle() {
        return xAxisTitle;
    }

    public void setxAxisTitle(String xAxisTitle) {
        this.xAxisTitle = xAxisTitle;
    }
}
