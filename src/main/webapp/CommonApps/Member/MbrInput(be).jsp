<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- container 안에 포함시키면 된다. 
http://planbong.tistory.com/531
-->
<!-- imsi -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"
	rel="stylesheet">



<div class="row">
	<form role="form" method="post" action="/member/memberForm.do">
		<div class="col-lg-6">
			<div class="well well-sm">
				<strong><span class="glyphicon glyphicon-asterisk"></span>Required
					Field</strong>
			</div>
			<!-- 
                placeholder  요소는  결과에서 보듯이  텍스트필드에 희미하게 글자를 보여주는 기능입니다
                required 요소는  필드에 값을 입력하지 않고 전송(submit)하면 입력하라고 메세지를 보여줍니다
                
                 -->
			<!-- 로그인 아이디 -->
			<div class="form-group">
				<label for="InputName">Enter LoginID</label>
				<div class="input-group">
					<input type="text" class="form-control" name="mbrLoginId"
						id="InputName" placeholder="예) mymg2002" required> <span
						class="input-group-addon"> <span
						class="glyphicon glyphicon-asterisk"></span>
					</span>
				</div>
			</div>

			<!-- 패스워드 -->
			<div class="form-group">
				<label for="InputPW">Login PW</label>
				<div class="input-group">
					<input type="password" class="form-control" name="mbrLoginPw"
						placeholder="패스워드 입력" required> <span
						class="input-group-addon"><span
						class="glyphicon glyphicon-asterisk"></span> </span>
				</div>
			</div>

			<!--
			<div class="form-group">
				<label for="InputPW">Login PW</label>
				<div class="input-group">
					<input type="password" class="form-control" name="mbrLoginPw"
						placeholder="패스워드 입력" required> <span
						class="input-group-addon"><span
						class="glyphicon glyphicon-asterisk"></span> </span>
				</div>
			</div> -->

			<!-- 회원명 이름 -->
			<div class="form-group">
				<label for="InputCellularP">Name</label>
				<div class="input-group">
					<input type="text" class="form-control" name="mbrFirstName"
						placeholder="예) 김, Kim" required> <input type="text"
						class="form-control" name="mbrLastName"
						placeholder="예) 주성, JuSung" required> <input type="text"
						class="form-control" name="mbrMiddleName" placeholder="예) add"
						required> <span class="input-group-addon"><span
						class="glyphicon glyphicon-asterisk"></span> </span>
				</div>
			</div>

			<!-- 이메일 -->
			<div class="form-group">
				<label for="InputEmail">Email</label>
				<div class="input-group">
					<!-- 현재 이메일 형태로 -->
					<input type="email" class="form-control" id="InputEmailFirst"
						name="mbrEmail" placeholder="예) mymg99@gmail.com" required>
					<span class="input-group-addon"><span
						class="glyphicon glyphicon-asterisk"></span> </span>
				</div>
			</div>

			<!-- 핸드폰번호 -->
			<div class="form-group">
				<label for="InputCellularP">CellularPhone</label>
				<div class="input-group">
					<input type="text" class="form-control" name="member_CellularP_1"
						MaxLength="3" placeholder="예) 010" required> <input
						type="text" class="form-control" name="member_CellularP_2"
						MaxLength="4" placeholder="예) 3180" required> <input
						type="text" class="form-control" name="member_CellularP_3"
						MaxLength="4" placeholder="예) 4451" required> <span
						class="input-group-addon"><span
						class="glyphicon glyphicon-asterisk"></span> </span>
				</div>
			</div>

			<!-- 주소 선택 -->
			<div class="form-group">
				<label for="InputCellularP">Address flag</label>
				<div class="radio">
					<label class="radio-inline"> <input type="radio"
						value="mbrAddrFlag"> 0. 지번주소
					</label> <label class="radio-inline"> <input type="radio"
						value="mbrAddrFlag"> 0. 도로명 주소
					</label>
				</div>
			</div>

			<!-- 주소 -->
			<!-- Text input-->
			<div class="form-group">
				<label class="col-sm-2 control-label" for="textinput">Zipcode</label>
				<div class="col-sm-4">
					<input type="text" placeholder="Zipcode" class="form-control">
				</div>
			</div>
			<!-- Text input-->
			<div class="form-group">
				<label class="col-sm-2 control-label" for="textinput">Detail
					Address</label>
				<div class="col-sm-10">
					<input type="text" name="mbrAddress" placeholder="Address"
						class="form-control">
				</div>
			</div>

			<input type="submit" name="submit" id="submit" value="Submit"
				class="btn btn-info pull-right">
		</div>
	</form>

	<!-- 아래는 성공 및 실패 메시지 출력부분 
	http://garymcallisteronline.blogspot.kr/2013/12/jquery-validation-and-twitter-bootstrap.html
	
	-->
	<div class="col-lg-5 col-md-push-1">
		<div class="col-md-12">
			<div class="alert alert-success">
				<strong><span class="glyphicon glyphicon-ok"></span>
					Success! Message sent.</strong>
			</div>
			<div class="alert alert-danger">
				<span class="glyphicon glyphicon-remove"></span><strong>
					Error! Please check all page inputs.</strong>
			</div>
		</div>
	</div>
</div>

