package net.common.charts.vo;

import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @Class Name : SeriesTypeTwoVO.java
 * @Description : Series객체 두번째 타입으로 data객체가 X,Y축으로 구성되는 형태.
 *                예) data: [[5, 2], [6, 3], [8, 2]] 
 *                http://jsfiddle.net/gh/get/jquery/1.7.1/highslide-software/highcharts.com/tree/master/samples/highcharts/series/data-array-of-arrays/
 * @Modification Information
 *
 * 수정일 수정자 수정내용
 * ------- ------- -------------------
 * 2018. 03. 30. 김주성 최초 생성
 *
 * @author Mwav CEO 김주성
 * @since 2018. 03. 30.
 * @version 0.1
 * @see Series 타입 분리
 *
 */
public class SeriesTypeTwoVO {
	
	@JsonProperty("name")
	private String name;

	@JsonProperty("data")
	private double[] data;

	public SeriesTypeTwoVO() {
	}

	public SeriesTypeTwoVO(String name, double[] data) {
		this.name = name;
		this.data = data;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double[] getData() {
		return data;
	}

	public void setData(double[] data) {
		this.data = data;
	}
}
