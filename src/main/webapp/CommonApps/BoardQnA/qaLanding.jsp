<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>

.landing-template {
	padding: 40px 15px;
	text-align: center;
}

.landing-actions {
	margin-top: 15px;
	margin-bottom: 15px;
}

.landing-actions .btn {
	margin-right: 10px;
}
</style>
</head>

<body>

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="landing-template">
					<h2>		
						문의하신 내용이 정상적으로 접수되었습니다.
					</h2>
					
					<div class="landing-details">
						문의에 대한 답변은 내 문의내역에서 확인 가능하십니다.  <br>Your request was successfully submitted for processing
					</div>
					<div class="landing-actions">
						<a href="/" class="btn btn-primary btn-lg"><span
							class="glyphicon glyphicon-home"></span>Task me Home </a><a
							href="/CustomerService/QnA/QnA.mwav?mode=qaList" class="btn btn-default btn-lg"><span
							class="glyphicon glyphicon-envelope"></span>Inquiry List</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>