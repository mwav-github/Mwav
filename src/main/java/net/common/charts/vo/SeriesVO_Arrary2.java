package net.common.charts.vo;


import org.codehaus.jackson.annotate.JsonProperty;


public class SeriesVO_Arrary2 {
    @JsonProperty("y")
    private double y;
	@JsonProperty("name")
    private String name;
	@JsonProperty("color")
    private String color;


  //http://marobiana.tistory.com/119 만들어야한다. 안그러면 오류.
    public SeriesVO_Arrary2() {} // 디폴트 생성자
    
    public SeriesVO_Arrary2(double y, String name, String color) {
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
