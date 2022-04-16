package net.common.charts.vo;

import java.util.List;

import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @Class Name : SeriesTypeThreeVO.java
 * @Description : Series객체 세번째 타입으로 x,y축이 없는 형태의 그래프 즉 piechart 같은 경우 name - 데이터명 / y - 데이터값축이된다.
 *                이 경우 실질적으로 series 내 name : 'Brands'는 나타나지 않으며, 단 아래 경우에는 나타난다. 
 *                예) series: [{
						        name: 'Brands',
						        colorByPoint: true,
						        data: [{
						            name: 'Chrome',
						            y: 61.41,
						            sliced: true,
						            selected: true
						        }, {
						            name: 'Internet Explorer',
						            y: 11.84
						        }]
 *                1) http://jsfiddle.net/gh/get/library/pure/highcharts/highcharts/tree/master/samples/highcharts/demo/combo/
 *                2) http://jsfiddle.net/gh/get/jquery/1.7.1/highslide-software/highcharts.com/tree/master/samples/highcharts/series/data-array-of-objects/
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
public class SeriesTypeThreeVO {
	@JsonProperty("name")
	private String name;

	@JsonProperty("data")
	private List<SeriesDataTypeOneVO> data;

	public SeriesTypeThreeVO() {
	}

	public SeriesTypeThreeVO(String name, List<SeriesDataTypeOneVO> list) {
		this.name = name;
		this.data = list;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<SeriesDataTypeOneVO> getData() {
		return data;
	}

	public void setData(List<SeriesDataTypeOneVO> data) {
		this.data = data;
	}
}
