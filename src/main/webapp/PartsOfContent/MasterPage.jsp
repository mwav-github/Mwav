<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>
<%--
1. 공통규칙
-기본구조는 Header / LEFT / BODY / FOOTER 를 가진다.
-해당 구조에 따른 PX 값에 따른 크기 규정은 상황에 따라 유동적으로 변동하며, 명시한다
-LEFT 메뉴에 대해서는 SPA 방식 도입시 대대적 변경한다.
-
-
 --%>

<!--1. Head_Import 
    설명 : 전체 공통적인 스크립트 삽입 부분
    기타 : 추후 SPA 등 변경 예정
-->
<!-- /////////// -->
<jsp:include page="/PartsOfContent/Head_Import.jsp" flush="false" />
<!-- /////////// -->
</head>

<body>
	<!-- 2. FrontHeader 
	      설명 : Header 추가 슬라이드 쇼 까지 포함 예정
           기타 : 추후 SPA 등 변경 예정
	-->
	<!--  //////////////////////////////////// -->
	<jsp:include page="SiteHeader/FrontHeader.jsp" flush="false" />
	<!--  //////////////////////////////////// -->


	<!-- 3. Page Content 
	      설명 : Header Footer 제외 전 부분
	      기타 :
	-->
	<div class="container">

		<!-- 4. Page Heading/Breadcrumbs
		      설명 : Navigation 부분
		         -위에는 메인 제목 및 서브제목 (대표 폴더 / 상세 페이지)
		         -아래에는 HOME 시작으로 디렉트리 깊이에 맞게 표현
		      기타 : SPA 방식 적용시 MOVE
		 -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					회사 페이지<small>회사실적</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="/">Home</a></li>
					<li><a href="#">Company</a></li>
					<li class="active">ActualResults</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<!-- 5. Content Row 
	           설명 : Header Footer 제외 부분
		      기타 :
		-->
		<!-- 2행 12열-->
		<div class="row">
			<!-- 6. Sidebar Column 
		     	설명 : Left 메뉴 부분
		            기타 : SPA 방식시 변경 예정
			-->
			<!-- 2행 3/12열-->
			<div class="col-md-3 col-sm-3">
				<!-- left  -->
				Left 메뉴입니다.
			</div>

			<!-- 7. Body 
		     	설명 : Body 부분
		          기타 :
			-->
			<!-- 2행 9/12열-->
			<div class="col-md-9 col-sm-9">
				<!-- Content Column -->
				BODY 부분으로서 언제든지 편할 때로의 조작이 가능합니다. 내부 공간에 대한 활용은 알아서 하시면 됩니다. *아래는
				공간에 대한 분할 부분인식 http://bootstrapk.com/BS3/css#grid-options
				<!-- 2-1 8/12열 변경 가능-->
				<div class="col-md-8 col-sm-8">
					<!--body 내에서 조작 (수정가능)  -->

				</div>
				<!-- 2-1 4/12열-->
				<div class="col-md-4 col-sm-4"></div>

				<!-- /.row -->

				<div class="col-md-12 col-sm-12"></div>
			</div>
		</div>
	</div>
	<!-- /.container -->

	<!-- FrontFooter -->
	<footer>
		<!--/////////////////////////////////////////////////// -->
		<jsp:include page="SiteFooter/FrontFooter.jsp" flush="false" />
		<!--/////////////////////////////////////////////////// -->
	</footer>


</body>

</html>