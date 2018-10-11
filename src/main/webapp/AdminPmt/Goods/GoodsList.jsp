<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script>
function getShortUrl(url, utm_source, utm_campaign ,utm_medium, utm_content, subTitle, pgl) {
	
      var googleAnalytics_var = '&utm_source='+ utm_source +'&utm_campaign='+ trim(utm_campaign) +'&utm_medium='+utm_medium+'&utm_content='+utm_content;
      var pgl = '&pgl='+pgl
       var _url = encodeURIComponent(url+googleAnalytics_var+pgl);
    	
     console.log('sdf'+_url);
	
			$
					.ajax({
						url : "/API/NaverShorten.mwav",
						type : "post",
						data : _url,
						success : function(data) {
							if (data != null) {
								alert(data);
							}
						},
						error : function(xhr, status, error) {
							var errorMsg = 'status(code): ' + jqXHR.status
									+ '\n';
							errorMsg += 'statusText: ' + jqXHR.statusText
									+ '\n';
							errorMsg += 'responseText: ' + jqXHR.responseText
									+ '\n';
							errorMsg += 'textStatus: ' + textStatus + '\n';
							errorMsg += 'errorThrown: ' + errorThrown;
							alert(errorMsg);
							$("#alert_failure").show();
						}
					});
		
	}
</script>

<div class="row">
	<div class="col-12 col-md-6 col-lg-6">
		<div class="news">
			<div class="img-figure mgt5">
				<div class="cat2">$35</div>
				<img src="/CompanyItem/ITProducts/Images/Quick Heal_MultiDevice.png"
					class="img-fluid mx-auto d-block" alt="Quick Heal_MultiDevice">
			</div>
			<div class="title">
				<h1>
					Quick Heal <br>Total Security Multi-Device
				</h1>
			</div>
			<p class="description2 mgt3">
				<span class="glyphicon glyphicon-ok"></span> 온라인 뱅킹과 쇼핑 시에 여러분의 금융
				데이터를 보호합니다. <br> <span class="glyphicon glyphicon-ok"></span>
				자동 맞춤 설정 보안으로 웜, 트로이잔, 그리고 다른 악의적인 프로그램으로부터 안전하게 여러분의 Mac를 지속적으로 보호해
				줍니다. <br> <span class="glyphicon glyphicon-ok"></span> 안전한 저장소에
				개인정보문서를 보관하세요. <br> <br>
			</p>

			<p class="more2">
				<a href="/CustomerService/QnA/QnA.mwav?mode=qaForm"><strong>Learn
						more</strong></a><i class="fa fa-angle-right" aria-hidden="true"></i>
			</p>
			<p class="more2">
				<a class="btn btn-social-icon btn-facebook"
				onClick="getShortUrl('http://www.mwav.net/CompanyItem/ITProducts/QuickHeal/QuickHeal.mwav', 'promoter', 'abc', 'social', 'news', 'cdsdfsfd', '${param.pgl}')"><span
				class="fa fa-facebook"></span></a>
			</p>
		</div>
		<div class="enter visible-xs"></div>
	</div>

	<div class="col-12 col-md-6 col-lg-6">
		<div class="news">
			<div class="img-figure mgt5">
				<div class="cat2">$74</div>
				<img
					src="/CompanyItem/ITProducts/Images/Quick Heal_Total Security.png"
					class="img-fluid mx-auto d-block"
					alt="Quick Heal_Total
				Security">
			</div>
			<div class="title">
				<h1>
					Quick Heal <br>Total Security Multi-Device
				</h1>
			</div>
			<p class="description2 mgt3">
				<span class="glyphicon glyphicon-ok"></span> 완벽한 보안 환경에서 온라인 쇼핑, 뱅킹,
				결제를 하세요. <br> <span class="glyphicon glyphicon-ok"></span> 인가
				받지 않은 USB 드라이브에 개인신상정보 복사를 차단합니다. <br> <span
					class="glyphicon glyphicon-ok"></span> PC를 통해서 여러분의 스마트폰을 검사하고
				치료하세요. <br> <span class="glyphicon glyphicon-ok"></span> 멀티테스킹과
				고성능을 요하는 작업을 위해 컴퓨터 성능을 끌어 올리세요.
			</p>

			<p class="more2">
				<a href="/CustomerService/QnA/QnA.mwav?mode=qaForm"><strong>Learn
						more</strong></a><i class="fa fa-angle-right" aria-hidden="true"></i>
			</p>
		</div>
		<div class="enter visible-xs"></div>
	</div>

	<div class="col-12 col-md-6 col-lg-6">
		<div class="news">
			<div class="img-figure mgt5">
				<div class="cat2">$40</div>
				<img
					src="/CompanyItem/ITProducts/Images/Quick Heal_Internet Security.png"
					class="img-fluid mx-auto d-block"
					alt="Quick Heal_Internet Security">
			</div>
			<div class="title">
				<h1>Quick Heal Internet Security</h1>
			</div>
			<p class="description2 mgt3">
				<span class="glyphicon glyphicon-ok"></span> 감염되거나 가짜 웹사이트로부터 시스템을
				보호합니다. <br> <span class="glyphicon glyphicon-ok"></span> 해커와 악성
				프로그램에 대한 걱정 없이 온라인 쇼핑과 뱅킹을 즐기세요. <br> <span
					class="glyphicon glyphicon-ok"></span> 키로거 또는 스파이웨어와 같은 데이터 탈취
				프로그램으로부터 데이터를 보호합니다. <br> <span class="glyphicon glyphicon-ok"></span>
				어린이들의 인터넷과 컴퓨터 사용을 관리하고 조정하세요.
			</p>

			<p class="more2">
				<a href="/CustomerService/QnA/QnA.mwav?mode=qaForm"><strong>Learn
						more</strong></a><i class="fa fa-angle-right" aria-hidden="true"></i>
			</p>
		</div>
		<div class="enter visible-xs"></div>
	</div>


	<div class="col-12 col-md-6 col-lg-6">
		<div class="news">
			<div class="img-figure mgt5">
				<div class="cat2">$30</div>
				<img
					src="/CompanyItem/ITProducts/Images/Quick Heal_AntiVirus Pro.png"
					class="img-fluid mx-auto d-block" alt="Quick Heal_AntiVirus Pro">
			</div>
			<div class="title">
				<h1>Quick Heal AntiVirus Pro</h1>
			</div>
			<p class="description2 mgt3">
				<span class="glyphicon glyphicon-ok"></span> 알려지지 않은 새로운 멀웨어의 위협을
				차단하세요. <br> <span class="glyphicon glyphicon-ok"></span> 시스템의
				부하없이 PC를 스캔합니다. <br> <span class="glyphicon glyphicon-ok"></span>
				메일 수신함의 감염된 메일에서 자유로워 집니다. <br> <span
					class="glyphicon glyphicon-ok"></span> 악의적인 인터넷 다운로드에서 시스템을 보호합니다.
			</p>

			<p class="more2">
				<a href="/CustomerService/QnA/QnA.mwav?mode=qaForm"><strong>Learn
						more</strong></a><i class="fa fa-angle-right" aria-hidden="true"></i>
			</p>
		</div>
		<div class="enter visible-xs"></div>
	</div>

	<div class="col-12 col-md-6 col-lg-6">
		<div class="news">
			<div class="img-figure mgt5">
				<div class="cat2">$55</div>

				<img
					src="/CompanyItem/ITProducts/Images/Quick Heal_Internet Security.png"
					class="img-fluid mx-auto d-block" alt="Quick Heal_MultiDevice">

			</div>
			<div class="title">
				<h1>
					Quick Heal <br> Total Security for Mac
				</h1>
			</div>
			<p class="description2 mgt3">
				<span class="glyphicon glyphicon-ok"></span> 빠르고 반응성이 좋은 백신 프로그램 <br>
				<span class="glyphicon glyphicon-ok"></span> 악의적인 웹사이트에 대한 브라우징과 피싱
				방지 <br> <span class="glyphicon glyphicon-ok"></span> 임의로 보내진
				첨부파일을 비롯하여, 원활한 이메일 보호 기능은 말웨어 대한 이메일 트래픽을 모니터링 합니다. <br> <span
					class="glyphicon glyphicon-ok"></span> 맥북 추적 기능
			</p>

			<p class="more2">
				<a href="/CustomerService/QnA/QnA.mwav?mode=qaForm"><strong>Learn
						more</strong></a><i class="fa fa-angle-right" aria-hidden="true"></i>
			</p>
		</div>
		<div class="enter visible-xs"></div>
	</div>

	<div class="col-12 col-md-6 col-lg-6">
		<div class="news">
			<div class="img-figure mgt5">
				<div class="cat2">$7</div>
				<img
					src="/CompanyItem/ITProducts/Images/Quick Heal_Security for Android.png"
					class="img-fluid mx-auto d-block"
					alt="Quick Heal_Security for Android">

			</div>
			<div class="title">
				<h1>
					Quick Heal <br> Total Security for Android
				</h1>
			</div>
			<p class="description2 mgt3">
				<span class="glyphicon glyphicon-ok"></span> "콜 필터" 기능으로 원치 않은 국내/외
				전화번호를 차단하세요. <br> <span class="glyphicon glyphicon-ok"></span>
				클라우드 백업으로 여러분의 귀중한 데이터를 보호하세요. <br> <span
					class="glyphicon glyphicon-ok"></span> "시큐리티 어드바이저"를 통해 여러분의 디바이스의
				보안 수준을 향상 시킵니다.
			<p class="more2">
				<a href="/CustomerService/QnA/QnA.mwav?mode=qaForm"><strong>Learn
						more</strong></a><i class="fa fa-angle-right" aria-hidden="true"></i>
			</p>
		</div>
		<div class="enter visible-xs"></div>
	</div>

	<div class="col-12 col-md-6 col-lg-6">
		<div class="news">
			<div class="img-figure mgt5">
				<div class="cat2">$62</div>
				<img
					src="/CompanyItem/ITProducts/Images/Quick Heal_AntiVirus for Server.png"
					class="img-fluid mx-auto d-block"
					alt="Quick Heal_AntiVirus for Server">


			</div>
			<div class="title">
				<h1>Quick Heal AntiVirus for Server</h1>
			</div>
			<p class="description2 mgt3">
				<span class="glyphicon glyphicon-ok"></span> 쉬운 설치, 최적화 바이러스 검색과 최소
				시스템 자원의 사용 <br> <span class="glyphicon glyphicon-ok"></span>
				강력하고 상호 운영 가능한 기술을 통해 가장 신속한 대응을 실현한 백신소프트웨어 <br> <span
					class="glyphicon glyphicon-ok"></span> 업데이트 시간의 단축으로, 어떤 환경에서도 서버
				가동에 무리를 주지 않습니다. <br> <span class="glyphicon glyphicon-ok"></span>
				향상된 사용자 인터페이스를 통해 4 가지 핵심 구성 영역에 쉽게 액세스 할 수 있습니다.

			</p>
			<p class="more2">
				<a href="/CustomerService/QnA/QnA.mwav?mode=qaForm"><strong>Learn
						more</strong></a><i class="fa fa-angle-right" aria-hidden="true"></i>
			</p>
		</div>
		<div class="enter visible-xs"></div>
	</div>

</div>