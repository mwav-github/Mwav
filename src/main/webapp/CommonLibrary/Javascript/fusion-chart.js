/* 
 * Custom functions that help in getting remote data and drawing a chart to a div 
 */


//var script = document.createElement('script');  
//script.src = "https://cdn.fusioncharts.com/fusioncharts/latest/fusioncharts.js";  
//document.head.appendChild(script);
//
//script.src = "https://cdn.fusioncharts.com/fusioncharts/latest/themes/fusioncharts.theme.fusion.js";  
//document.head.appendChild(script);
//
//function addJavascript(jsname) {
//	var th = document.getElementsByTagName('head')[0];
//	var s = document.createElement('script');
//	s.setAttribute('type','text/javascript');
//	s.setAttribute('src', jsname);
//	th.appendChild(s);
//}
//addJavascript('https://cdn.fusioncharts.com/fusioncharts/latest/fusioncharts.js');
//addJavascript('https://cdn.fusioncharts.com/fusioncharts/latest/themes/fusioncharts.theme.fusion.js');


// 컬럼차트 문구
var columnChartData = {
	'chart' : {
		'caption' : '',
		'subcaption': '',
		'xAxisName' : '',
		'yAxisName' : '',
		'numberPrefix' : '',
		'theme' : 'fusion'
	},
	'data' : []
};

// 컬럼차트 문구 설정
var setColumnChartData = function(caption, subCaption, xAxisName, yAxisName, numberPrefix){
	columnChartData.chart.caption = caption;
	columnChartData.chart.subCaption = subCaption;
	columnChartData.chart.xAxisName = xAxisName;
	columnChartData.chart.yAxisName = yAxisName;
	columnChartData.chart.numberPrefix = numberPrefix;
}

// 컬럼차트 데이터 호출, 랜더링
var renderColumnChart = function(columnChartConfig, contextPath, url){
	
	$.ajax({
		url : contextPath + url,
		dataType : "text",
		success : function(data) {
			var dataObjectArray = new Array();
			var tmp = JSON.parse(decodeURIComponent(data));

			$.each(tmp, function(key, value) {
				var dataObject = {
					label : '',
					value : ''
				};
				dataObject.label = value.label;
				dataObject.value = value.value;
				dataObjectArray.push(dataObject);
			});
			columnChartData.data = dataObjectArray;
			columnChartConfig.setJSONData(columnChartData);
			columnChartConfig.render();
		},
		error : function(data) {
			alert("Column Chart ERROR!");
		}
	});
	
}


// 라인차트 문구
var lineChartData = {
	'chart' : {
		'caption' : '',
		'subcaption': '',
		'yaxisname' : '',
		'numberPrefix' : '',
		'rotatelabels' : '',
		'setadaptiveymin' : '',
		'theme': 'fusion'
	},
	'data' : []
};

// 라인차트 문구 설정
var setLineChartData = function(caption, subCaption, yaxisname, numberPrefix, rotatelabels, setadaptiveymin){
	lineChartData.chart.caption = caption;
	lineChartData.chart.subCaption = subCaption;
	lineChartData.chart.yaxisname = yaxisname;
	lineChartData.chart.numberPrefix = numberPrefix;
	lineChartData.chart.rotatelabels = rotatelabels;
	lineChartData.chart.setadaptiveymin = setadaptiveymin;
}

// 라인차트 데이터 호출, 랜더링
var renderLineChart = function(lineChartConfig, contextPath, url){
	
	$.ajax({
		url : contextPath + url,
		dataType : "text",
		success : function(data) {
			var dataObjectArray = new Array();
			var tmp = JSON.parse(data);
	
			$.each(tmp, function(key, value) {
				var dataObject = {
					label : '',
					value : ''
				};
				dataObject.label = value.label;
				dataObject.value = value.value;
				dataObjectArray.push(dataObject);
			});
			lineChartData.data = dataObjectArray;
			lineChartConfig.setJSONData(lineChartData);
			lineChartConfig.render();
		},
		error : function(data) {
			alert("Line Chart ERROR!");
		}
	});
}


// 파이차트 문구
var pieChartData = {
	'chart' : {
		'caption' : 'Client Screen Size List',
		'plottooltext': '<b>$percentValue</b> of web browsers run on $label ', 
	    'showlegend': '1',
	    'showpercentvalues': '1',
	    'legendposition': 'bottom',
	    'usedataplotcolorforlabels': '1',
		'theme': 'fusion'
	},
	'data' : []
};

// 파이차트 문구 설정
var setPieChartData = function(caption, plottooltext, showlegend, showpercentvalues, legendposition, usedataplotcolorforlabels){
	pieChartData.chart.caption = caption;
	pieChartData.chart.plottooltext = plottooltext;
	pieChartData.chart.showlegend = showlegend;
	pieChartData.chart.showpercentvalues = showpercentvalues;
	pieChartData.chart.legendposition = legendposition;
	pieChartData.chart.usedataplotcolorforlabels = usedataplotcolorforlabels;
}

// 파이차트 데이터 호출, 랜더링
var renderPieChart = function(pieChartConfig, contextPath, url){
	
	$.ajax({
		url : contextPath + url,
		dataType : "text",
		success : function(data) {
			var dataObjectArray = new Array();
			var tmp = JSON.parse(data);
	
			$.each(tmp, function(key, value) {
				var dataObject = {
					label : '',
					value : ''
				};
				dataObject.label = value.label;
				dataObject.value = value.value;
				dataObjectArray.push(dataObject);
			});
			pieChartData.data = dataObjectArray;
			pieChartConfig.setJSONData(pieChartData);
			pieChartConfig.render();
		},
		error : function(data) {
			alert("Pie Chart ERROR!");
		}
	});
}

