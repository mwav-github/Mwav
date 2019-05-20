<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="net.promoter.vo.Promoter_VO"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script>
//회원가입시 아래의 6개의 변수가 true가 되어야지만 가입할수있다.
	var IdCheckYN = false;		//아이디
	var PwdCheckYN = false;		//비밀번호
	var PwdCheck2YN = false;	//비밀번호확인
	var NameCheckYN = false;	//이름
	var PhoneCheckYN = false;	//핸드폰
	var EmailCheckYN = false;	//이메일

	$(document).ready(function(){
	    $('[data-toggle="popover"]').popover(); 
	});
	
	//타입별 정규식, 정규식 표현은 멤버 회원가입과 동일
	function regexCheck(type, value){
		var result = false;
		switch(type){
		case 'pmtLoginId' :
			//아이디의 경우 정규식 유효성 체크 후, 중복여부 확인
			result = /[a-zA-Z0-9_-]{4,20}$/g.test(value);
			if(!result){
				console.log('유효하지 않은 아이디입니다. \n4~20자 사이의 영문,숫자, -_ 만 사용할 수 있습니다.')
				result = false;
			}
			//ajax를 사용하여 해당 아이디 중복 여부 확인
			// 에이젝스 비동기처리 ....
			$.ajax({
				url:'/promoter/pmtLoginIdCheck.mwav',
				data:{
					type:type,
					value:value
				},
				success:function(data){
					//해당 아이디가 존재하면 1, 없는 아이디면 0
					if(data == '0'){
						IdCheckYN = true;
						alert('해당 아이디는 사용하실수 있는 아이디입니다.');
					}else{
						console.log('data2 : '+ data);
						alert('이미 존재하는 아이디입니다.');
					}
				},
				error:function(err){
					alert('Error!\n관리자에게 문의하여 주시기 바랍니다.');
				}
			});
			
			break;
		
		case 'pmtLoginPw' : 
			result = /^(?=.*[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"])(?=.*[0-9])(?=.*[a-zA-Z])[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"0-9a-zA-Z]{8,255}$/g.test(value);
			if(!result)
				result = false;
			else
				PwdCheckYN = true;
			break;
			
		case 'pmtLoginPwChk' : 
			var pwd = $('input[name=pmtLoginPw]').val();
			if(pwd != value || pwd.length == 0)
				result = false;
			else
				PwdCheck2YN = true;
			break;
			
		case 'pmtName' : 
			result = /^[가-힣]+$/g.test(value);
			if(!result)
				result = false;
			else
				NameCheckYN = true;
			break;
		
		case 'pmtCellularPhone' : 
			result = /^\d{3}-\d{3,4}-\d{4}$/g.test(value);
			if(!result)
				result = false;
			else
				PhoneCheckYN = true;
			break;
		
		case 'pmtMail' : 
			result = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/g.test(value);
			if(!result)
				result = false;
			else
				EmailCheckYN = true;
			break;
		default : alert('Error!\n잘못된 타입입니다.');
		}
		return result;	//이상이 없다면 정규식 true
	}	
	
	//각각의 입력란에 대한 유효성 체크를 한다.
	function validateCheck(type){
		var value = $('input[name='+ type +']').val();
		//정규식 유효성 체크
		if(!regexCheck(type, value)){
			$('input[name='+ type +']').css("border","solid 3px red");
			$('#'+ type +'False').css('display','block');	//정규식 설명
		}else{
			$('input[name='+ type +']').css("border","solid 3px greenyellow");
			$('#'+ type +'False').css('display','none');	//숨김
		}
		
		//console.log('확인 : '+IdCheckYN +', '+PwdCheckYN +', '+ PwdCheck2YN +', ' +NameCheckYN +', '+ PhoneCheckYN +', '+EmailCheckYN);
	}
</script>

</head>

<div class="col-md-12">
	<!-- Content Column -->
	<div class="col-lg-12">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<%-- 1. 회원정보 입력 --%>
				<form class='form-horizontal' method="post" action="/promoter/PmtForm.mwav">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

						<div class="panel panel-primary">
							<div class="panel-heading">
								<h3 class="panel-title">Mwav - Promoter Registration</h3>
							</div>
							<div class="panel-body">
								<div class="row">
									<div class=" col-md-12 col-lg-12 ">
										<table class="table table-user-information">
											<tbody>
												<tr>
													<td>아이디:</td>
													<td>
														<div class='form-group'>
															<div class='col-md-8'>

																<input class='form-control' name="pmtLoginId"
																	id="chkLoginId" type='text' maxlength="15"> 
																	
																<button type='button' onclick='validateCheck("pmtLoginId");'>아이디 중복 체크</button>
																
																<span class="col-md-12" id="idcheckLayer"></span>
															</div>
														</div>
													</td>
												</tr>

												<tr>
													<td>비밀번호:</td>
													<td>
														<div class='form-group'>
															<div class='col-md-8'>
																<input class='form-control' name="pmtLoginPw"
																	id="chkLoginPW" type='password' onfocusout='validateCheck("pmtLoginPw");'>
																<div id='pmtLoginPwFalse' class='checkFalse' style="display:none; background:red; color:white;">유효하지 않은 비밀번호입니다. <br>8~255자 사이의 영문,숫자,특수문자로 구성되어야 합니다.</div>
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<td>비밀번호 확인:</td>
													<td>
														<div class='form-group'>
															<div class='col-md-8'>
																<input class='form-control' name="pmtLoginPwChk"
																	id="chkLoginPwChk" type='password' onfocusout='validateCheck("pmtLoginPwChk");'>
																	<div id='pmtLoginPwChkFalse' class='checkFalse' style="display:none; background:red; color:white;">비밀번호가 일치하지 않습니다.</div>
															</div>
														</div>
													</td>
												</tr>												
												<tr>
													<td>이름:</td>
													<td><div class='form-group'>
															<div class='col-md-8'>
																<input class="form-control" name="pmtName" type="text"
																	maxlength="20" onfocusout='validateCheck("pmtName");' />
																<div id='pmtNameFalse' class='checkFalse' style="display:none; background:red; color:white;">한글만 입력해주세요.</div>
															</div>
														</div></td>
												</tr>
												<tr>
													<td>핸드폰번호:</td>
													<td><div class='form-group'>

															<div class='col-md-8'>
																<input class="form-control" name="pmtCellularPhone"
																	type="text" maxlength="13" onfocusout='validateCheck("pmtCellularPhone");' />
																<div id='pmtCellularPhoneFalse' class='checkFalse' style="display:none; background:red; color:white;">010-1234-5678 형태로 입력해주세요 </div>
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<td>이메일:</td>
													<td><div class='form-group'>
															<div class='col-md-8'>
																<input class="form-control" name="pmtMail" id="chkEmail" type="text" onfocusout='validateCheck("pmtMail");' />
																<div id='pmtMailFalse' class='checkFalse' style="display:none; background:red; color:white;">유효하지 않은 이메일 입니다.</div>
															</div>
														</div></td>
												</tr>

												<tr>
													<td>직업 :</td>
													<td><div class='form-group'>
															<div class='col-md-8'>
																<input class="form-control" name="pmtJobType"
																	type="text" maxlength="200" />
															</div>
														</div></td>
												</tr>
												<tr>
													<td>결혼여부</td>
													<td><div class='form-group'>
															<div class='col-md-6'>
																<label class='radio-inline' style='margin-right:20px;'><input id='MarriedN' class="" name="pmtMarried" value="0" type="radio" /> 미혼</label>																
																<label class='radio-inline'><input id='MarriedY' class="" name="pmtMarried" value="1" type="radio" /> 결혼</label>
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<td>주소:</td>
													<td>

														<div class='form-group'>

															<p class="col-md-3 pull-right">
																<button class="btn btn-primary btn-block" type="button" data-toggle="modal" data-target=".modal_post" data-dismiss="modal">주소찾기</button>
															</p>

															<div class='col-md-8'>
																<div style='margin-bottom: 15px;'>
																	<input class="form-control" id="Zipcode" name="pmtZipcode" type="text" maxlength="6" value="" placeholder='우편번호' readOnly />
																</div>
																<input class="form-control" id="Address" value="" name="pmtAddress_1" type="text" placeholder='주소' readOnly />
																<input class="form-control" id='rest_address'     name="pmtAddress_2" value="" id="rest_Address" type="text" placeholder='나머지 주소' required />
															</div>
														</div>
													</td>
												</tr>
												<tr>
														<td>추천인아이디:</td>
														<td>
															<div class='col-md-8'>
																<input class='form-control' name="pmtRcmderId"
																	id="chkUpperPromo_id" type='text' maxlength="20"
																	onchange="idcheck('chkUpperPromo_id')" required>
															</div>
														</td>
													</tr>
											</tbody>
										</table>
									</div>
								</div>
								<div class="panel-footer">

									<button type="button" class="btn btn-sm btn-primary"
										onclick="javascript:window.location.href='/admins/staff/pmtList.mwav'">
										리스트</button>

									<button type="button" class="btn btn-sm btn-primary"
										onClick="javascript:history.go(-1)">뒤로가기</button>

									<button onclick="pmtSubmit()" type="button"
										class="btn btn-sm btn-primary">가입하기</button>

								</div>

							</div>
						</div>
					</div>
				</form>
		</div>
	</div>
</div>



<%-- 
	Promoter Form은 부트스트랩 4를 사용하므로 주소찾기jsp인 PostSeek(부스스트랩3)를 사용하지 못한다.
	 그러므로 별도로 생성 
--%>
<script language="javascript">
	function getAddrLoc() {
		$.ajax({
			url : "/sample/getAddrApi.mwav",
			type : "post",
			data : $("#post_form").serialize(),
			dataType : "xml",
			success : function(xmlStr) {
				$("#postresult").html("");

				var errCode = $(xmlStr).find("errorCode").text();
				var errDesc = $(xmlStr).find("errorMessage").text();
				if (errCode != "0") {
					//alert(errCode + "=" + errDesc);
					alert(errDesc);
				} else {
					if (xmlStr != null) {
						showhide();
						makeList(xmlStr);

						var objSet = document.getElementById("resultpostseek");
						var objSet_height = $("#resultpostseek").height();
						//alert($("#resultpostseek").height());
						if (objSet_height >= "300") {
							objSet.style.height = "300px";
							objSet.style.overflowY = "scroll";
						} else {
							objSet.style.height = "auto";
							objSet.style.overflowY = "hidden";
						}
						objSet.style.overflowX = "hidden";
						pageMake(xmlStr);

					}
				}
			},
			error : function(xhr, status, error) {
				alert("에러발생");
			}
		});
	}

	function makeList(xmlStr) {
		//총 출력 개수
		var total = $(xmlStr).find("totalCount").text();
		$(".tnt_result").html(total);

		//$('input[name="totalPage"]').val(total);

		var currentPage = $(xmlStr).find('currentPage').text();
		var no = (currentPage - 1) * 10;
		//리스트 출력
		var htmlStr = "";
		htmlStr += "<table>";
		$(xmlStr).find("juso").each(
				function(index) {
					var roadAddr = $(this).find('roadAddr').text();
					//alert(roadAddr);
					//이건 this가 아니다 노드 depth가 하나더 위이니 
					//var currentPage =  $(xmlStr).find('currentPage').text();
					//index *= 1;
					//currentPage *= 1;
					//alert(currentPage);
					//console.log(index);
					//console.log(currentPage);

					//var index_ = index+1;
					//위에서 더하기 안하면 0이나와 곱하기시 값이 0나와서 따로 해야한다.
					//var no = currentPage * index_;

					//alert(typeof(index));

					//공백등으로 제대로 안출력되므로 특수문자등 제거해줘야 스크립트 먹힌다.
					//다른부분에 대한 고민해보기 
					roadAddr = roadAddr.replace(/"/g, "");
					roadAddr = roadAddr.replace(/(\s*)/g, "");
					//alert(roadAddr);

					htmlStr += "<tr>";
					htmlStr += "<td class=" + "\" text-center \">"
							+ (no + index + 1) + "</td>";
					htmlStr += "<td class=" + "\"text-left \">"
							+ "<a href=" + "javascript:" + "sendAddress('"
							+ roadAddr + "','" + $(this).find('zipNo').text()
							+ "')>"
					htmlStr += $(this).find('roadAddr').text() + "</br>"
							+ $(this).find('jibunAddr').text() + "</a></td>";
					/* htmlStr += "<td>" + $(this).find('roadAddrPart1').text() + "</td>";
					htmlStr += "<td>" + $(this).find('roadAddrPart2').text() + "</td>";
					 */
					//htmlStr += "<td>" + $(this).find('engAddr').text() + "</td>";
					htmlStr += "<td class=" + "\" text-center \">"
							+ $(this).find('zipNo').text() + "</td>";
					//htmlStr += "<td>" + $(this).find('admCd').text() + "</td>";
					//htmlStr += "<td>" + $(this).find('rnMgtSn').text() + "</td>";
					//htmlStr += "<td>" + $(this).find('bdMgtSn').text() + "</td>";
					//htmlStr += "<td>" + $(this).find('detBdNmList').text() + "</td>";
					htmlStr += "</tr>";
				});
		htmlStr += "</table>";
		$("#postresult").html(htmlStr);
	}

	//레이어팝업 이기 때문에 엔터는 조심
	//엔터 가능하도록 ! 
	//http://stackoverflow.com/questions/15239236/bootstrap-modal-dialogs-with-a-single-text-input-field-always-dismiss-on-enter-k
	function enterSearch() {
		var evt_code = (window.netscape) ? ev.which : event.keyCode;
		if (evt_code == 13) {
			event.preventDefault();
			getAddrLoc();
		}
	}

	function showhide() {

		if ($(".ondis").css("display") == "none") {
			//alert("on");
			$(".ondis").show();
			//$(".offdis").hide();
			/*
			$("#postresult").empty();
							$("#postnull").empty();
							조회된 결과 값이 계속해서 나오지 않도록 empty로 해준다 상단 ajax 결과에서 참고~! 
			 */

		}
	}

	function showonhide() {
		//alert('111');
		if ($(".offdis").css("display") == "none") {
			alert("on");
			$(".offdis").show();
			$(".ondis").hide();
			/*
			$("#postresult").empty();
							$("#postnull").empty();
							조회된 결과 값이 계속해서 나오지 않도록 empty로 해준다 상단 ajax 결과에서 참고~! 
			 */

		}
		// prevent default browser behaviour
		event.preventDefault();
	}

	//페이징 처리 자바스크립트 모듈화 고민 
	function pageMake(xmlStr) {
		var total = $(xmlStr).find("totalCount").text(); // 총건수
		//alert(total);

		// 중요 이슈 !!!! 페이징 계산이 안되서 확인해보니 
		// 자바스크립트에서 아래와 같이 받는 경우 STRING타입으로 받아서 계산시
		// 예) 10(STRING) + 11(NUMBE)  = 21 이 아닌 1011로 나왔다
		// 아래와 같이 타입변경 
		//https://blog.outsider.ne.kr/361

		var pageNum = $('input[name="currentPage"]').val();// 현재페이지
		//alert(pageNum);
		var paggingStr = "";
		if (total < 1) {
		} else {
			var PAGEBLOCK = $('input[name="countPerPage"]').val(); // // 하나의 블록에 몇 페이지가 속해있는지
			// 즉 3이면 보이지는 곳에는 1,2,3 페이지가 한블록 // 4,5,6 페이지가 한 블록
			;
			//alert(typeof(PAGEBLOCK));
			PAGEBLOCK *= 1;
			//alert(typeof(PAGEBLOCK));
			//alert(PAGEBLOCK);
			var pageSize = $('input[name="countPerPage"]').val(); //  한 페이지의 글의 개수
			;
			pageSize *= 1;
			//alert(typeof(pageSize));
			var totalPages = Math.floor((total - 1) / pageSize) + 1;
			var firstPage = Math.floor((pageNum - 1) / PAGEBLOCK) * PAGEBLOCK
					+ 1;
			if (firstPage <= 0)
				firstPage = 1;
			var lastPage = firstPage - 1 + PAGEBLOCK;
			if (lastPage > totalPages)
				lastPage = totalPages;
			var nextPage = lastPage + 1;
			var prePage = firstPage - 5;

			var currentPage = pageNum; // 현재 페이지
			// *pageNum도 현재 페이지 단! pageNum은 세션으로 고정 // currentPage는 계산으로 쓰이기에 분리
			var startRow; // 한 페이지의 시작글 번호 =쿼리에서 ROWNUM (시작)
			// ex) pageSize가 5인경우 1페이지 - 1 // 2페이지 - 6
			var endRow; // 한 페이지의 마지막 글번호 = ROWNUM (끝)
			// ex) pageSize가 5인경우 1페이지 - 5 // 2페이지 - 10
			var totalRow = total; // 전체 글의 갯수

			var pageCount; // 전체 페이지수
			// 위는 전체 글의 갯수이고 해당 필드는 전체 페이지의 수이다.

			var remainRow; // 남은 행이 있는지 검사
			// 전체 행(=COUNT) % 페이지 크기(10)0이면 딱 맞는 것이고 1이면 false 적거나 많은 것
			var pageBlock = PAGEBLOCK; // 하나의 블록에 몇 페이지가 속해있는지
			// 즉 3이면 보이지는 곳에는 1,2,3 페이지가 한블록 // 4,5,6 페이지가 한 블록
			var result; // 시작페이지를 잡아준다.
			var startPage; // 현재 블록의 시작 페이지 아래를 보면 6페이지부터는 2블록이 된다.
			// 1페이지 는 0 * 1/5 + 1 => 1
			// 6페이지 는 6 * 6/5 + 1 => 2

			var endPage; // 현재 블록의 마지막 페이지

			var number; // 실제 화면에 보여지는 시작 글 번호 1페이지 맨위 번호

			if (totalRow % pageSize == 0) {
				remainRow = 0;
			} else {
				remainRow = 1;
			}

			pageCount = totalRow / pageSize + remainRow;
			//alert("pageCount" + pageCount);
			//pageBlock = 5; // <<1,2,3,4,5>>

			result = parseInt((currentPage - 1) / pageBlock);
			//alert("result=" + result);

			startPage = result * pageBlock + 1;
			//alert("startPage=" + startPage);

			//alert(typeof(startPage));
			//alert(typeof(pageBlock - 1));
			//alert(typeof(pageBlock));
			endPage = (startPage + pageBlock) - 1;
			//alert("endPage=" + endPage);

			//여기선 사용 x 그기준으로 쿼리를 뽑는게 아니니  startRow = (currentPage - 1) * pageSize + 1;
			//여기선 사용 xendRow = currentPage * pageSize;

			// 즉 서버사이드에서는 위의 로우를 기준으로 재 뽑느다
			// 여기서는 전체 xml 리스트 중에서 다시 뽑는게 아닌 조개서 보여주는 것. 

			if (firstPage > PAGEBLOCK) {
				paggingStr += "<li><a class='pageClick'  href='javascript:goPage("
						+ prePage
						+ ");'><span class='glyphicon glyphicon-chevron-left'></span></a></li>  ";
			}
			for (i = firstPage; i <= lastPage; i++) {
				if (pageNum == i) {
					paggingStr += "<li><a class='pageClick' href='javascript:goPage("
							+ i + ");'>" + i + "</a></li>  ";
				} else {
					paggingStr += "<li><a class='pageClick' href='javascript:goPage("
							+ i + ");'>" + i + "</a></li>  ";

				}
			}
			if (lastPage < totalPages) {
				paggingStr += "<li><a class='pageClick' href='javascript:goPage("
						+ nextPage
						+ ");'><span class='glyphicon glyphicon-chevron-right'></span></a></li>";
			}
			$("#pageApi").html(paggingStr);
		}
	}

	function sendAddress(address, zcZipCode) {
		var address = address;
		var zcZipCode = zcZipCode;

		$("#Address").attr('value', address);
		$("#Zipcode").attr('value', zcZipCode);
		//$("#PostModal").hide();
		//$("#PostModal").modal('hide');
		$('#modalClose').click();

	}

	function goPage(pageNum) {
		$('input[name="currentPage"]').val(pageNum);
		//document.form.currentPage.value=pageNum;
		classToggle();
		getAddrLoc();
	}

	//클릭시 active 추가 
	//http://findfun.tistory.com/167
	function classToggle() {
		//alert('12');
		$('.pageClick').toggleClass("active");
		$('.pageClick').on("click", function() {

			alert('112');
			$(this).toggleClass("active");
		});
	}

	$(document).ready(function() {
		$('.pageClick').on("click", function() {

			alert('112');
			$(this).toggleClass("active");
		});
	});
</script>

<!-- 모든필드 필수값으로 ~!  -->
	<div class="container">
		<!-- Modal 
		 aria-hidden="true" false 이면 재클릭시 모달창이 안띄워진다. display: none로 되서 
		-->
		<div class="modal fade modal_post " id="PostModal" aria-hidden="true" role="dialog">
			<div class="modal-dialog modal-md">

				<div class="modal-content">

					<div class="modal-header" style="border-bottom: 0px solid #eee; background-color: #0480be; color: white;">
						<h4 class="modal-title">주소찾기</h4>
					</div>
					<br>

					<div class="modal-body">
						<div class="container-fluid">
							<div id="myTabContent" class="tab-content">
								<div class="tab-pane active">
									<form class="form-horizontal" id="post_form" method="post">
										<%--method="post" 없으면 안된다.! 이상한 페이지로 포워딩 및 정확한 값이 들어가도 오류발생--%>
										<div class="col-md-12 ">

											<!--  <input type="hidden" name="post_mode" value="post_zcRoadName" /> -->
											<div class="row">

												<div class="input-group">

													<input type="hidden" name="currentPage" value="1" />
													<!-- 요청 변수 설정 (현재 페이지) -->
													<input type="hidden" name="countPerPage" value="5" />
													<!-- 요청 변수 설정 (페이지당 출력 개수) -->

													<!-- <input type="hidden" name="totalRow" value="10" />
 -->

													<!-- 요청 변수 설정 (키워드) -->
													<!-- <input type="text" name="keyword" class="form-control" placeholder="도로명주소, 건물명 또는 지번 입력" onkeydown="return enterSearch();" /> -->
													<input type="text" name="keyword" class="form-control" placeholder="도로명주소, 건물명 또는 지번 입력" onkeydown="enterSearch();" />
													<span class="input-group-btn">

														<button type="button" class="btn btn-primary" onclick="getAddrLoc()">
															<span class="fa fa-search">
																<span class="sr-only">Search</span>
															</span>
														</button>
													</span>
												</div>
												<span class="text-center text-primary">
													&nbsp;검색어 예 : 도로명(반포대로 58), 건물명(독립기념관), 지번(삼성동 25)<br>

												</span>
											</div>
											<div class="enter"></div>
											<div class="row">
												<div id="resultpostseek">
													<p class="ondis" style="display: none">
														&nbsp;*해당되는 주소를 선택해주세요. (총 : <strong class="tnt_result"></strong>개)
													</p>
													<table class="table-responsive table table-striped ">
														<thead>
															<tr>
																<th class="text-center">NO.</th>
																<th class="text-center">도로명/지번주소</th>
																<th class="text-center">우편번호</th>
															</tr>
														</thead>
														<tbody id="postresult" class="ondis" style="display: none">

														</tbody>
														<tbody id="postnull">

														</tbody>
													</table>

												</div>
												<div class="text-center">
													<div class="col-lg-12">
														<ul class="pagination" id="pageApi">
														</ul>
													</div>
												</div>
											</div>
										</div>
									</form>
								</div>



							</div>
						</div>
						<div class="modal-footer">
							<button type="button" id='modalClose' class="btn btn-primary" data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
