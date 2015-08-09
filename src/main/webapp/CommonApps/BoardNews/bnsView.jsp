<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="//cdn.ckeditor.com/4.4.6/basic/ckeditor.js"></script>
<!-- imsi -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"
	rel="stylesheet">


<!-- 소제목 -->
<!-- ----- 
색 : http://the3.tistory.com/49

<tr class="active">...</tr>
<tr class="success">...</tr>
<tr class="warning">...</tr>
<tr class="danger">...</tr>
<tr class="active">...</tr>

-->

<!-- Content Column -->
<div class="table-responsive">
	<form role="form">
		<table class="table table-striped">
			<thead>
				<tr>
					<div class="dropdown pull-right">
						<button class="btn btn-default dropdown-toggle" type="button"
							id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
							Dropdown <span class="caret"></span>
						</button>
						<ul class="dropdown-menu" role="menu"
							aria-labelledby="dropdownMenu1">
							<li role="presentation"><a role="menuitem" tabindex="-1"
								href="#">휴대폰</a></li>
							<li role="presentation"><a role="menuitem" tabindex="-1"
								href="#">휴대폰1</a></li>
							<li role="presentation"><a role="menuitem" tabindex="-1"
								href="#">휴대폰2</a></li>
							<li role="presentation"><a role="menuitem" tabindex="-1"
								href="#">휴대폰3</a></li>
						</ul>
					</div>
				</tr>
				<tr class="active">
					<th>NO.</th>
					<th>Group</th>
					<th>ViewCount</th>
					<th>InsertDt</th>
					<th>staff_id</th>
					<th>Order</th>
				</tr>
			</thead>


			<tbody>
							<tr>
								<td>${selectbnsView.bnews_id}</td>
								<td>${selectbnsView.bnGroup}</td>
								<td>${selectbnsView.bnViewCount}</td>
								<td>${selectbnsView.bnInsertDt}</td>
								<td>${selectbnsView.staff_id}</td>
								<td>${selectbnsView.bnOrder}</td>
							</tr>
			</tbody>
		</table>

		<table class="table table-striped">

			<tr>
				<th class="active">Title</th>
				<td>${selectbnsView.bnTitle}</td>
			</tr>



			<tr>
				<th class="active">SubTitle</th>
				<td>${selectbnsView.bnSubTitle}</td>
			</tr>

			<tr>
				<th class="active">Content</th>
				<td>${selectbnsView.bnContent}</td>
			</tr>

		</table>
	</form>

	<br style="clear: both">
	<p class="pull-right">
		<button type="button" class="btn btn-primary">All List</button>
		<button type="button" class="btn btn-warning">BACK</button>
		<button type="button" class="btn btn-success">OK</button>
	</p>

</div>
