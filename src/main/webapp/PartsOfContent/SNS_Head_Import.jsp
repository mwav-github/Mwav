<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--bing 인증 --%>
<meta name="msvalidate.01" content="0FE30DF009A686534424BAC0EBB34813" />
<%--네이버 인증 --%>
<meta name="naver-site-verification" content="ec4a8405c82d31675b6464471b2bc4b3a2be1913"/>
<%--페이스북 인증 --%>
<meta property="fb:app_id" content="956230164513468" />
<%-- 앱아이디 --%>

<%--og:url 기준으로 좋아요 등이 측정된다. 그러나 mwav.net 대표 url 오면 나머지 og 태그도 해당 페이지 기준으로 세팅되므로 현재 url로 세팅해야한다.
https://developers.facebook.com/docs/sharing/webmasters/?locale=ko_KR 
<meta property="og:url" content="http://www.mwav.net/board/bnsView.mwav?pgl=10001001&bNews_id=100009#news_top" />--%>
<%-- 웹 사이트의 제목 --%>
<meta property="og:type" content="website" />
<meta property="og:site_name" content="Mwav.net" />
<meta property="og:type" content="website"/>
<meta property="og:locale" content="ko_KR" />
<%-- 트위터 카드 summary는 웹페이지에 대한 요약정보를 보여주는 카드로 우측에 썸네일을 보여주고 그 옆에 페이지의 제목과 요약 내용을 보여준다.--%>
<meta name="twitter:card" content="summary" /> 
<c:choose>
	<c:when test="${not empty requestScope.metaData}">
		<meta property="og:image" content="${requestScope.metaData.thumbnail}" />
		<meta name="twitter:image" content="${requestScope.metaData.thumbnail }" />
		<c:if test="${requestScope.metaData.title ne null}">
			<meta property="og:title" content="${requestScope.metaData.title }" />
			<%-- 트위터 카드에 나타날 웹 사이트의 제목 --%>
			<meta name="twitter:title" content="${requestScope.metaData.title }" />

		</c:if>
		
		<c:if test="${requestScope.metaData.title eq null}">
			<meta property="og:title"
				content="Turning Data Into Insights-How to use Data Visualization for Storytelling" />
			<meta name="twitter:title"
				content="Turning Data Into Insights-How to use Data Visualization for Storytelling" />
		</c:if>

		<%--  페이지 설명 
		트위터의 경우 없는 경우 생략되나, 페이스북의 경우 없는 경우 <meta id="metaDescription" name="description"에서 찾는다.--%>
		<c:if test="${requestScope.metaData.description ne null}">
			<meta property="og:description"
				content="${requestScope.metaData.description }" />
			<%-- 카드에 나타날 요약 설명 --%>
			<meta name="twitter:description"
				content="${requestScope.metaData.description }" />
		</c:if>
		
		<c:if test="${requestScope.metaData.title eq null}">
			<meta property="og:description"
				content="데이터를 사용하여 전달하려는 내용을 쉽게 설명하고, 역동적이고 설득력 있는 데이터스토리텔링을 위한 시각화 방법." />
			<%-- 카드에 나타날 요약 설명 --%>
			<meta name="twitter:description"
				content="데이터를 사용하여 전달하려는 내용을 쉽게 설명하고, 역동적이고 설득력 있는 데이터스토리텔링을 위한 시각화 방법." />		
		</c:if>
	</c:when>
	<c:otherwise>
		<meta property="og:image"
			content="http://www.mwav.net/Images/CompanyLogos/CompanyLogo.jpg" />
		<%--트위터 --%>
		<meta name="twitter:image"
			content="http://www.mwav.net/Images/CompanyLogos/CompanyLogo.jpg" />
	</c:otherwise>
</c:choose>

<%-- 트위터 카드를 사용하는 표시하고싶은URL --%>
<meta name="twitter:url" content="http://www.mwav.net" />
<%--<meta name="twitter:description" content="C.m.A API 이야기,API,OPEN API,XML,PHP,MYSQL,Jvascript,Html,chongmoa.com,홈페이지,cms,쇼핑몰,큐알코드생성,QR Code Generator,IP Address Lookup,유닉스타임변환,Unix Timestamp Converter,유닉스타임을 날짜로 변환,Unix timestamp to DateTime" />  트위터 카드에 나타날 요약 설명 --%>
<meta name="twitter:site" content="@mwavnet" />
<%-- 트위터 카드에 사이트 배포자 트위터아이디 --%>
<meta name="twitter:creator" content="@mwavnet" />
<%-- 트위터 카드에 배포자 트위터아이디 --%>
<%--페이스북 카카오톡 구글 플러스 추적(스크랩가능여부) : https://developers.facebook.com/tools/debug/  --%>

<c:choose>
	<c:when test="${requestScope.metaData.keywords eq null }">
		<meta id="metaKeywords" name="keywords"
			content="Digital Marketing, E-Consulting, IT Consulting, WebSite Building, Cloud, AI, MR, VR, AR, IoT Platform, Deep Learning, Agile, DevOps, Domain, Web Hosting, Server Hosting, Hosting, HomePage, IT Solution, IT Product, DataBase, Maintenance, EC, Shopping Mall, Web Mail, News Solution, 디지털마케팅, E-컨설팅, IT컨설팅, 웹사이트 제작, 클라우드, 인공지능, 증강현실, 혼합현실, 가상현실, IOT 플랫폼, 딥 러닝, 에자일, 데브옵스, 도메인, 웹호스팅, 서버호스팅, 호스팅, 홈페이지, 웹사이트, 솔루션개발, 데이터베이스, 유지보수, 전자상거래, 쇼핑몰, 웹메일, 뉴스솔루션" />
	</c:when>
	<c:otherwise>
		<meta id="metaKeywords" name="keywords"
			content="${requestScope.metaData.keywords }" />
	</c:otherwise>
</c:choose>
<meta id="metaDescription" name="description"
	content="This is the website for Mwav.net. We are an IT development company possessing total E-Commerce platform based on the fancy technologies. You can contact at https://www.mwav.net/CustomerService/QnA/QnA.mwav?mode=qaForm if you have a question or an inquiry on the site." />
<meta name="Owner" content="Mwav.net" />
<meta name="Author" content="Zeus, Peter J." />
<meta name="copyright" content="All contents are copyright by Mwav.net" />
<meta name="distribution" content="global" />
<link rel="icon" href="/Images/CompanyLogos/CompanyLogo.ico" />
<title><c:choose>
		<c:when test="${metaData.title eq null }">[Mwav.net] >> Unleash your infinite possibilities with IT Optimization!!</c:when>
		<c:otherwise>${metaData.mainTitle }</c:otherwise>
	</c:choose></title>