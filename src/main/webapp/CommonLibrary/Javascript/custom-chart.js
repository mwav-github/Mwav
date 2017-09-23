/* Custom functions that help in getting remote data and drawing a chart to a div */

function createNewLineChart(divId, getChartFunction) {
	var linechart = {
		options : {
			chart : {
				renderTo : divId
			}
		}
	};
	linechart = jQuery.extend(true, {}, getChartFunction, linechart);
	linechart.init(linechart.options);
	return linechart;
}

function createNewColumnChart(divId, getChartColumnFunction) {
	var columnchart = {
		options : {
			chart : {
				renderTo : divId
			}
		}
	};
	
	columnchart = jQuery.extend(true, {}, getChartColumnFunction, columnchart);
	columnchart.init(columnchart.options);
	return columnchart;
}

function getBaseLineChart() {

	var baseLineChart = {
		highchart : null,
		defaults : {

			chart : {
				type : 'line'
			},

			title : {
				text : '주별 접속 통계'
			},
			xAxis : {
				categories : [],
				title : {
					text : 'Temperature (°C)'
				}
			},
			yAxis : {
				title : {
					text : "Scores"
				}
			},
			plotOptions : {
				line : {
					dataLabels : {
						enabled : true
					},
					enableMouseTracking : false
				}
			},
			series : []

		},

		// here you'll merge the defaults with the object options
		init : function(options) {
			this.highchart = jQuery.extend({}, this.defaults, options);
		},

		create : function() {
			new Highcharts.Chart(this.highchart);
		}

	};
	return baseLineChart;
}//function end

function getBaseChart() {

	var baseChart = {
		highchart : null,
		defaults : {

			chart : {
				type : 'line'
			},

			title : {
				text : null,
				x : -20,
				style : {
					color : '#3366cc',
					fontWeight : 'bold',
					fontSize : '16px',
					fontFamily : 'Trebuchet MS, Verdana, sans-serif'
				}
			},
			xAxis : {
				text : null,
				categories : [],
				title : {
					text : 'Temperature (°C)'
				}
			},
			yAxis : {
				text : null,
				title : {
					text : 'Temperature (°C)'
				}
			},
			plotOptions : {
				line : {
					dataLabels : {
						enabled : true
					},
					enableMouseTracking : true
				}
			},
			legend : {

			},
			series : []

		},

		// here you'll merge the defaults with the object options
		init : function(options) {
			this.highchart = jQuery.extend({}, this.defaults, options);
		},

		create : function() {
			new Highcharts.Chart(this.highchart);
		}

	};
	return baseChart;
}//function end

function getBaseColumnChart() {

	var baseColumnChart = {
		highchart : null,
		defaults : {

			chart : {
				type: 'column'
			},
			title : {
				text : null
			},
			xAxis : {
				type : 'category',
				allowDecimals : false,
				title : {
					text : "Top10 Pages"
				}
			},
			yAxis : {
				title : {
					text : "Scores"
				}
			},
			tooltip : {
				headerFormat : '<span style="font-size:10px">{point.key}</span><table>',
				pointFormat : '<tr><td style="color:{series.color};padding:0">{series.name}: </td>'
						+ '<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
				footerFormat : '</table>',
				shared : true,
				useHTML : true
			},
			series : [ {

			} ]

		},

		// here you'll merge the defaults with the object options
		init : function(options) {
			this.highchart = jQuery.extend({}, this.defaults, options);
		},

		create : function() {
			new Highcharts.Chart(this.highchart);
		}

	};
	return baseColumnChart;
}//function end

function getBasePieChart() {

	var basePieChart = {
		highchart : null,
		defaults : {

			chart : {
				plotBackgroundColor: null,
		        plotBorderWidth: null,
		        plotShadow: false,
				type : 'pie'
			},

			title : {
				text : null,
				x : -20,
				style : {
					color : '#3366cc',
					fontWeight : 'bold',
					fontSize : '16px',
					fontFamily : 'Trebuchet MS, Verdana, sans-serif'
				}
			},
			tooltip: {
		        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
		    },
		    plotOptions: {
		        pie: {
		            allowPointSelect: true,
		            cursor: 'pointer',
		            dataLabels: {
		                enabled: true,
		                format: '<b>{point.name}</b>: {point.percentage:.1f} %',
		                style: {
		                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
		                }
		            }
		        }
		    },
			
			series : []

		},

		// here you'll merge the defaults with the object options
		init : function(options) {
			this.highchart = jQuery.extend({}, this.defaults, options);
		},

		create : function() {
			new Highcharts.Chart(this.highchart);
		}

	};
	return basePieChart;
}//function end

function getRemoteDataDrawChart(url, chartType) {

	$.ajax({
		url : url,
		dataType : 'json',
		success : function(data) {

			var categories = data.categories;
			var title = data.title;
			var yTitle = data.yAxisTitle;
			var xTitle = data.xAxisTitle;
			//alert(xTitle);
			var divId = data.divId;

			//populate the lineChart options (highchart)
			chartType.highchart.xAxis.categories = categories;
			chartType.highchart.title.text = title;
			chartType.highchart.yAxis.title.text = yTitle;
			chartType.highchart.xAxis.title.text = xTitle;
			chartType.highchart.chart.renderTo = divId;

			$.each(data.series, function(i, seriesItem) {
				console.log(seriesItem);
				var series = {
					data : []
				};
				series.name = seriesItem.name;
				series.color = seriesItem.color;

				$.each(seriesItem.data, function(j, seriesItemData) {
					console.log("Data (" + j + "): " + seriesItemData);
					series.data.push(parseFloat(seriesItemData));
				});

				chartType.highchart.series[i] = series;
			});

			//draw the chart
			chartType.create();
		},
		error : function(xhr, ajaxOptions, thrownError) {
			alert(xhr.status);
			alert(thrownError);
		},
		cache : false
	});
} //function end

function getRemoteDataDrawColumnChart(url, chartType) {

	$.ajax({
		url : url,
		dataType : 'json',
		success : function(data) {
            var categories = data.categories;
			var title = data.title;
			//alert(xTitle);
			var divId = data.divId;
			var type = data.chartType;
			
			//populate the lineChart options (highchart)
			chartType.highchart.xAxis.categories = categories;
			chartType.highchart.title.text = title;
			chartType.highchart.chart.renderTo = divId;

			//chartType.highchart.chart.type = chartType;
			chartType.highchart.chart.type = type;

		    
			
			
			$.each(data.series, function(i, seriesItem) {
				//console.log("series"+series);
				console.log(seriesItem);
				var series = {
					data : []
				};
				series.name = seriesItem.name;
				series.data = seriesItem.data;
				
				$.each(seriesItem.data, function(j, seriesItemData) {
				    console.log("Data (" + j +"): "+seriesItemData) ;
				    series.data.push(parseFloat(seriesItemData));
				});

				chartType.highchart.series[i] = series;
			});

			//draw the chart
			chartType.create();
		},
		error : function(xhr, ajaxOptions, thrownError) {
			alert(xhr.status);
			alert(thrownError);
		},
		cache : false
	});
} //function end

function getRemoteDataDrawPieChart(url, chartType) {

	$.ajax({
		url : url,
		dataType : 'json',
		success : function(data) {
            var title = data.title;
			//alert(xTitle);
			var divId = data.divId;
			var type = data.chartType;
			
			//populate the lineChart options (highchart)
			chartType.highchart.title.text = title;
			chartType.highchart.chart.renderTo = divId;

			//chartType.highchart.chart.type = chartType;
			chartType.highchart.chart.type = type;

		    
			
			
			$.each(data.series, function(i, seriesItem) {
				//console.log("series"+series);
				console.log(seriesItem);
				var series = {
					data : [{
					}]
				};
				series.data.y = seriesItem.name;
				series.data.name = seriesItem.data;
				
				$.each(seriesItem.data, function(j, seriesItemData) {
				    console.log("Data (" + j +"): "+seriesItemData) ;
				    series.data.y.push(parseFloat(seriesItemData));
				    series.data.name.push(parseFloat(seriesItemData));
				});
				chartType.highchart.series[i] = series;
			});

			//draw the chart
			chartType.create();
		},
		error : function(xhr, ajaxOptions, thrownError) {
			alert(xhr.status);
			alert(thrownError);
		},
		cache : false
	});
} //function end

function getRemoteDataDrawChart_2(url, chartType) {

	$.ajax({
		url : url,
		dataType : 'json',
		success : function(data) {

			var categories = data.categories;
			var title = data.title;
			var yTitle = data.yAxisTitle;
			var xTitle = data.xAxisTitle;
			//alert(xTitle);
			var divId = data.divId;

			//populate the lineChart options (highchart)
			chartType.highchart.xAxis.categories = categories;
			chartType.highchart.title.text = title;
			chartType.highchart.yAxis.title.text = yTitle;
			chartType.highchart.xAxis.title.text = xTitle;
			chartType.highchart.chart.renderTo = divId;

			$.each(data.series, function(i, seriesItem) {
				console.log(seriesItem);
				var series = {
					data : []
				};
				series.name = seriesItem.name;
				series.color = seriesItem.color;
				console.log("Data (" + i + "): " + seriesItem.data);
				series.data.push(parseFloat(seriesItem.data));

				/*$.each(seriesItem.data, function(j, seriesItemData) {
				    console.log("Data (" + j +"): "+seriesItemData) ;
				    series.data.push(parseFloat(seriesItemData));
				});*/

				chartType.highchart.series[i] = series;
			});

			//draw the chart
			chartType.create();
		},
		error : function(xhr, ajaxOptions, thrownError) {
			alert(xhr.status);
			alert(thrownError);
		},
		cache : false
	});
} //function end
