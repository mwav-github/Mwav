package net.common.charts.vo;

import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @Class Name : SeriesDataTypeOneVO.java
 * @Description : Series내 Data의 상세 설정을 위한 타입. 주로 SeriesTypeThreeVO와 많이 사용 된다.
 * @Modification Information
 *
 *               수정일 수정자 수정내용 ------- ------- ------------------- 2018. 03. 30.
 *               김주성 최초 생성
 *
 * @author Mwav CEO 김주성
 * @since 2018. 03. 30.
 * @version 0.1
 * @see Series 타입 분리
 *
 */

public class SeriesDataTypeOneVO {
	@JsonProperty("y")
	private double y;
	@JsonProperty("name")
	private String name;
	@JsonProperty("color")
	private String color;

	// http://marobiana.tistory.com/119 만들어야한다. 안그러면 오류.
	public SeriesDataTypeOneVO() {
	} // 디폴트 생성자

	public SeriesDataTypeOneVO(double y, String name, String color) {
		this.y = y;
		this.name = name;
		this.color = color;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getY() {
		return y;
	}

	public void setY(double y) {
		this.y = y;
	}
}
