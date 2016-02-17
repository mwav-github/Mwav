<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="ImageToolbar" content="no">
<link href="/HomePage/App_Themes/Objects.css" rel="stylesheet" type="text/css"/>
    <link href="/HomePage/App_Themes/OverallPage.css" rel="stylesheet" type="text/css"/>


<style>
.addr {
	width: 350px;
}
xmp {
	font-family: 나눔고딕코딩, 궁서체, monospace;
	background: #eeeeee;
	color: black;
	font-size: 12px;
}
.license {
	font-size: 14px;
	font-weight: bold;
	color: 990000;
}
</style>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-migrate/1.2.1/jquery-migrate.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
<link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/themes/smoothness/jquery-ui.min.css" />
<link rel="stylesheet" href="//xenosi.de/load/roadzip/roadzip.css" />
	<link href="style.css" rel="stylesheet" type="text/css">
	
<script src="//xenosi.de/load/jquery/jquery.placeholder.min.js"></script>
<script src="//xenosi.de/load/roadzip/roadzip.min.js"></script>
<script>
function zipCallback(row) {
	console.log(row);
}

$(function() {
	$('input.XenoFindZip').each(XenoZipFinder);
});
</script>
</head>
<body>
	<!-- jquery ui 가 필요합니다. --> 
	<!-- 구버전 IE 에 placeholder 지원 : https://code.google.com/p/jqueryplaceholder/ --> 
	
	<!-- ssl 대응 됩니다. cdn 이용하듯 서버에 저장하지 말고 그대로 링크하세요. -->
<script>
	$(function() {
		$('input.XenoFindZip').each(XenoZipFinder); // input 에 검색스크립트 연결
	});
	</script>
	
	<!-- 자동으로 채워지는 필드명을 선택하는 방법 예제 -->
	<form  action="">
		<label>
			<input type="text" class="XenoFindZip" placeholder="엔터를 누르면 검색됩니다." data-z="zip" data-a="ad" data-r="adr" data-e="ade" data-n="n">
			<span class="XenoFindZipLabel"></span>
		</label>
		<table><!-- 사용하지 않는 필드는 생략해도 오류나지 않습니다. -->
		<tbody>
		<tr>
		<td>우편번호</td>
		<td><input type="text" name="zip" readonly></td>
		</tr>
		<tr>
		<td>주소</td>
		<td><input type="text" class="addr" name="ad" readonly></td>
		</tr>
		<tr>
		<td>상세주소</td>
		<td><input type="text" class="addr" name="adr"></td>
		</tr>
		<tr>
		<td>영문주소</td>
		<td><input type="text" class="addr" name="ade" readonly></td>
		</tr>
		<tr>
		<td>영문상세주소</td>
		<td><input type="text" class="addr" name="adre"></td>
		</tr>
		<tr>
		<td>기초구역번호</td>
		<td><input type="text" name="n" readonly></td>
		</tr>
		</tbody>
		</table>
	</form>
	
	<!-- callback 으로 원본 데이터 받아오는 예제 -->
	<script>
	function zipCallback(row) {
		console.log(row);
	}
	</script>
	

</body>
</html>