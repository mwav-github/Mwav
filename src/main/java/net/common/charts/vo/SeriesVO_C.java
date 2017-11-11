package net.common.charts.vo;


import java.util.List;

import org.codehaus.jackson.annotate.JsonProperty;


public class SeriesVO_C {
    @JsonProperty("name")
    private String name;
    @JsonProperty("data")
    private List<SeriesVO_Arrary2> data;

  //http://marobiana.tistory.com/119 만들어야한다. 안그러면 오류.
    private SeriesVO_C() {} // 디폴트 생성자
    
    public SeriesVO_C(String name, List<SeriesVO_Arrary2> list) {
        this.name = name;
        this.data = list;
      }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }



    public List<SeriesVO_Arrary2> getData() {
        return data;
    }

    public void setData(List<SeriesVO_Arrary2> data) {
        this.data = data;
    }
}
