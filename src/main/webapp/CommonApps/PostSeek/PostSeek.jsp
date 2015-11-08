<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- imsi -->
<link
	href="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/jquery.validate.min.js"
	rel="stylesheet">
<script>
	function SelectFindercheck() {
		var aa = $('#sido').find('option:selected').val();
		alert('sido' + aa);
		var sido = "sido=" + aa;

		$.ajax({
			type : 'POST', // Http Request Method로 POST로 지정
			url : '/Post/GunguFinder.do', // 서버 요청 주소
			data : sido, // JavaScript 객체를 JSON 객체로 변환하여 서버 요청시 전송
			success : function(data) {
				var name, select, option;

				// Get the raw DOM object for the select box
				select = document.getElementById('gungu');

				// Clear the old options
				select.options.length = 0;

				// Load the new options
				//https://developer.mozilla.org/en-US/docs/Web/API/HTMLOptionElement/Option 
				for (name in data) {
					if (data.hasOwnProperty(name)) {
						//원래 select.options.add(new Option(data[name], name)); 
						select.options.add(new Option(data[name], data[name]));
					}
				}
			}, // 서버로부터 응답 데이터 도착시 로직 처리, 응답 데이터는 JavaScript 객체로 바로 사용 가능
			error : function() {
				alert('실패내잉')
			} // 서버로부터 응답 데이터 실패시 로직 처리
		});
	}
</script>
<script>
	//http://blog.hemapresso.com/?p=293
	//http://okky.kr/article/197900
	//http://java.ihoney.pe.kr/283

	//http://myclude.tistory.com/category/WEB/JSON
	function SelectPostFinder_2() {
		var formData = $("#postfinder_2").serialize(); // 폼의 데이터를 한번에 다 http://chongmoa.com/6764 (파일업로드는 안됨)
		
			//var aa = $('#sido').val();
			//var bb = $('#dong').val();
			//var cc = $('#gungu').val();
			//var dd = $('#zibun').val();
		//var URL = "sido=" + aa + " &dong="+ bb + "&gungu="+ cc + "&zibun="+dd;  //+ 후에는 띄워쓰기되나 "" 안에서는 띄어쓰기하면 띄어쓰기 값으로 인식
		//var url2 = JSON.stringify(URL);
		alert("URL="+URL);
		$.ajax({
			type : 'POST', // Http Request Method로 POST로 지정
			url : '/Post/PostFinder_2.do', // 서버 요청 주소
		    data : formData,   // JavaScript 객체를 JSON 객체로 변환하여 서버 요청시 전송
			success : function(data) {
				//https://darobin.github.io/formic/specs/json/
				//alert("data" + data)
				alert(data.length);
				//responsebody 의 경우 파싱되서 넘어오므로  // json으로 넘어오므로 파싱이 필요없음 data=JSON.parse(data);
				//var aa = JSON.stringify(data); // 윈도우 8이상 지원
				//var parse = JSON.parse(aa);
				//var obj = JSON.parse(returnValue.responseText);
				/* var obj = JSON.parse(data);
				alert("obj"+obj);
				var obj2 = JSON.parse(data.responsText);   
				
				var stringify = JSON.stringify(testJSON); // 자바스크립트 객체를 JSON 문자열로 변환;
				var parse = JSON.parse(stringify); // JSON 문자열을 자바스크립트 객체로 변환;
				
				
				alert("obj2"+obj2);
				 */

			/* 	alert('aa' + aa);
				alert('parse' + parse);
				alert('parse' + parse.시도명);
 */
				/* var content = "<table>"
				for ( var i in data) {
					content += "<td>" + data[i].건물부번 + "</td>";
					content += "<td>" + data[i].시도명 + "</td>";
					content += "</table>";

					$("#postfinder_2").html(content);
				}
				/*  */	$.each(data, function(key) {
						var list = data[key];
						
						alert("list"+list);
						var content = "<table>"
						alert('d'+list.length);
						for (i = 0; i < list.length; i++) {
							content += "<tr>";
							content += "<td>" + list[i].건물부번 + "</td>";
							content += "<td>" + list[i].시도명 + "</td>";
							content += "<td>" + list[i].도로명코드 + "</td>";

						}
						content += "</table>";

						$("#postfinder_2").html(content);
					}); 
			}, // 서버로부터 응답 데이터 도착시 로직 처리, 응답 데이터는 JavaScript 객체로 바로 사용 가능
			/*
			ajax는 client 부분만 처리 되기 때문에 JSTL을 적용하실 수 없습니다.
			JSTL은 서버에서 한번만 처리되고 ajax의 결과를 받을 수 없습니다.
			ajax의 결과 처리 부분은 client 처리인 javascript만으로 처리하셔야 합니다.
			 */
			error : function() {
				alert('없는 주소입니다. 다시조회해주세요.')
			} // 서버로부터 응답 데이터 실패시 로직 처리
		});
	}
</script>

<div class="container">
	<!-- Modal -->
	<div class="modal fade bs-modal-sm" id="myModal" tabindex="-1"
		role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-header"
					style="border-bottom: 0px solid #eee; background-color: #0480be; color: white;">
					<h4 class="modal-title">주소찾기</h4>
				</div>
				<br>
				<div class="bs-example bs-example-tabs">
					<ul id="myTab" class="nav nav-tabs">
						<li class="active"><a href="#signin" data-toggle="tab">도로명+건물번호</a></li>
						<li class=""><a href="#signup" data-toggle="tab">동(읍/면)+지번</a></li>
						<li class=""><a href="#signup2" data-toggle="tab">건물명(아파트명)</a></li>
					</ul>
				</div>
				<div class="modal-body">
					<div class="container-fluid">
						<div id="myTabContent" class="tab-content">
							<div class="tab-pane active fade in" id="signin">
								<form class="form-horizontal" name="postfinder_1"
									action="/Post/PostFinder.do">
									<h3>검색방법</h3>
									<p>예) 테헤란로 152 -> '서울시' '강남구' 선택후 테헤란로(도로명) + 152(건물번호) 주소를
										모르실 경우, http://www.juso.go.kr 에서 정확한 주소를 확인하실 수 있습니다.</p>
									<br />
									<div class="col-md-12">
										<div class="row">
											<div class="col-md-2">특별, 광역시/도</div>
											<div class="col-md-3">
												<select class="form-control">
													<option selected="selected">전체</option>
													<option value="강원도">강원도</option>

													<option value="경기도">경기도</option>

													<option value="경상남도">경상남도</option>

													<option value="경상북도">경상북도</option>

													<option value="광주광역시">광주광역시</option>

													<option value="대구광역시">대구광역시</option>

													<option value="대전광역시">대전광역시</option>

													<option value="부산광역시">부산광역시</option>

													<option value="서울특별시">서울특별시</option>

													<option value="세종특별자치시">세종특별자치시</option>

													<option value="울산광역시">울산광역시</option>

													<option value="인천광역시">인천광역시</option>

													<option value="전라남도">전라남도</option>

													<option value="전라북도">전라북도</option>

													<option value="제주특별자치도">제주특별자치도</option>

													<option value="충청남도">충청남도</option>

													<option value="충청북도">충청북도</option>
												</select>
											</div>
											<div class="col-md-2 col-sm-offset-1">시/군구</div>
											<div class="col-md-3">
												<select class="form-control">
													<option>강릉시</option>
													<option>고성군</option>
													<option>동해시</option>
													<option>삼척시</option>
													<option>속초시</option>
												</select>
											</div>
										</div>
										<br />
										<div class="row">
											<div class="col-md-4">
												<input type="text" id="mbrEmail" class="form-control"
													placeholder="도로명...">
											</div>
											<div class="col-md-4 col-sm-offset-1">
												<input type="text" id="mbrEmail" class="form-control"
													placeholder="건물번호...">
											</div>
											<div class="col-md-1 col-sm-offset-1">
												<button type="submit" class="btn"
													style="background-color: black; color: white;">검색
												</button>
											</div>
										</div>
									</div>
								</form>
							</div>
							<div class="tab-pane fade" id="signup">
								<form class="form-horizontal" id="postfinder_2" method="post">
									<h3>검색방법</h3>
									<p>예) 잠실동 27 -> '서울시' '송파구' 선택 후 잠실동(동명) + 27(지번) 주소를 모르실
										경우, http://www.juso.go.kr 에서 정확한 주소를 확인하실 수 있습니다.</p>
									<br />
									<div class="col-md-12">
										<div class="row">
											<div class="col-md-2">특별, 광역시/도</div>
											<div class="col-md-3">
												<select class="form-control" id="sido"
													onchange="SelectFindercheck();" name="sido">
													<option selected="selected">전체</option>
													<option>강원도</option>
													<option>경기도</option>
													<option>경상남도</option>
													<option>경상북도</option>
												</select>
											</div>
											<div class="col-md-2 col-sm-offset-1">시/군구</div>
											<div class="col-md-3">
												<select class="form-control" id="gungu" name="gungu">
												</select>
											</div>
										</div>
										<br />
										<div class="row">
											<div class="col-md-4">
												<input type="text" name="dong" id ="dong" class="form-control"
													placeholder="동(읍/면)...">
											</div>
											<div class="col-md-4 col-sm-offset-1">
												<input type="text" name="zibun" id="zibun" class="form-control"
													placeholder="지번...">
											</div>
											<div class="col-md-1 col-sm-offset-1">
												<button type="button" class="btn"
													style="background-color: black; color: white;"
													onclick="SelectPostFinder_2()">검색</button>
											</div>
										</div>
									</div>
								</form>
								<br />
								<hr />
								<div class="table-responsive">
									<table class="table table-striped table-bordered">
										<thead>
											<tr>
												<th class="col-md-8 text-center">도로명/지번주소</th>
												<th class="col-md-4 text-center">우편번호</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<c:forEach var="FrontboardList" items="${data}"
													varStatus="status">
													<td>${FrontboardList.시군구명}</td>
													<td>${FrontboardList.법정읍면동}</td>

												</c:forEach>
											</tr>


											<tr>
												<td colspan="4">조회된 결과가 없습니다.</td>
											</tr>

										</tbody>
									</table>
								</div>
							</div>
							<div class="tab-pane fade" id="signup2">
								<form class="form-horizontal" name="postfinder_3"
									action="/Post/PostFinder.do">
									<h3>검색방법</h3>
									<p>예) '서울시' '강남구' 선택 후 강남파이낸스센터(건물명) 주소를 모르실 경우,
										http://www.juso.go.kr 에서 정확한 주소를 확인하실 수 있습니다.</p>
									<br />
									<div class="col-md-12">
										<div class="row">
											<div class="col-md-2">특별, 광역시/도</div>
											<div class="col-md-3">
												<select class="form-control">
													<option selected="selected">전체</option>
													<option>강원도</option>
													<option>경기도</option>
													<option>경상남도</option>
													<option>경상북도</option>
												</select>
											</div>
											<div class="col-md-2 col-sm-offset-1">시/군구</div>
											<div class="col-md-3">
												<select class="form-control">
													<option>강릉시</option>
													<option>고성군</option>
													<option>동해시</option>
													<option>삼척시</option>
													<option>속초시</option>
												</select>
											</div>
										</div>
										<br />

										<div class="col-md-5">
											<input type="text" id="mbrEmail" class="form-control"
												placeholder="건물명(아파트명 등)...">
										</div>
										<div class="col-md-1 col-sm-offset-5">
											<button type="submit" class="btn"
												style="background-color: black; color: white;">검색</button>
										</div>

									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</div>