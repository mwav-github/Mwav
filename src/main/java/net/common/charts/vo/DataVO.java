package net.common.charts.vo;


import org.codehaus.jackson.map.annotate.JsonRootName;

import java.util.List;
 
@JsonRootName("dataBean")
public class DataVO {
    private String divId;    //그려질 위치의 Html Element ID
    private String title;     // 차트 title
    private String yAxisTitle;  // y축 제목
    private String xAxisTitle;  // x축 제목
    private String chartType; // 차트 유형
    private List<String> categories; //X축 데이터 
    private List<SeriesTypeTwoVO> seriesTypeTwoVO;  // 실제 그려질 데이터 type_1  (A series is a set of data)
    private List<SeriesTypeThreeVO> seriesTypeThreeVO; // // 실제 그려질 데이터 type_2

 
	public DataVO(){}
	
	public DataVO(String divId, String title, String yAxisTitle, String xAxisTitle, String chartType, List<String> categories,List<SeriesTypeTwoVO> series) {
        this.setDivId(divId);
        this.setTitle(title);
        this.setyAxisTitle(yAxisTitle);
        this.setxAxisTitle(xAxisTitle);
        this.setChartType(chartType);
        this.setCategories(categories);
        this.setSeries(series);
        
    }
	
    public DataVO(String divId, String title, String yAxisTitle, String xAxisTitle, String chartType, List<String> categories,List<SeriesTypeTwoVO> series, List<SeriesTypeTwoVO> drilldown) {
        this.setDivId(divId);
        this.setTitle(title);
        this.setyAxisTitle(yAxisTitle);
        this.setxAxisTitle(xAxisTitle);
        this.setChartType(chartType);
        this.setCategories(categories);
        this.setSeries(series);
        this.setDrilldown(drilldown);
    }
    
    private void setDrilldown(List<SeriesTypeTwoVO> drilldown) {
		// TODO Auto-generated method stub
		
	}

	public List<SeriesTypeTwoVO> getSeriesTypeTwoVO() {
		return seriesTypeTwoVO;
	}

	public void setSeriesTypeTwoVO(List<SeriesTypeTwoVO> seriesTypeTwoVO) {
		this.seriesTypeTwoVO = seriesTypeTwoVO;
	}

	public List<SeriesTypeThreeVO> getSeriesTypeThreeVO() {
		return seriesTypeThreeVO;
	}

	public void setSeriesTypeThreeVO(List<SeriesTypeThreeVO> seriesTypeThreeVO) {
		this.seriesTypeThreeVO = seriesTypeThreeVO;
	}

	//생성자 오버로딩
    public DataVO(String divId, String title,  String chartType, List<SeriesTypeThreeVO> list_2) {
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

    public List<SeriesTypeTwoVO> getSeries() {
        return seriesTypeTwoVO;
    }

    public void setSeries(List<SeriesTypeTwoVO> series) {
        this.seriesTypeTwoVO = series;
    }
    public List<SeriesTypeThreeVO> getSeriesArrary() {
        return seriesTypeThreeVO;
    }

    public void setSeriesArrary(List<SeriesTypeThreeVO> list_2) {
        this.seriesTypeThreeVO = list_2;
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
