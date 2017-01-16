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
		//$("#mbrAddress").val(address);

		/*
		
		mbrAddress로 가게되면 mbr에만 종속되므로 id로 포괄적으로 변경 
		 */

		$("#Address").attr('value', address);
		$("#Zipcode").attr('value', zcZipCode);
		//$("#mbrZipcode").val(zcZipCode);
		//아래는 팝업창일때 특히 dialog는 jquery ui가 있어야 한다.
		//opener.mwavcument.change_record.mbrZipcode.value = zipcode;
		//opener.mwavcument.change_record.mbrAddress.value = address;
		//opener.mwavcument.frmMbr.mbrAddress.focus();
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
			url : '/PostSeek/zcGunGuSeek.mwav', // 서버 요청 주소
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
			beforeSend : function() {
				//(이미지 보여주기 처리)
				//alert('1');
				$('.wrap-loading').removeClass('display-none');
			},
			complete : function() {
				//(이미지 감추기 처리)
				//alert('2');
				$('.wrap-loading').addClass('display-none');

			},

			error : function(status, error) {
				//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				if (status == 0) {
					alert('You are offline!!n Please Check Your Network.');
				} else if (status == 404) {
					alert('Requested URL not found.');
				} else if (status == 500) {
					alert('Internel Server Error.');
				} else if (error == 'parsererror') {
					alert('Error.nParsing JSON Request failed.');
				} else if (error == 'timeout') {
					alert('Request Time out.');
				} else {
					alert('Unknow Error.n' + request.responseText);
				}
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
			
			if (($.trim(zcSiDoName) =="")||(zcSiDoName==null)){
				alert("시도명을 입력해주셔야 합니다.")
				return;
			}
			if (($.trim(zcSiGunGuName) =="")||(zcSiGunGuName==null)){
				alert("시군구명을 입력해주셔야 합니다.")
				return;
			}
			if (($.trim(zcRoadName) =="")||(zcRoadName==null)){
				alert("도로명을 입력해주셔야 합니다.")
				return;
			}
			if (($.trim(zcBuildingMainNo) =="" ) ||(zcBuildingMainNo==null)){
				alert("건물번호을 입력해주셔야 합니다.")
				return;
			}
			
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

			if (($.trim(zcSiDoName) =="")||(zcSiDoName==null)){
				alert("시도명을 입력해주셔야 합니다.")
				return;
			}
			if (($.trim(zcSiGunGuName) =="")||(zcSiGunGuName==null)){
				alert("시군구명을 입력해주셔야 합니다.")
				return;
			}
			if (($.trim(zcLegalEupMyeonDongName) =="")||(zcLegalEupMyeonDongName==null)){
				alert("동(읍/면)을 입력해주셔야 합니다.")
				return;
			}
			if (($.trim(zcJiBunMain) =="")||(zcJiBunMain==null)){
				alert("지번을 입력해주셔야 합니다.")
				return;
			}
			
			
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

			if (($.trim(zcSiDoName) =="")||(zcSiDoName==null)){
				alert("시도명을 입력해주셔야 합니다.")
				return;
			}
			if (($.trim(zcSiGunGuName) =="")||(zcSiGunGuName==null)){
				alert("시군구명을 입력해주셔야 합니다.")
				return;
			}
			if (($.trim(zcBuildingBook) =="")||(zcBuildingBook==null)){
				alert("건물명(아파트 등)을 입력해주셔야 합니다.")
				return;
			}
			
			
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
		$
				.ajax({
					type : 'POST', // Http Request Method로 POST로 지정
					url : '/PostSeek/zcAll.mwav', // 서버 요청 주소
					//dataType: "json",
					data : url, //formData JavaScript 객체를 JSON 객체로 변환하여 서버 요청시 전송
					success : function(data) {
						//alert('성공');
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

						/* 	alert(data);
							var aa = JSON.stringify(data);
							alert(aa); */

						// 데이터가 없는 경우 undefined이다.
						if ($.trim(data)) {
							//즉 공백제거시에도 데이터가 true 인 경우

							if ($(".ondis").css("display") == "none") {
								//alert("on");
								$(".ondis").show();
								$(".offdis").hide();
								
								// 영역을 초과하면 스크롭생성 이거는 추후 높이값에 따라 하는걸로 변경
								// overflow-y 는 아래와 같이 쓴다.
								var objSet   = document.getElementById("resultpostseek"); 
								
								objSet.style.height="300px";
								objSet.style.overflowY ="scroll";
								
							}
							var list = data;
							var listLen = list.length;
							//alert('listLen'+listLen);
							//alert('list'+list);
							//var col-md-8 = "col-md-8 text-center";
							var content =null; 
							var address_zibun =null;
							var address_doro =null;
							//alert('구분' + list.post_mode);
							$("#postresult").empty();
							//재 검색시 이부분을 안해주면 이전 쿠키 즉 검색결과에 동일한게 밑에 출력 
							//empty()는 관련 html의 텍스트 제거  http://findfun.tistory.com/243

							// var address = "<a href="+ javascript:sendAddress(list[i].zcSiDoName + list[i].zcSiGunGuName + list[i].zcLegalEupMyeonDongName + list[i].zcLegalRiName + list[i].zcJiBunMain) +">";
							for (i = 0; i < listLen; i++) {

								// 좀더 상세하게 구분 모두 0 / 둘중 하나 0 - 2가지 / 둘다 1 = 총 4가지
								if (list[i].zcBuildingSubNo == 0
										|| list[i].zcJiBunSub == 0) {
									address_zibun = list[i].zcSiDoName
											+ list[i].zcSiGunGuName
											+ list[i].zcLegalEupMyeonDongName
											+ list[i].zcLegalRiName
											+ list[i].zcJiBunMain;
									address_doro = list[i].zcSiDoName
											+ list[i].zcSiGunGuName
											+ list[i].zcRoadName
											+ list[i].zcBuildingMainNo;
								} else {
									address_zibun = list[i].zcSiDoName
											+ list[i].zcSiGunGuName
											+ list[i].zcLegalEupMyeonDongName
											+ list[i].zcLegalRiName
											+ list[i].zcJiBunMain + "-"
											+ list[i].zcJiBunSub;

									address_doro = list[i].zcSiDoName
											+ list[i].zcSiGunGuName
											+ list[i].zcRoadName
											+ list[i].zcBuildingMainNo + "-"
											+ list[i].zcBuildingSubNo;
								}
								
								//아래 와같이 ""에 대하여 없도록 치환처리 ! // 공백처리 없이 
								address_doro = address_doro.replace(/"/g, "");
								address_doro = address_doro.replace( /(\s*)/g, "");
								
								address_zibun = address_zibun.replace(/"/g, "");
								address_zibun = address_zibun.replace( /(\s*)/g, "");
								
								content += "<tr id=" + "\"refresh\">"
										+ "<td class=" + "\"col-md-8 text-center \">"
										+ "<a href=" + "javascript:"
										+ "sendAddress('" + address_doro + "','" + list[i].zcZipCode + "')>"
										+ address_doro + "</br>"
										+ address_zibun + "</a></td>";
								content += "<td class=" +"\"col-md-8 text-center\">"
										+ list[i].zcZipCode + "</td>" + "</tr>";

							}
							$("#postnull").empty();
							$("#postresult").append(content);
						} else {

							$("#postresult").empty();
							$("#postnull").empty();
							//위의 이게 조회된 결과값 중복 해서 나오지 않도록 해주는 것이다. !!!! 
							// form도 마찬가지 
							//alert('1');
							if ($(".ondis").css("display") == "none") {
								//alert("on");
								$(".ondis").show();
								$(".offdis").hide();
							}

							var content = "";
							content += "<tr>"
									+ "<td colspan=\"4\" class=\"text-center\">조회된 결과가 없습니다.</td>"
									+ "</tr>";
							
							$("#postnull").append(content);
						}
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
					beforeSend : function() {
						//(이미지 보여주기 처리)
						//alert('1');
						$('.wrap-loading').removeClass('display-none');
					},
					complete : function() {
						//(이미지 감추기 처리)
						//alert('2');
						$('.wrap-loading').addClass('display-none');

					},

					error : function(status, error) {
						//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						if (status == 0) {
							alert('You are offline!!n Please Check Your Network.');
						} else if (status == 404) {
							alert('Requested URL not found.');
						} else if (status == 500) {
							alert('Internel Server Error.');
						} else if (error == 'parsererror') {
							alert('Error.nParsing JSON Request failed.');
						} else if (error == 'timeout') {
							alert('Request Time out.');
						} else {
							alert('Unknow Error.n' + request.responseText);
						}
					} // 서버로부터 응답 데이터 실패시 로직 처리
				});
	}
</script>

<script>
	function showhide() {

		if ($(".offdis").css("display") == "none") {
			//alert("on");
			$(".offdis").show();
			$(".ondis").hide();
			/*
			$("#postresult").empty();
							$("#postnull").empty();
							조회된 결과 값이 계속해서 나오지 않도록 empty로 해준다 상단 ajax 결과에서 참고~! 
			*/

		}
	}
</script>
<style>
.wrap-loading_images { /*로딩 이미지*/
	position: fixed;
	top: 50%;
	left: 50%;
	margin-left: -21px;
	margin-top: -21px;
}

.display-none { /*감추기*/
	display: none;
}

.wrap-loading { /*화면 전체를 어둡게 합니다.*/
	position: fixed;
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	z-index: 10000;
	background: rgba(0, 0, 0, 0.2); /*not in ie */
	filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000',
		endColorstr='#20000000'; /* ie */
}
</style>
<!-- 모든필드 필수값으로 ~!  -->
<div class="container">
	<!-- Modal -->
	<%--http://www.ajaxload.info/ --%>
	<div class="modal fade modal_post" id="myModal" tabindex="-1"
		role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-md">
			<div class="wrap-loading display-none">
				<img class="wrap-loading_images "
					src="/CommonApps/PostSeek/Images/ajax-loader.gif">
			</div>
			<div class="modal-content">

				<div class="modal-header"
					style="border-bottom: 0px solid #eee; background-color: #0480be; color: white;">
					<h4 class="modal-title">주소찾기</h4>
				</div>
				<br>
				<div class="bs-example bs-example-tabs">
					<ul id="myTab" class="nav nav-tabs">
						<li class="active"><a href="#postfinder_1" data-toggle="tab"
							onclick="showhide();">도로명+건물번호</a></li>
						<li class=""><a href="#postfinder_2" data-toggle="tab"
							onclick="showhide();">동(읍/면)+지번</a></li>
						<li class=""><a href="#postfinder_3" data-toggle="tab"
							onclick="showhide();">건물명(아파트명)</a></li>
					</ul>
				</div>
				<div class="modal-body">
					<div class="container-fluid">
						<div id="myTabContent" class="tab-content">
							<div class="tab-pane active fade in" id="postfinder_1">
								<form class="form-horizontal" name="postfinder_1" method="post">
									<%--method="post" 없으면 안된다.! 이상한 페이지로 포워딩 및 정확한 값이 들어가도 오류발생--%>
									<div class="col-md-12 offdis">
										<h3>검색방법</h3>
										<p>예) 테헤란로 152 -> '서울시' '강남구' 선택후 테헤란로(도로명) + 152(건물번호)
											주소를 모르실 경우, http://www.juso.go.kr 에서 정확한 주소를 확인하실 수 있습니다.</p>
										<br />
										<!--  <input type="hidden" name="post_mode" value="post_zcRoadName" /> -->
										<div class="row">
											<div class="col-xs-12 col-sm-6 col-md-6">특별, 광역시/도</div>
											<div class="col-xs-12 col-sm-6 col-md-6">
												<select name="zcSiDoName" class="form-control zcSiDoName_1"
													onchange="SelectFindercheck(1)" required>
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
											<div class="enter"></div>
											<div class="col-xs-12 col-sm-6 col-md-6">시/군구</div>
											<div class="col-xs-12 col-sm-6 col-md-6">
												<select class="form-control" id="zcSiGunGuName"
													name="zcSiGunGuName" required>
												</select>
											</div>
										</div>
										<br />
										<div class="row">
											<div class="col-xs-12 col-sm-12 col-md-12">
												<input type="text" name="zcRoadName" id="zcRoadName"
													class="form-control" placeholder="도로명..." required>
											</div>

											<div class="enter hiddien-sm hidden-md"></div>


											<div class="col-xs-12 col-sm-12 col-md-12 ">
												<input type="text" id="zcBuildingMainNo"
													class="form-control" placeholder="건물번호..." required>
											</div>

											<div class="enter"></div>


											<div class="col-xs-12 col-sm-12 col-md-12">
												<%--버튼으로 넣어놔야한다. 아래 submit 으로 넣어놓으면 창 없어지면서 변경 --%>
												<button type="button" class="btn btn-info btn-sm btn-block"
													onclick="SelectPostFinder_2(1);">검색</button>
											</div>
										</div>
									</div>
								</form>
							</div>
							<div class="tab-pane fade " id="postfinder_2">
								<form class="form-horizontal " name="postfinder_2" method="post">
									<div class="col-md-12 offdis">
										<h3>검색방법</h3>
										<p>예) 잠실동 27 -> '서울시' '송파구' 선택 후 잠실동(동명) + 27(지번) 주소를 모르실
											경우, http://www.juso.go.kr 에서 정확한 주소를 확인하실 수 있습니다.</p>
										<br />

										<div class="row">
											<div class="col-xs-12 col-sm-6 col-md-6">특별, 광역시/도</div>
											<div class="col-xs-12 col-sm-6 col-md-6">
												<select name="zcSiDoName" class="form-control zcSiDoName_2"
													onchange="SelectFindercheck(2)" required>
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
											<div class="enter"></div>
											<div class="col-xs-12 col-sm-6 col-md-6">시/군구</div>
											<div class="col-xs-12 col-sm-6 col-md-6">
												<select class="form-control" id="zcSiGunGuName"
													name="zcSiGunGuName" required>
												</select>
											</div>
										</div>
										<br />
										<div class="row">
											<div class="col-xs-12 col-sm-12 col-md-12">
												<input type="text" name="zcLegalEupMyeonDongName"
													id="zcLegalEupMyeonDongName" class="form-control"
													placeholder="동(읍/면)..." required>
											</div>

											<div class="enter hiddien-sm hidden-md"></div>

											<div class="col-xs-12 col-sm-12 col-md-12">
												<input type="text" name="zcJiBunMain" id="zcJiBunMain"
													class="form-control" placeholder="지번..." required>
											</div>

											<div class="enter "></div>

											<div class="col-xs-12 col-sm-12 col-md-12">
												<button type="button" class="btn btn-info btn-sm btn-block"
													onclick="SelectPostFinder_2(2);">검색</button>
											</div>
										</div>
									</div>
								</form>
								<br />
								<hr />
							</div>
							<div class="tab-pane fade" id="postfinder_3">
								<form class="form-horizontal" name="postfinder_3" method="post">
									<div class="col-md-12 offdis">
										<h3>검색방법</h3>
										<p>예) '서울시' '강남구' 선택 후 강남파이낸스센터(건물명) 주소를 모르실 경우,
											http://www.juso.go.kr 에서 정확한 주소를 확인하실 수 있습니다.</p>
										<br />

										<div class="row">
											<div class="col-xs-12 col-sm-6 col-md-6">특별, 광역시/도</div>
											<div class="col-xs-12 col-sm-6 col-md-6">
												<select name="zcSiDoName" class="form-control zcSiDoName_3"
													onchange="SelectFindercheck(3)" required>
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

											<div class="enter"></div>

											<div class="col-xs-12 col-sm-6 col-md-6">시/군구</div>
											<div class="col-xs-12 col-sm-6 col-md-6">
												<select class="form-control" id="zcSiGunGuName"
													name="zcSiGunGuName" required>
												</select>
											</div>
										</div>
										<br />
										<div class="row">
											<div class="col-xs-12 col-sm-12 col-md-12">
												<input type="text" name="zcBuildingBook" id="zcBuildingBook"
													class="form-control" placeholder="건물명(아파트명 등)..." required>
											</div>

											<div class="enter "></div>
											<div class="col-xs-12 col-sm-12 col-md-12">
												<button type="button" class="btn btn-info btn-sm btn-block"
													onclick="SelectPostFinder_2(3);">검색</button>
											</div>
										</div>

									</div>
								</form>
							</div>
						</div>
						<div id="resultpostseek" class="table-responsive ondis" style="display: none">
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
									<tr>
										<a href="#" class="btn btn-info btn-sm btn-block"
											onclick="showhide(this.form);">재 검색</a>
									</tr>
								</tbody>
								<tbody id="postnull">

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