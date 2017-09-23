<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">
			Customer Service <small> Contacts</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="/">Home</a></li>
			<li>Customer Service</li>
			<li class="active">Contacts</li>
		</ol>
	</div>
</div>
<!-- /.row -->

<!-- Content Row -->
<div class="row">
	<!-- Sidebar Column left메뉴 추후 변경 예정<시작>-->
	<div class="col-md-3">
		<jsp:include page="/CustomerService/CS-MasterPageLeftMenu.jsp"
			flush="false" />
	</div>
	<!-- 끝 -->

	<div class="col-md-9">
		<!-- <span class="label label-primary">Contact</span> 위에는 사진 형식으로 예정
 -->

		<div class="row">
			<div class="col-lg-12">
				<h2 class="page-header mwav_leftText">Contacts</h2>
			</div>

			<div class="col-xs-12 col-sm-4 col-md-4">
				<div class="news">
					<div class="title">
						<%-- <i class="fa fa-user-o" aria-hidden="true"
									style="text-align:center; font-size: 3rem; color: #D8D8D8; -webkit-transition: all .3s ease-in-out; transition: all .3s ease-in-out;"></i> --%>
						<br>
						<h1>Lewis Kim</h1>
						<br>
					</div>
					<p class="description">
						<strong>Chief Executive Officer</strong> <br>
						<br> <small><cite title="Source Title">Seoul,
								KOREA <i class="glyphicon glyphicon-map-marker"> </i>
						</cite></small><br />
						<%-- <small><i class="fa fa-envelope-o"
									aria-hidden="true"></i></small> Lewis.Kim@mwav.net <br />  --%>
						<small><i class="fa fa-calendar-o" aria-hidden="true"></i>
						</small> June 02, 1975

					</p>
					<p class="more">
						<a href="#" data-type="P" data-id="10001001"
							class="qaModal_Contact" data-toggle="modal"
							data-target="#Contact"> Contact </a> <i class="fa fa-angle-right"
							aria-hidden="true"></i>
					</p>
				</div>
				<div class="enter"></div>
			</div>

			<div class="col-xs-12 col-sm-4 col-md-4">
				<div class="news">
					<div class="title">
						<%-- <i class="fa fa-user-o" aria-hidden="true"
									style="text-align:center; font-size: 3rem; color: #D8D8D8; -webkit-transition: all .3s ease-in-out; transition: all .3s ease-in-out;"></i> --%>
						<br>
						<h1>James Lee</h1>
						<br>
					</div>
					<p class="description">
						<strong>Chief Technical Officer</strong> <br />
						<br /> <small><cite title="Source Title">Seoul,
								KOREA <i class="glyphicon glyphicon-map-marker"> </i>
						</cite></small><br /> <small><i class="fa fa-calendar-o"
							aria-hidden="true"></i> </small> May 02, 1970

					</p>
					<p class="more">
						<a href="#" data-type="S" data-id="102" class="qaModal_Contact"
							data-toggle="modal" data-target="#Contact"> Contact </a> <i
							class="fa fa-angle-right" aria-hidden="true"></i>
					</p>
				</div>
				<div class="enter"></div>
			</div>

			<div class="col-xs-12 col-sm-4 col-md-4">
				<div class="news">
					<div class="title">
						<%-- <i class="fa fa-user-o" aria-hidden="true"
									style="text-align:center; font-size: 3rem; color: #D8D8D8; -webkit-transition: all .3s ease-in-out; transition: all .3s ease-in-out;"></i> --%>
						<br>
						<h1>Alex Chae</h1>
						<br>
					</div>
					<p class="description">
						<strong>Chief Marketing Officer</strong> <br />
						<br /> <small><cite title="Source Title">Seoul,
								KOREA <i class="glyphicon glyphicon-map-marker"> </i>
						</cite></small><br />
						<%-- <small><i class="fa fa-envelope-o"
									aria-hidden="true"></i></small> Alex.Chae@mwav.net <br /> --%>
						<small><i class="fa fa-calendar-o" aria-hidden="true"></i>
						</small> June 02, 1975

					</p>
					<p class="more">
						<a href="#" data-type="S" data-id="103" class="qaModal_Contact"
							data-toggle="modal" data-target="#Contact"> Contact </a> <i
							class="fa fa-angle-right" aria-hidden="true"></i>
					</p>
				</div>
				<div class="enter"></div>
			</div>

			<div class="col-xs-12 col-sm-4 col-md-4">
				<div class="news">
					<div class="title">
						<%-- <i class="fa fa-user-o" aria-hidden="true"
									style="text-align:center; font-size: 3rem; color: #D8D8D8; -webkit-transition: all .3s ease-in-out; transition: all .3s ease-in-out;"></i> --%>
						<br>
						<h1>Evan Martin</h1>
						<br>
					</div>
					<p class="description">
						<strong>Chief Operation Officer</strong> <br />
						<br /> <small><cite title="Source Title">Seoul,
								KOREA <i class="glyphicon glyphicon-map-marker"> </i>
						</cite></small><br /> <small><i class="fa fa-calendar-o"
							aria-hidden="true"></i> </small> June 01, 1970

					</p>
					<p class="more">
						<a href="#" data-type="S" data-id="104" class="qaModal_Contact"
							data-toggle="modal" data-target="#Contact"> Contact </a> <i
							class="fa fa-angle-right" aria-hidden="true"></i>
					</p>
				</div>
				<div class="enter"></div>
			</div>

			<div class="col-xs-12 col-sm-4 col-md-4">
				<div class="news">
					<div class="title">
						<%-- <i class="fa fa-user-o" aria-hidden="true"
									style="text-align:center; font-size: 3rem; color: #D8D8D8; -webkit-transition: all .3s ease-in-out; transition: all .3s ease-in-out;"></i> --%>
						<br>
						<h1>Peter J</h1>
						<br>
					</div>
					<p class="description">
						<strong>Chief Information Officer</strong> <br />
						<br /> <small><cite title="Source Title">Seoul,
								KOREA <i class="glyphicon glyphicon-map-marker"> </i>
						</cite></small><br /> <small><i class="fa fa-calendar-o"
							aria-hidden="true"></i> </small> January 07, 1971

					</p>
					<p class="more">
						<a href="#" data-type="P" data-id="10001000"
							class="qaModal_Contact" data-toggle="modal"
							data-target="#Contact"> Contact </a> <i class="fa fa-angle-right"
							aria-hidden="true"></i>
					</p>
				</div>
				<div class="enter"></div>
			</div>
		</div>
	</div>
</div>
<!-- /.row -->
