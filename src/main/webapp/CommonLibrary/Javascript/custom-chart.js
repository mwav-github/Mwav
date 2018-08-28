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

function createNewPieChart(divId, getChartPieFunction) {
	var piechart = {
		options : {
			chart : {
				renderTo : divId
			}
		}
	};

	piechart = jQuery.extend(true, {}, getChartPieFunction, piechart);
	piechart.init(piechart.options);
	return piechart;
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
}// function end

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
}// function end

function getBaseColumnChart() {

	var baseColumnChart = {
		highchart : null,
		defaults : {

			chart : {
				type : 'column'
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
						+ '<td style="padding:0"><b>{point.y:.0f} </b></td></tr>',
				// .0f 소수점 제거하여 출력 / .1f 소수점 한자리 포함 출력
				footerFormat : '</table>',
				shared : true,
				useHTML : true
			},
			series : [ {

			} ],
			drilldown : [ {

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
}// function end

function getBasePieChart() {

	var basePieChart = {
		highchart : null,
		defaults : {

			chart : {
				plotBackgroundColor : null,
				plotBorderWidth : null,
				plotShadow : false,
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
			series : [ {
				data : []
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
	return basePieChart;
}// function end

function getRemoteDataDrawChart(url, chartType) {

	$.ajax({
		url : url,
		dataType : 'json',
		success : function(data) {

			var categories = data.categories;
			var title = data.title;
			var yTitle = data.yAxisTitle;
			var xTitle = data.xAxisTitle;
			 alert(xTitle);
			var divId = data.divId;

			// populate the lineChart options (highchart)
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
					//console.log("Data (" + j + "): " + seriesItemData);
					series.data.push(parseFloat(seriesItemData));
				});

				chartType.highchart.series[i] = series;
			});

			// draw the chart
			chartType.create();
		},
		error : function(xhr, ajaxOptions, thrownError) {
			alert(xhr.status);
			alert(thrownError);
		},
		cache : false
	});
} // function end

function getRemoteDataDrawChart_News(categories, title, yTitle, xTitle, divId, series, chartType) {

	var categories = JSON.parse(categories);
	var title = title;
	var yTitle = yTitle;
	var xTitle = xTitle;
	var divId = divId;
	
	// populate the lineChart options (highchart)
	chartType.highchart.xAxis.categories = categories;
	chartType.highchart.yAxis.max = 100;
	chartType.highchart.title.text = title;
	chartType.highchart.yAxis.title.text = yTitle;
	chartType.highchart.xAxis.title.text = xTitle;
	chartType.highchart.chart.renderTo = divId;

	$.each(JSON.parse(series), function(i, seriesItem) {

		console.log(seriesItem);
		var series = {
			data : []
		};
		series.name = seriesItem.name;
		
		$.each(seriesItem.data, function(j, seriesItemData) {
			//console.log("Data (" + j + "): " + seriesItemData);
			series.data.push(parseFloat(seriesItemData));
		});

		chartType.highchart.series[i] = series;
	});

	// draw the chart
	chartType.create();

} // function end


function getRemoteDataDrawColumnDrilldownChart(url, chartType) {

	$.ajax({
		url : url,
		dataType : 'json',
		success : function(data) {
			var categories = data.categories;
			var title = data.title;
			// alert(xTitle);
			var divId = data.divId;
			var type = data.chartType;

			// populate the lineChart options (highchart)
			chartType.highchart.xAxis.categories = categories;
			chartType.highchart.title.text = title;
			chartType.highchart.chart.renderTo = divId;

			// chartType.highchart.chart.type = chartType;
			chartType.highchart.chart.type = type;
	
			$.each(data.series, function(i, seriesItem) {
				console.log(seriesItem);
				var series = {
					data : []
				};
				series.name = seriesItem.name;
				//console.log("Data1 (" + i + "): " + seriesItem.name);
				/*
				 * console.log("Data (" + i + "): " + seriesItem.data);
				 * series.data.push(parseFloat(seriesItem.data));
				 */
				$.each(seriesItem.data, function(j, seriesItemData) {
					//console.log("Data (" + j + "): " + seriesItemData);
					// parseFloat에서 바꿔줌으로서 소수점 안나오도록
					series.data.push(parseInt(seriesItemData));
				});

				chartType.highchart.series[i] = series;
			});

			$.each(data.drilldown.series, function(i, seriesItem) {
				console.log(seriesItem);
				var drilldown = {
					series : []
				};
				series.name = seriesItem.name;
				series.id = seriesItem.name;
				$.each(seriesItem.name, function(j, seriesItemData) {

					series.data.push(parseInt(seriesItemData));
				});

				chartType.highchart.drilldown.series[i] = series;
			});

			// draw the chart
			chartType.create();
		},
		error : function(xhr, ajaxOptions, thrownError) {
			alert(xhr.status);
			alert(thrownError);
		},
		cache : false
	});
} // function end

function getRemoteDataDrawColumnChart(url, chartType) {

	$.ajax({
		url : url,
		dataType : 'json',
		success : function(data) {
			var categories = data.categories;
			var title = data.title;
			// alert(xTitle);
			var divId = data.divId;
			var type = data.chartType;

			// populate the lineChart options (highchart)
			chartType.highchart.xAxis.categories = categories;
			chartType.highchart.title.text = title;
			chartType.highchart.chart.renderTo = divId;

			// chartType.highchart.chart.type = chartType;
			chartType.highchart.chart.type = type;
			//			console.log('출력'+data.series);
			//			console.log('출력'+data.drilldown);
			$.each(data.series, function(i, seriesItem) {
				//				console.log(seriesItem);
				var series = {
					data : []
				};
				series.name = seriesItem.name;
				//console.log("Data1 (" + i + "): " + seriesItem.name);
				/*
				 * console.log("Data (" + i + "): " + seriesItem.data);
				 * series.data.push(parseFloat(seriesItem.data));
				 */
				$.each(seriesItem.data, function(j, seriesItemData) {
					//console.log("Data (" + j + "): " + seriesItemData);
					// parseFloat에서 바꿔줌으로서 소수점 안나오도록
					series.data.push(parseInt(seriesItemData));
				});

				chartType.highchart.series[i] = series;
			});

			$.each(data.series, function(i, seriesItem) {
				//				console.log(seriesItem);
				var series = {
					data : []
				};
				series.name = seriesItem.name;
				//console.log("Data1 (" + i + "): " + seriesItem.name);
				/*
				 * console.log("Data (" + i + "): " + seriesItem.data);
				 * series.data.push(parseFloat(seriesItem.data));
				 */
				$.each(seriesItem.data, function(j, seriesItemData) {
					//					console.log("Data (" + j + "): " + seriesItemData);
					// parseFloat에서 바꿔줌으로서 소수점 안나오도록
					series.data.push(parseInt(seriesItemData));
					series.data.drilldown = seriesItemData.name;
					//					console.log(seriesItemData.name);
				});

				chartType.highchart.series[i] = series;
			});

			// draw the chart
			chartType.create();
		},
		error : function(xhr, ajaxOptions, thrownError) {
			alert(xhr.status);
			alert(thrownError);
		},
		cache : false
	});
} // function end

function getRemoteDataDrawPieChart(url, chartType) {

	$.ajax({
		url : url,
		dataType : 'json',
		success : function(data) {
			var title = data.title;
			// alert(xTitle);
			var divId = data.divId;
			var type = data.chartType;
			var seriesArrary2 = data.seriesArrary;
			// populate the lineChart options (highchart)
			chartType.highchart.title.text = title;
			chartType.highchart.chart.renderTo = divId;

			// chartType.highchart.chart.type = chartType;
			chartType.highchart.chart.type = type;

			$.each(data.seriesArrary, function(i, seriesItem) {
				//				console.log(seriesItem.name);
				//				console.log(seriesItem.data);
				//				console.log(seriesItem.data.y);
				var series = {
					data : []
				};
				series.name = seriesItem.name;
				//console.log("Data1 (" + i + "): " + seriesItem.name);
				/*
				 * console.log("Data (" + i + "): " + seriesItem.data);
				 * series.data.push(parseFloat(seriesItem.data));
				 */
				$.each(seriesItem.data, function(j, seriesItemData) {
					//console.log("Data (" + j + "): " + seriesItemData);
					// parseFloat에서 바꿔줌으로서 소수점 안나오도록
					series.data.push(seriesItemData);
				});

				chartType.highchart.series[i] = series;
			});
			/*$.each(data.seriesArrary2, function(i, seriesItem) {
				var series = {
						data : []
					};
				// console.log("series"+series);
				console.log(seriesItem);
				//console.log("seriesItem.name" + seriesItem.name);
				//console.log("seriesItem.data" + seriesItem.data);

				//series.name = 'screensize';
				//console.log("Data1 (" + i + "): " + seriesItem.name);
				//console.log("Data2 (" + i + "): " + seriesItem.data);
				data.name = seriesItem.name;
				//series.data.y(parseInt(seriesItemData));
				data.y = parseInt(seriesItem.y);
				data.color = "#00FF00";
				//data.y = parseInt(seriesItem.data);
				//Unable to set property 'name' of undefined or null reference  y도 동일.
				//series.data.name = seriesItem.name;
				//series.data.name = '11';
				//series.data.y = parseInt(seriesItem.data);
				//chartType.highchart.series[i] = series;
			    //console.log("seriesy"+series.data.y);
			   // console.log("seriesname"+series.data.name);
				//series.data.name = seriesItem.name;
					//series.data.push(seriesItem);
				
				$.each(seriesItem.data, function(e, seriesItemData) {							    
					console.log("Data (" + e +"): "+seriesItemData) ;
				    //console.log("seriesItem.name"+seriesItem.name);
				    //console.log("seriesItem.data"+seriesItem.data);
					//series.data.y.push(parseInt(seriesItemData.name));
					//series.data.y = seriesItemData.name;
					//series.data.push(seriesItem.name
					series.data.y = parseInt(seriesItemData);
					series.data.name = '11';
				});

				//seriesItemName=JSON.parse(seriesItemName);
				$.each(seriesItem.name, function(a, seriesItemName) {	
					console.log("Data (" + a +"): "+seriesItemName) ;
				    //console.log("seriesItem.name"+seriesItem.name);
				    //console.log("seriesItem.data"+seriesItem.data);
					//series.data.y.push(parseInt(seriesItemData.name));
					//series.data.y = seriesItemData.name;
					//series.data.push(seriesItem.name
					
				});
				//series.data.name = seriesItem.name;

				chartType.highchart.series[i] = series;
			});*/

			// draw the chart
			chartType.create();
		},
		error : function(xhr, ajaxOptions, thrownError) {
			alert(xhr.status);
			alert(thrownError);
		},
		cache : false
	});
} // function end

function getRemoteDataDrawChart_2(url, chartType) {

	$.ajax({
		url : url,
		dataType : 'json',
		success : function(data) {

			var categories = data.categories;
			var title = data.title;
			var yTitle = data.yAxisTitle;
			var xTitle = data.xAxisTitle;
			// alert(xTitle);
			var divId = data.divId;

			// populate the lineChart options (highchart)
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

				/*
				 * $.each(seriesItem.data, function(j, seriesItemData) {
				 * console.log("Data (" + j +"): "+seriesItemData) ;
				 * series.data.push(parseFloat(seriesItemData)); });
				 */

				chartType.highchart.series[i] = series;
			});

			// draw the chart
			chartType.create();
		},
		error : function(xhr, ajaxOptions, thrownError) {
			alert(xhr.status);
			alert(thrownError);
		},
		cache : false
	});
} // function end
