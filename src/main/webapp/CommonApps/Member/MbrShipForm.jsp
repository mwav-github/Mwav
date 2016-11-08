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

	<form class='form-horizontal' name="change_record" method="post"
		action="/member/mbrUpdatePro.do">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

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
										<td>${updateMbrForm.mbrLoginId}</td>
									</tr>
									<tr>
										<td>이름:</td>
										<td><div class='col-md-3 indent-small'>
												<div class='form-group internal'>
													<input class='form-control' name="mbrFirstName" type='text'
														value="${updateMbrForm.mbrFirstName}" required>
												</div>
											</div>
											<div class='col-md-3 indent-small'>
												<div class='form-group internal'>
													<input class='form-control' name="mbrMiddleName"
														type='text' value="${updateMbrForm.mbrMiddleName}">
												</div>
											</div>
											<div class='col-md-3 indent-small'>
												<div class='form-group internal'>
													<input class='form-control' name="mbrLastName" type='text'
														value="${updateMbrForm.mbrLastName}" required>
												</div>
											</div></td>
									</tr>
									<tr>
										<td>이메일:</td>
										<td><div class='form-group'>
												<div class='col-md-11'>
													<input class='form-control' name="mbrEmail" id='chkEmail'
														placeholder='E-mail' type='text'
														value="${updateMbrForm.mbrEmail}"
														onchange="chkEmailPolicy()" required>
												</div>
											</div></td>
									</tr>

									<tr>
										<td>핸드폰번호:</td>
										<td><div class='form-group'>
												<div class='col-md-11'>
													<input class='form-control' name="mbrCellPhone"
														placeholder='CellPhone' type='text'
														value="${updateMbrForm.mbrCellPhone}">
												</div>
											</div></td>
									</tr>
									<tr>
										<td>주소구분:</td>
										<td>${updateMbrForm.mbrAddrFlag}</td>
									</tr>
									<tr>
										<td>주소:</td>
										<td>
											<div class='form-group'>

												<p class="col-md-3 ">
													<button class="btn btn-primary btn-block" type="button"
														data-toggle="modal" data-target=".modal_post"
														onclick="showhide();">주소찾기</button>

												</p>
												<!-- <div class='col-md-8'>
						<label><input type="radio" name="optradio" value="0">지번
							주소</label> <label><input type="radio" name="optradio" value="1">도로명
							주소</label>
					</div> -->
											</div>
											<div class='form-group'>
												<div class='col-md-11'>
													<input class='form-control' name="mbrZipcode"
														id='Zipcode' placeholder='우편번호' type='text' value="${updateMbrForm.mbrZipcode}" readonly="readonly"/>
												</div>
												<div class='col-md-11'>
													<input name="mbrAddress_1" class='form-control'
														id='Address' placeholder='주소' type='text'
														value="${updateMbrForm.mbrAddress}" readonly="readonly">
												</div>
												<div class="enter hidden-xs hidden-sm"></div>

												<div class="col-md-11">
													<input name="mbrAddress_2" class="form-control"
														placeholder='나머지 주소' type="text" />
												</div>
											</div>
										</td>


									</tr>
								</tbody>
							</table>

							<!-- <a href="#" class="btn btn-primary">되돌아가기</a> <a href="#"
							class="btn btn-primary">삭제</a> -->
						</div>
					</div>
				</div>
				<div class="panel-footer">

					<button type="submit" class='btn btn-md btn-primary'
						style='float: right' data-original-title="Edit this user"
						data-toggle="tooltip">
						<i class="glyphicon glyphicon-edit"></i>
					</button>
					<a data-original-title="Broadcast Message" data-toggle="tooltip"
						type="button" class="btn btn-md btn-warning"><i
						class="glyphicon glyphicon-envelope"></i></a> <span class="pull-right">

					</span>
				</div>

			</div>
		</div>
	</form>

	<%-- 아래의 내용을 위에 주소 위치에 둘 경우 form태그가 해당위치로 닫힌다 form태그 중복 추후 확인 필요 --%>
	<jsp:include page="/CommonApps/PostSeek/PostSeek.jsp" flush="false" />
</div>

