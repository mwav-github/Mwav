<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
    <title>Mwav - 이메일 인증</title>
    <jsp:include page="/PartsOfContent/Head_Import.jsp" flush="false" />
    <script>
        $(document).ready(function(){
            <%--alert('${status}')--%>
        })
    </script>

    <style>
        body{
            width:100%;
            height:100%;
            background: #F4F4F4;
        }

        .top{
            width: 100%;
            min-height: 80px;
            background: white;
        }

        .main{
            margin-left: 20px;
            margin-top: 20px;
            width: 500px;
            height: 250px;
        }

        .content_box{
            position: relative;
            background: white;
            width: 100%;
            height: 100%;
        }

        .content_title{
            margin: 0 auto;
            width: 400px;
            padding-top: 10px;
        }

        .content_detail{
            margin: 0 auto;
            width: 400px;
            margin-top: 40px;
        }

        .content_footer{
            margin-left: 140px;
            position: absolute;
            bottom: 40px;
            text-align: center;
        }

    </style>

</head>
<body>
    <div class="top">
        <a class="navbar-brand active logo_800_m" href="/">
            <img src="/Images/CompanyLogos/CompanyLogo.gif" class="img-thumbnail img-responsive logo_800_h" alt="CompanyLogo">
        </a>
    </div>
    <div class="main">
        <div class="content_box">
            <div class="content_title">
                <h3><b>${msg}</b></h3>
            </div>

            <div class="content_detail">
                <c:choose>
                    <c:when test = "${status eq 'SUCCESS'}">
                        성공적으로 인증이 완료되었습니다.
                    </c:when>
                    <c:when test = "${status eq 'ALREADY'}">
                        이미 인증된 사용자 입니다.
                    </c:when>
                    <c:when test = "${status eq 'TIME_OUT'}">
                        인증메일 재발급이 필요합니다.
                    </c:when>
                </c:choose>
            </div>

            <div class="content_footer">
                <a class="btn btn-block btn-primary" href="https://mwav.net">Mwav.net 으로 바로 가기</a>
            </div>
        </div>
    </div>
</body>
</html>
