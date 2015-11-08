<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- container 안에 포함시키면 된다. -->
<!-- imsi -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"
	rel="stylesheet">


<div class="row">
	<!-- <div class="col-md-12">
		<A href="/CWS/CommonApps/Member/MbrShipForm.jsp">Edit Profile</A> <A
			href="/member/Logout.do">Logout</A> <br>
		<p class=" text-info">May 05,2014,03:00 pm</p>
	</div> -->
	<div
		class="col-xs-12 col-sm-12 col-md-12 col-lg-12">


		<div class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">김주성</h3>
			</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-md-3 col-lg-3 " align="center">
						<img alt="User Pic"
							src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=100"
							class="img-circle">
					</div>

					<!--<div class="col-xs-10 col-sm-10 hidden-md hidden-lg"> <br>
                  <dl>
                    <dt>DEPARTMENT:</dt>
                    <dd>Administrator</dd>
                    <dt>HIRE DATE</dt>
                    <dd>11/12/2013</dd>
                    <dt>DATE OF BIRTH</dt>
                       <dd>11/12/2013</dd>
                    <dt>GENDER</dt>
                    <dd>Male</dd>
                  </dl>
                </div>-->
					<div class=" col-md-9 col-lg-9 ">
						<table class="table table-user-information">
							<tbody>
								<tr>
									<td>아이디:</td>
									<td>${selectMemberView.mbrLoginId}</td>
								</tr>
								<tr>
									<td>이름:</td>
									<td>${selectMemberView.mbrFirstName}</td>
								</tr>
								<tr>
									<td>이메일:</td>
									<td><a href="mailto:${selectMemberView.mbrEmail}">${selectMemberView.mbrEmail}</a></td>
								</tr>

								<tr>
									<td>핸드폰번호:</td>
									<td>${selectMemberView.mbrCellPhone}</td>
								</tr>
								<tr>
									<td>주소구분:</td>
									<td>${selectMemberView.mbrAddrFlag}</td>
								</tr>
								<tr>
									<td>주소:</td>
									<td>${selectMemberView.mbrZipcode}//
										${selectMemberView.mbrAddress}</td>
								</tr>
							</tbody>
						</table>

						<!-- <a href="#" class="btn btn-primary">되돌아가기</a> <a href="#"
							class="btn btn-primary">삭제</a> -->
					</div>
				</div>
			</div>
			<div class="panel-footer">
				<a data-original-title="Broadcast Message" data-toggle="tooltip"
					type="button" class="btn btn-sm btn-primary"><i
					class="glyphicon glyphicon-envelope"></i></a> 
					
					<span class="pull-right">
					<a href="edit.html" data-original-title="Edit this user"
					data-toggle="tooltip" type="button" class="btn btn-sm btn-warning"><i
						class="glyphicon glyphicon-edit"></i></a> 
						
						<a href ="/CustomerService/CS-MasterPage.jsp?mode=SDMbrDelete"
					data-original-title="Remove this user" data-toggle="tooltip"
					type="button" class="btn btn-sm btn-danger"><i
						class="glyphicon glyphicon-remove"></i></a>
				</span>
			</div>

		</div>
	</div>
</div>
