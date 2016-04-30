<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<%--MasterPage_1 은 회원기본정보 1,2,3 관련페이지 --%>

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

<script>
	$(document).ready(
			function() {
				$.extend({
					getUrlVars : function() {
						var vars = [], hash;
						var hashes = window.location.href.slice(
								window.location.href.indexOf('?') + 1).split(
								'&');
						for (var i = 0; i < hashes.length; i++) {
							hash = hashes[i].split('=');
							vars.push(hash[0]);
							vars[hash[0]] = hash[1];
						}
						return vars;
					},
					getUrlVar : function(name) {
						return $.getUrlVars()[name];
					}
				});
				var byName = $.getUrlVar('mode');
				var mode_ = "<c:out value='${mode}'/>"// 이것도 가능. ${mode} 아래의 단계를 인식 못함.

				if (byName == 'SMbrInput') {
					$('ul.setup-panel li:eq(1)').removeClass('disabled');
					$('ul.setup-panel li:eq(0)').removeClass('active');
					$('ul.setup-panel li:eq(1)').addClass('active');

					$('ul.setup-panel li:eq(2)').addClass('disabled');
					$('ul.setup-panel li:eq(0)').addClass('disabled');
					$(this).remove();
				} else if (mode_ == 'SDMbrInput') {
					$('ul.setup-panel li:eq(2)').removeClass('disabled');
					$('ul.setup-panel li:eq(0)').removeClass('active');
					$('ul.setup-panel li:eq(2)').addClass('active');

					$('ul.setup-panel li:eq(1)').addClass('disabled');
					$('ul.setup-panel li:eq(0)').addClass('disabled');
					$(this).remove();
				}
			});
</script>
</head>

<body>
	<!-- 2. FrontHeader_Master 
	      설명 : Header 추가 슬라이드 쇼 까지 포함 예정
           기타 : 추후 SPA 등 변경 예정
	-->
	<!--  //////////////////////////////////// -->
	<jsp:include page="/PartsOfContent/SiteHeader/FrontHeader_Master.jsp"
		flush="false" />
	<!--  //////////////////////////////////// -->


	<!-- 3. Page Content 
	      설명 : Header Footer 제외 전 부분
	      기타 :
	-->
	<div class="container mg9xauto">
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<div class="row form-group">
					<div class="col-xs-12">
						<ul class="nav nav-pills nav-justified thumbnail setup-panel">
							<!-- a태그는 css 기본적용 때문에 추가 -->
							<li class="active"><a>
									<h4 class="list-group-item-heading">Step 1</h4>
									<p class="list-group-item-text">First step description</p>
							</a></li>
							<li class="disabled"><a>
									<h4 class="list-group-item-heading">Step 2</h4>
									<p class="list-group-item-text">Second step description</p>
							</a></li>
							<li class="disabled"><a>
									<h4 class="list-group-item-heading">Step 3</h4>
									<p class="list-group-item-text">Third step description</p>
							</a></li>
						</ul>
					</div>
				</div>
				<c:if test="${param.mode == 'Default'}">
					<!--/////////////////////////////////////////////////// -->
					<jsp:include page="/CommonApps/Member/TermsOfUse.jsp" flush="false" />
					<!--/////////////////////////////////////////////////// -->
				</c:if>
				<c:if test="${param.mode == 'SMbrInput'}">
					<div class="row setup-content" id="step-2">
						<div class="col-xs-12">
							<h1 class="text-left">STEP 2</h1>

							<!--/////////////////////////////////////////////////// -->
							<jsp:include page="/CommonApps/Member/MbrInput.jsp" flush="false" />
							<!--/////////////////////////////////////////////////// -->

						</div>
					</div>
				</c:if>

				<c:if test="${param.mode == 'SDMbrInput'}">

					<div class="row setup-content" id="step-3">
						<div class="col-xs-12">
							<h1 class="text-left">STEP 3</h1>

							<!--/////////////////////////////////////////////////// -->
							<jsp:include page="/CommonApps/Member/MbrLandingPage.jsp"
								flush="false" />
							<!--/////////////////////////////////////////////////// -->
						</div>
					</div>
				</c:if>

			</div>
		</div>
	</div>
	<!-- /.container -->

	<!-- FrontFooter -->
	<footer>
		<!--/////////////////////////////////////////////////// -->
		<jsp:include page="/PartsOfContent/SiteFooter/FrontFooter.jsp"
			flush="false" />
		<!--/////////////////////////////////////////////////// -->
	</footer>

</body>

</html>