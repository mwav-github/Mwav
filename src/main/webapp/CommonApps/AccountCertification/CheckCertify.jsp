<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
    <title>Mwav - 이메일 인증</title>
    <jsp:include page="/PartsOfContent/Head_Import.jsp" flush="false" />

    <script>
        $.ready(function(){
            alert('${status}')
        })
    </script>
</head>
<body>
    <h1>이메일 인증 완료</h1>
</body>
</html>
