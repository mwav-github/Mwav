<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- imsi -->
<link
	href="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/jquery.validate.min.js"
	rel="stylesheet">

<script>
	function sendAddress(address, zcZipCode) {
		var address = address;
		var zcZipCode = zcZipCode;
		$("#mbrAddress").val(address);
		$("#mbrZipcode").val(zcZipCode);
		//아래는 팝업창일때 특히 dialog는 jquery ui가 있어야 한다.
		//opener.document.change_record.mbrZipcode.value = zipcode;
		//opener.document.change_record.mbrAddress.value = address;
		//opener.document.frmMbr.mbrAddress.focus();
		//$("#myModal").dialog('close');
		$("#myModal").modal('hide');

	}
</script>

<script>
	function SelectFindercheck(post_mode) {

		var frm;
		var aa;
		switch (post_mode) {
		case 1:
			frm = document.forms["postfinder_1"];
			aa = $('.zcSiDoName_1').find('option:selected').val();
			//alert('1');
			break;

		case 2:
			frm = document.forms["postfinder_2"];
			aa = $('.zcSiDoName_2').find('option:selected').val();
			//alert('2');
			break;
		case 3:
			frm = document.forms["postfinder_3"];
			aa = $('.zcSiDoName_3').find('option:selected').val();
			//alert('3');
			break;
		//document.postfinder_3.options[document.getElementByName("zcSiDoName").selectedIndex].value;
		}
		//alert(frm);

		//배열로 처리 
		//var aa = $('.zcSiDoName').find('option:selected').val();
		//alert('sido' + aa);
		var zcSiDoName = "zcSiDoName=" + aa;

		$.ajax({
			type : 'POST', // Http Request Method로 POST로 지정
			url : '/PostSeek/zcGunGuSeek.do', // 서버 요청 주소
			data : zcSiDoName, // JavaScript 객체를 JSON 객체로 변환하여 서버 요청시 전송
			success : function(data) {
				var name, select, option;

				// Get the raw DOM object for the select box
				//select = document.getElementById('zcSiGunGuName');
				/*
				document.form은 HTML에서 form안의 element를 name기반으로 찾아가고
				document.getElementById는 HTML안의 모든 element를 id기반으로 찾아갑니다.
				 */
				select = frm.elements["zcSiGunGuName"];

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

	//http://m.blog.daum.net/kk241321/7338339
	function SelectPostFinder_2(post_mode) {
		var formData;
		//alert(post_mode);
		var url;
		var frm;
		var zcSiDoName;
		var zcSiGunGuName;

		var zcRoadName;
		var zcBuildingMainNo;

		var zcLegalEupMyeonDongName;
		var zcJiBunMain;

		var zcBuildingBook;
		var post_mode;

		switch (post_mode) {
		case 1:
			frm = document.forms["postfinder_1"]
			zcSiDoName = frm.zcSiDoName.value;
			zcSiGunGuName = frm.zcSiGunGuName.value;
			zcRoadName = frm.zcRoadName.value;
			zcBuildingMainNo = frm.zcBuildingMainNo.value;
			//alert(zcBuildingMainNo);
			post_mode = "post_zcRoadName";

			//formData = $("#postfinder_1").serialize(); 
			url = "zcSiDoName=" + zcSiDoName + " &zcSiGunGuName="
					+ zcSiGunGuName + "&zcRoadName=" + zcRoadName
					+ "&zcBuildingMainNo=" + zcBuildingMainNo + "&post_mode="
					+ post_mode;
			//alert('1');
			break;

		case 2:
			frm = document.forms["postfinder_2"]
			zcSiDoName = frm.zcSiDoName.value;
			zcSiGunGuName = frm.zcSiGunGuName.value;
			zcLegalEupMyeonDongName = frm.zcLegalEupMyeonDongName.value;
			zcJiBunMain = frm.zcJiBunMain.value;

			post_mode = "post_zcLegalEupMyeonDongName";
			//formData = $("#postfinder_1").serialize(); 
			url = "zcSiDoName=" + zcSiDoName + " &zcSiGunGuName="
					+ zcSiGunGuName + "&zcLegalEupMyeonDongName="
					+ zcLegalEupMyeonDongName + "&zcJiBunMain=" + zcJiBunMain
					+ "&post_mode=" + post_mode;

			//formData = $("#postfinder_2").serialize(); 
			//alert('2');
			break;
		case 3:
			frm = document.forms["postfinder_3"]
			zcSiDoName = frm.zcSiDoName.value;
			zcSiGunGuName = frm.zcSiGunGuName.value;
			zcBuildingBook = frm.zcBuildingBook.value;
			//zcJiBunMain = frm.elements["zcJiBunMain"];
			post_mode = "post_zcBuildingBook";

			//formData = $("#postfinder_1").serialize(); 
			url = "zcSiDoName=" + zcSiDoName + " &zcSiGunGuName="
					+ zcSiGunGuName + "&zcBuildingBook=" + zcBuildingBook
					+ "&post_mode=" + post_mode;

			//formData = $("#postfinder_3").serialize(); 
			//alert('3');
			break;
		}
		//document.postfinder_3.options[document.getElementByName("zcSiDoName").selectedIndex].value;
		//var formData = $("#postfinder_2").serialize(); // 폼의 데이터를 한번에 다 http://chongmoa.com/6764 (파일업로드는 안됨)

		//var aa = $('#sido').val();
		//var bb = $('#dong').val();
		//var cc = $('#gungu').val();
		//var dd = $('#zibun').val();
		//var URL = "sido=" + aa + " &dong="+ bb + "&gungu="+ cc + "&zibun="+dd;  //+ 후에는 띄워쓰기되나 "" 안에서는 띄어쓰기하면 띄어쓰기 값으로 인식

		//alert("URL="+URL);
		$.ajax({
			type : 'POST', // Http Request Method로 POST로 지정
			url : '/PostSeek/zcAll.do', // 서버 요청 주소
			//dataType: "json",
			data : url, //formData JavaScript 객체를 JSON 객체로 변환하여 서버 요청시 전송
			success : function(data) {
				//https://darobin.github.io/formic/specs/json/
				//alert("data" + data)
				//alert(data.length);
				//responsebody 의 경우 파싱되서 넘어오므로  // json으로 넘어오므로 파싱이 필요없음 data=JSON.parse(data);
				//var aa = JSON.stringify(data); // 윈도우 8이상 지원
				//alert(aa);
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
				/*  */
				if ($(".ondis").css("display") == "none") {
					//alert("on");
					$(".ondis").show();
					$(".offdis").hide();
				}

				var list = data;
				var listLen = list.length;
				//var col-md-8 = "col-md-8 text-center";
				var content = "";
				var address_zibun;
				var address_doro;
				// var address = "<a href="+ javascript:sendAddress(list[i].zcSiDoName + list[i].zcSiGunGuName + list[i].zcLegalEupMyeonDongName + list[i].zcLegalRiName + list[i].zcJiBunMain) +">";
				for (i = 0; i < listLen; i++) {
					if (list[i].zcBuildingSubNo == 0) {
						address_zibun = list[i].zcSiDoName
								+ list[i].zcSiGunGuName
								+ list[i].zcLegalEupMyeonDongName
								+ list[i].zcLegalRiName + list[i].zcJiBunMain;
						address_doro = list[i].zcSiDoName
								+ list[i].zcSiGunGuName + list[i].zcRoadName
								+ list[i].zcBuildingMainNo;
					} else {
						address = list[i].zcSiDoName + list[i].zcSiGunGuName
								+ list[i].zcLegalEupMyeonDongName
								+ list[i].zcLegalRiName + list[i].zcJiBunMain
								+ "-" + list[i].zcJiBunSub;
						address = list[i].zcSiDoName + list[i].zcSiGunGuName
								+ list[i].zcRoadName + list[i].zcBuildingMainNo
								+ "-" + list[i].zcBuildingSubNo;
					}
					content += "<tr>"
							+ "<td class=" + "col-md-8" + " text-center" +" >"
							+ "<a href=" + "javascript:" + "sendAddress('"
							+ address_zibun + "','" + list[i].zcZipCode + "')"
							+ ">" + address + "</a></td>";
					content += "<td class=" +"col-md-4" + " text-center" + ">"
							+ list[i].zcZipCode + "</td>" + "</tr>";

				}

				$("#postresult").append(content);
			},
			/*
			$.each(aa, function(key) {
					var list = aa[key];
					
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
			//}, // 서버로부터 응답 데이터 도착시 로직 처리, 응답 데이터는 JavaScript 객체로 바로 사용 가능
			
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
	<div class="modal fade modal_post" id="myModal" tabindex="-1"
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
							<div class="tab-pane active fade in" id="postfinder_1">
								<form class="form-horizontal" id="postfinder_1"
									name="postfinder_1">
									<h3>검색방법</h3>
									<p>예) 테헤란로 152 -> '서울시' '강남구' 선택후 테헤란로(도로명) + 152(건물번호) 주소를
										모르실 경우, http://www.juso.go.kr 에서 정확한 주소를 확인하실 수 있습니다.</p>
									<br />
									<!--  <input type="hidden" name="post_mode" value="post_zcRoadName" /> -->
									<div class="col-md-12">
										<div class="row">
											<div class="col-md-2">특별, 광역시/도</div>
											<div class="col-md-3">
												<select name="zcSiDoName" class="form-control zcSiDoName_1"
													onchange="SelectFindercheck(1)">
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
												<select class="form-control" id="zcSiGunGuName"
													name="zcSiGunGuName">
												</select>
											</div>
										</div>
										<br />
										<div class="row">
											<div class="col-md-4">
												<input type="text" name="zcRoadName" id="zcRoadName"
													class="form-control" placeholder="도로명...">
											</div>
											<div class="col-md-4 col-sm-offset-1">
												<input type="text" id="zcBuildingMainNo"
													class="form-control" placeholder="건물번호...">
											</div>
											<div class="col-md-1 col-sm-offset-1">
												<button type="submit" class="btn"
													onclick="SelectPostFinder_2(1)"
													style="background-color: black; color: white;">검색
												</button>
											</div>
										</div>
									</div>
								</form>
							</div>
							<div class="tab-pane fade " id="signup">
								<form class="form-horizontal " id="postfinder_2"
									name="postfinder_2" method="post">
									<div class="col-md-12 offdis">
										<h3>검색방법</h3>
										<p>예) 잠실동 27 -> '서울시' '송파구' 선택 후 잠실동(동명) + 27(지번) 주소를 모르실
											경우, http://www.juso.go.kr 에서 정확한 주소를 확인하실 수 있습니다.</p>
										<br />

										<div class="row">
											<div class="col-md-2">특별, 광역시/도</div>
											<div class="col-md-3">
												<select name="zcSiDoName" class="form-control zcSiDoName_2"
													onchange="SelectFindercheck(2)">
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
												<select class="form-control" id="zcSiGunGuName"
													name="zcSiGunGuName">
												</select>
											</div>
										</div>
										<br />
										<div class="row">
											<div class="col-md-4">
												<input type="text" name="zcLegalEupMyeonDongName"
													id="zcLegalEupMyeonDongName" class="form-control"
													placeholder="동(읍/면)...">
											</div>
											<div class="col-md-4 col-sm-offset-1">
												<input type="text" name="zcJiBunMain" id="zcJiBunMain"
													class="form-control" placeholder="지번...">
											</div>
											<div class="col-md-1 col-sm-offset-1">
												<button type="button" class="btn"
													style="background-color: black; color: white;"
													onclick="SelectPostFinder_2(2)">검색</button>
											</div>
										</div>
									</div>
								</form>
								<br />
								<hr />
							</div>
							<div class="tab-pane fade" id="postfinder_3">
								<form class="form-horizontal" id="postfinder_3"
									name="postfinder_3" action="/Post/PostFinder.do">
									<h3>검색방법</h3>
									<p>예) '서울시' '강남구' 선택 후 강남파이낸스센터(건물명) 주소를 모르실 경우,
										http://www.juso.go.kr 에서 정확한 주소를 확인하실 수 있습니다.</p>
									<br />

									<div class="col-md-12">
										<div class="row">
											<div class="col-md-2">특별, 광역시/도</div>
											<div class="col-md-3">
												<select name="zcSiDoName" class="form-control zcSiDoName_3"
													onchange="SelectFindercheck(3)">
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
												<select class="form-control" id="zcSiGunGuName"
													name="zcSiGunGuName">
												</select>
											</div>
										</div>
										<br />

										<div class="col-md-5">
											<input type="text" name="zcBuildingBook" id="zcBuildingBook"
												class="form-control" placeholder="건물명(아파트명 등)...">
										</div>
										<div class="col-md-1 col-sm-offset-5">
											<button type="submit" class="btn"
												onclick="SelectPostFinder_2(3)"
												style="background-color: black; color: white;">검색</button>
										</div>

									</div>
								</form>
							</div>
						</div>
						<div class="table-responsive ondis" style="display: none">
							<table class="table table-striped table-bordered">
								<thead>
									<tr>
										<th class="col-md-8 text-center">도로명/지번주소</th>
										<th class="col-md-4 text-center">우편번호</th>
									</tr>
								</thead>
								<tbody id="postresult">
									<%-- <tr id="postresult">
												<c:forEach var="FrontboardList" items="${data}"
													varStatus="status">
													<td>${FrontboardList.시군구명}</td>
													<td>${FrontboardList.법정읍면동}</td>

												</c:forEach>
												
											</tr> --%>
								</tbody>
							</table>
						</div>
						<div class="table-responsive offdis">
							<table class="table table-striped table-bordered">
								<tbody>
									<tr>
										<td colspan="4">조회된 결과가 없습니다.</td>
									</tr>
								</tbody>
							</table>
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