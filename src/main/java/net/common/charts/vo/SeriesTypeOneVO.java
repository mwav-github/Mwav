package net.common.charts.vo;


import org.codehaus.jackson.annotate.JsonProperty;


/**
 * @Class Name : SeriesTypeOneVO.java
 * @Description : Series객체 첫번째 타입으로 data내 y축 데이터만 있고, name과 data가 순차적으로 1:1 인 경우.
 *               예) data: [0, 5, 3, 5] - Y축
 *                http://jsfiddle.net/gh/get/jquery/1.7.1/highslide-software/highcharts.com/tree/master/samples/highcharts/chart/reflow-true/
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
public class SeriesTypeOneVO {
    @JsonProperty("name")
    private String name;
    @JsonProperty("data")
    private double data;

  //http://marobiana.tistory.com/119 만들어야한다. 안그러면 오류.
    private SeriesTypeOneVO() {} // 디폴트 생성자
    
    public SeriesTypeOneVO(String name, double data) {
        this.name = name;
        this.data = data;
      }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }



    public double getData() {
        return data;
    }

    public void setData(double data) {
        this.data = data;
    }
}
