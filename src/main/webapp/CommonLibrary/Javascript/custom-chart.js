/* Custom functions that help in getting remote data and drawing a chart to a div */

function createNewLineChart(divId, getChartFunction) {
    var chart = {
        options: {
            chart: {
                renderTo: divId
            }
        }
    };
    chart = jQuery.extend(true, {}, getChartFunction, chart);
    chart.init(chart.options);
    return chart;
}


function getBaseLineChart() {

    var baseChart = {
        highchart: null,
        defaults: {

            chart: {
            	type: 'line'
            },
           
            title: {
            	 text: '주별 접속 통계'
            },
            xAxis: {
                categories: [],
                title: {
                    text: 'Temperature (°C)'
                }
            },
            yAxis: {
            	text: null      
            },
            plotOptions: {
                line: {
                    dataLabels: {
                        enabled: true
                    },
                    enableMouseTracking: false
                }
            },
            series: []

        },

        // here you'll merge the defaults with the object options
        init: function(options) {
            this.highchart = jQuery.extend({}, this.defaults, options);
        },

        create: function() {
            new Highcharts.Chart(this.highchart);
        }

    };
    return baseChart;
}//function end

function getBaseChart() {

    var baseChart = {
        highchart: null,
        defaults: {

            chart: {
            	type: 'line'
            },
            
            title: {
                text: null,
                x: -20,
                style: {
                    color: '#3366cc',
                    fontWeight: 'bold',
                    fontSize: '16px',
                    fontFamily: 'Trebuchet MS, Verdana, sans-serif'
                }
            },
            xAxis: {
            	text: null,
                categories: [],
                title: {
                    text: 'Temperature (°C)'
                }
            },
            yAxis: {
            	text: null,
            	title: {
                    text: 'Temperature (°C)'
                }
            },
            plotOptions: {
                line: {
                    dataLabels: {
                        enabled: true
                    },
                    enableMouseTracking: true
                }
            },
            legend: {
               
            },
            series: []

        },

        // here you'll merge the defaults with the object options
        init: function(options) {
            this.highchart = jQuery.extend({}, this.defaults, options);
        },

        create: function() {
            new Highcharts.Chart(this.highchart);
        }

    };
    return baseChart;
}//function end

function getBaseColumnChart() {

    var baseChart = {
        highchart: null,
        defaults: {

        	chart: {
                type: "column"
            },
            title: {
                text: "Student data"
            },
            xAxis: {
                type: 'category',
                allowDecimals: false,
                title: {
                    text: ""
                }
            },
            yAxis: {
                title: {
                    text: "Scores"
                }
            },
            series: [{
                
            }]

        },

        // here you'll merge the defaults with the object options
        init: function(options) {
            this.highchart = jQuery.extend({}, this.defaults, options);
        },

        create: function() {
            new Highcharts.Chart(this.highchart);
        }

    };
    return baseChart;
}//function end


function getRemoteDataDrawChart(url, linechart) {

    $.ajax({
        url: url,
        dataType: 'json',
        success: function(data) {

            var categories = data.categories;
            var title = data.title;
            var yTitle = data.yAxisTitle;
            var xTitle = data.xAxisTitle;
            alert(xTitle);
            var divId =  data.divId;

            //populate the lineChart options (highchart)
            linechart.highchart.xAxis.categories = categories;
            linechart.highchart.title.text = title;
            linechart.highchart.yAxis.title.text = yTitle;
            linechart.highchart.xAxis.title.text = xTitle;
            linechart.highchart.chart.renderTo = divId;

            $.each(data.series, function(i, seriesItem) {
                console.log(seriesItem) ;
                var series = {
                    data: []
                };
                series.name = seriesItem.name;
                series.color = seriesItem.color;

                $.each(seriesItem.data, function(j, seriesItemData) {
                    console.log("Data (" + j +"): "+seriesItemData) ;
                    series.data.push(parseFloat(seriesItemData));
                });

                linechart.highchart.series[i] = series;
            });

            //draw the chart
            linechart.create();
        },
        error: function (xhr, ajaxOptions, thrownError) {
            alert(xhr.status);
            alert(thrownError);
        },
        cache: false
    });
} //function end