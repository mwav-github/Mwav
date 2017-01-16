<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<jsp:include page="/PartsOfContent/Head_Import.jsp" flush="false" />

<%-- 
1. 템플릿 : 참고하여 꼭 변경 http://wrapbootstrap.com/preview/WB0025522
                       http://startbootstrap.com/
                       https://wrapbootstrap.com/
                       
  http://bootsnipp.com/snippets/MRZjX - 특징
  
  http://bootsnipp.com/snippets/featured/product-page-for-online-shop
  
  
  http://bootsnipp.com/snippets/featured/shopping-order-status
  -> order 순서           
                       
--%>



<c:if test="${requestScope.loginCheck eq 2 }">
	<script type="text/javascript">
		alert('비밀번호가 틀렸습니다.');
		history.go(-1)
	</script>
</c:if>
<c:if test="${requestScope.loginCheck eq 7 }">
	<script type="text/javascript">
		alert('탈퇴한 회원입니다.');
		msg = '재 가입하시겠습니까.?'
		if (confirm(msg) != 0) {
			location.replace("/MasterPage_1.jsp?mode=Default"); // 이전 url 기록안하는 경우 , location.href 의 경우 이전기록이 남아 login.mwav로 포워딩
		} else {
			history.go(-1)
		}
	</script>
</c:if>

<c:if test="${requestScope.loginCheck eq 3 }">
	<script type="text/javascript">
		alert('아이디가 존재하지 않습니다.');
		history.go(-1);
	</script>
</c:if>
<c:if test="${requestScope.loginCheck eq 5 }">
	<script type="text/javascript">
		alert('임시패스워드입니다. 비밀번호 변경 후 로그인해주세요.');
		history.go(-1);
	</script>
</c:if>
<c:if test="${requestScope.updateMemberDelete eq 1 }">
	<script type="text/javascript">
		alert('회원탈퇴가 완료되었습니다. 감사합니다.');
	</script>
</c:if>
<c:if test="${requestScope.updateMemberDelete eq 0 }">
	<script type="text/javascript">
		alert('회원탈퇴가 되지 않았습니다.');
		history.go(-1);
	</script>
</c:if>

</head>
<body>

	<!-- Navigation (=메인 메뉴 및 슬라이드 쇼 포함)
	     Index의 마스터 페이지
	 -->
	<!--  //////////////////////////////////// -->
	<jsp:include page="/PartsOfContent/SiteHeader/FrontHeader_Shop_Left.jsp"
		flush="false" />

	<!-- Page Content -->
	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					Admins <small> GdsList</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="index.html">Home</a></li>
					<li>Admins</li>
					<li>Goods</li>
					<li class="active">GdsList</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column left메뉴 추후 변경 예정<시작>-->
			<div class="col-md-3">

				<jsp:include page="/Shop/ShopLeftMenu.jsp" flush="false" />
			</div>
			<!-- 끝 -->

<%--제품상세 http://bootsnipp.com/snippets/featured/product-page-for-online-shop --%>
			<div class="col-md-9">

                <div class="thumbnail">
                    <img class="img-responsive" src="http://placehold.it/800x300" alt="">
                    <div class="caption-full">
                        <h4 class="pull-right">$24.99</h4>
                        <h4><a href="#">Product Name</a>
                        </h4>
                        <p>See more snippets like these online store reviews at <a target="_blank" href="http://bootsnipp.com">Bootsnipp - http://bootsnipp.com</a>.</p>
                        <p>Want to make these reviews work? Check out
                            <strong><a href="http://maxoffsky.com/code-blog/laravel-shop-tutorial-1-building-a-review-system/">this building a review system tutorial</a>
                            </strong>over at maxoffsky.com!</p>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</p>
                    </div>
                    <div class="ratings">
                        <p class="pull-right">3 reviews</p>
                        <p>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star-empty"></span>
                            4.0 stars
                        </p>
                    </div>
                </div>

                <div class="well">

                    <div class="text-right">
                        <a class="btn btn-success">Leave a Review</a>
                    </div>

                    <hr>

                    <div class="row">
                        <div class="col-md-12">
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star-empty"></span>
                            Anonymous
                            <span class="pull-right">10 days ago</span>
                            <p>This product was great in terms of quality. I would definitely buy another!</p>
                        </div>
                    </div>

                    <hr>

                    <div class="row">
                        <div class="col-md-12">
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star-empty"></span>
                            Anonymous
                            <span class="pull-right">12 days ago</span>
                            <p>I've alredy ordered another one!</p>
                        </div>
                    </div>

                    <hr>

                    <div class="row">
                        <div class="col-md-12">
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star-empty"></span>
                            Anonymous
                            <span class="pull-right">15 days ago</span>
                            <p>I've seen some better than this, but not at this price. I definitely recommend this item.</p>
                        </div>
                    </div>

                </div>

            </div>
		</div>
	</div>
	<!-- /.container -->

	<div class="enter"></div>

	<!-- Footer -->
	<footer>
		<!--/////////////////////////////////////////////////// -->
		<jsp:include page="/PartsOfContent/SiteFooter/FrontFooter_Shop.jsp"
			flush="false" />
		<!--/////////////////////////////////////////////////// -->
	</footer>




	<!-- Script to Activate the Carousel -->
	<script>
		$('.carousel').carousel({
			interval : 5000
		//changes the speed
		});
	</script>

</body>

</html>