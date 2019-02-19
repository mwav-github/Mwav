<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	function AllCheck() {
		var agree_1_1_d = document.getElementById("agree_1_1_d");
		var agree_1_2_d = document.getElementById("agree_1_2_d");

		var agree_2_1_d = document.getElementById("agree_2_1_d");
		var agree_2_2_d = document.getElementById("agree_2_2_d");

		if (agree_1_1_d.checked && agree_2_1_d.checked) {
			//alert("이용약관에 동의하셨습니다.");
			location.href = "/MasterPage_1.mwav?mode=SMbrInput"
		} else {
			alert("이용약관에 동의하지 않으셨습니다. 동의 후 이용 가능하십니다.")
			$('#agree_1_d').focus();
			return false;
		}
	}

	// 2019-01-31
	// 작성자 : 남동희
	// 약관 전체 선택 기능 추가
	// 전체동의 선택시 약관 agree checked, 한번 더 누르면 checked 해제
	$(document).ready(function() {
		$("#agree_all").click(function() {
			var flag = $(this).prop('checked');
			$("#agree_1_1_d").prop('checked', flag);
			$("#agree_2_1_d").prop('checked', flag);
		});
	})
</script>
<div class="row setup-content">
	<div class="col-xs-12">
		<h1 class="text-left">STEP 1</h1>

		<div class="col-md-12 well text-center mgt4">
			<p class="text-left">
				<label class="mgr3">
					<input type="checkbox" name="agree_all" id="agree_all"> [Mwav] 이용자 약관 및 개인정보 정책에 전부 동의합니다.
				</label>
			</p>

			<div class="form-group">
				<%-- 약관동의 1_Mwav회원약관 
				"Mwav 약관"을 "이용자 약관" 으로 교체 - 16/10/26
				--%>
				<p class="text-left">
					<label for="comment"> 이용자 약관 </label>
				</p>
				<textarea class="form-control" rows="15" readonly="readonly" id="comment"> 
  ① 이용자는 “Mwav”이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.
  
  ② “Mwav”은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 회원으로 등록합니다.

    1. 가입신청자가 이 약관 제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제7조제3항에 의한 회원자격 상실 후 3년이 경과한 자로서 “Mwav”의 회원재가입 승낙을 얻은 경우에는 예외로 한다.
    2. 등록 내용에 허위, 기재누락, 오기가 있는 경우
    3. 기타 회원으로 등록하는 것이 “Mwav”의 기술상 현저히 지장이 있다고 판단되는 경우

  ③ 회원가입계약의 성립 시기는 “Mwav”의 승낙이 회원에게 도달한 시점으로 합니다.

  ④ 회원은 회원가입 시 등록한 사항에 변경이 있는 경우, 상당한 기간 이내에 “Mwav”에 대하여 회원정보 수정 등의 방법으로 그 변경사항을 알려야 합니다.
					
					</textarea>
				<!-- name 으로 안묶이면 중복선택이 안되므로 id값으로 구분 값 변경 -->
				<p class="text-center pdt1_5">
					<label class="mgr3">
						<input type="radio" name="agree_1_d" id="agree_1_1_d"> Agree
					</label>
					<label>
						<input type="radio" name="agree_1_d" id="agree_1_2_d"> Disagree
					</label>
				</p>
				<%-- 약관동의 1_Mwav회원약관 --%>
				<p class="text-left mgt5">
					<label for="comment"> [Mwav]개인정보 수집 및 이용에 대한 안내 </label>
				</p>
				<textarea class="form-control " rows="15" readonly="readonly" id="comment">
[개인정보 수집 및 이용에 대한 안내]

1. 개인정보 수집 및 이용목적
(1) 회사는 회원의 업무처리를 위하여 최소한의 필수정보를 수집하며, 제공한 모든 개인정보는 별도의 동의가 없는 한 해당목적 이외의 다른 목적으로 사용하지 않습니다. 
(2) 회사는 개인정보의 수집항목, 이용목적, 용도 등이 변경될 경우 사전 고지하며, 회원의 동의를 구할 것입니다.
(3) 회사는 수집한 개인정보를 다음의 목적을 위하여 사용합니다.
가. 회원관리
  회원확인, 중복 가입 방지, 부정 이용 방지와 비 인가 사용 방지, 가입 의사 확인, 고지사항 전달 등 
나. 정산업무
  정산업무를 위한 세금계산서 발생 

2. 개인정보 수집 항목
대표자 이름, 휴대전화번호, 이메일 주소, 비밀번호

3. 개인정보의 이용 및 보유기간
수집한 개인정보는 서비스를 제공하는 기간 또는 법적 보관사유 기간 동안에 한하여 보유/관리하며 정보주체자의 삭제 요구와 탈회 요청이 있을 경우 지체없이 파기합니다. 단, 관계법령의 규정에 의하여 보존할 필요가 있는 경우는 아래와 같이 관계법령에서 정한 일정기간 동안 최소한의 정보로 안전하게 보관합니다.
가. 장부, 서류의 보존 : 10년(상법) 
나. 장부의 작성,보관 :  5년(부가가치세법) 

4. 동의거부권 및 거부 시 불이익 사항
개인정보 주체자는 개인정보 수집, 이용에 대한 동의를 거부할 권리가 있습니다. 동의를 거부할 경우 Mwav.net 가입이 불가함을 알려드립니다.

								
					
					</textarea>
				<!-- name 으로 안묶이면 중복선택이 안되므로 id값으로 구분 값 변경 -->
				<p class="text-center pdt1_5">
					<label class="mgr3">
						<input type="radio" name="agree_2_d" id="agree_2_1_d"> Agree
					</label>
					<label>
						<input type="radio" name="agree_2_d" id="agree_2_2_d"> Disagree
					</label>
				</p>
				<button class="btn btn-primary btn-lg mgt4" onclick="AllCheck();">동의합니다.</button>
			</div>
		</div>
	</div>
</div>
