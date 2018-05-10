<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<tiles:insertAttribute name="head" />
</head>
<body class="fixed-nav sticky-footer bg-dark">
	<tiles:insertAttribute name="header" />
	<div class="content-wrapper">
		<div class="container-fluid">
			<tiles:insertAttribute name="content" />
		</div>
		<div class="enter"></div>
		<tiles:insertAttribute name="footer" />
	</div>
</body>
</html>