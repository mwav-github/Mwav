package net.common.charts.vo;


import org.codehaus.jackson.annotate.JsonProperty;


public class SeriesVO {
    @JsonProperty("name")
    private String name;
    @JsonProperty("data")
    private double[] data;

  //http://marobiana.tistory.com/119 만들어야한다. 안그러면 오류.
    private SeriesVO() {} // 디폴트 생성자
    
    public SeriesVO(String name, double[] data) {
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
