<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--진행 하고난 후에 XML 로 바꾸고 변수 호출해야한다. --%>
<div class="row">
	<!-- í -->
	<div class="col-lg-12">
		<h3>Copyright Tab</h3>

		<div class="tabbable-panel">
			<div class="tabbable-line">
				<ul class="nav nav-tabs ">
					<li class="active"><a href="#tab_default_1" data-toggle="tab">
							Copyright </a></li>
					<li><a href="#tab_default_2" data-toggle="tab"> Company
							Info. </a></li>
					<li><a href="#tab_default_3" data-toggle="tab"> Customer
							Support </a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="tab_default_1">
						<br />
						<p>Copyright &copy; Your Website 2014</p>
						<br />
					</div>
					<div class="tab-pane" id="tab_default_2">
						<br />
						<p>다양한 고객서비스를 확인하고 싶은 경우 아래를 클릭하세요.</p>
						<br />
						<p>
							<a class="btn btn-warning "
								href="/Company/LocationMap/LocationMap.jsp" target="_blank">
								Learn more... </a>
						</p>
						<br />
					</div>
					<div class="tab-pane" id="tab_default_3">
						<br />
						<p>다양한 솔루션을 제공하는 NTC Corperation에 대한 기업정보를 확인하고 싶은 경우 아래를
							클릭하세요.</p>
						<br />
						<p>회사명 : NTC Corperation</p>
						<br />
						<p>대표번호 : 1666-4117</p>
						<br />
						<p>주소 : 경기도 용인시 모현면 동림리 98-5번지</p>
						<br /> <br />
						<p>
							<a class="btn btn-info"
								href="/Company/LocationMap/LocationMap.jsp" target="_blank">
								Learn more... </a>
						</p>
						<br />
					</div>
				</div>
			</div>
		</div>

	</div>
</div>