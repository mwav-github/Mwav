package net.mwav.common.module;

import java.io.IOException;
import java.lang.reflect.Field;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.common.Interceptor.StatisticsInterceptor;
import net.common.common.CommandMap;
import net.mwav.member.vo.Member_tbl_VO;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.log4j.Category;
import org.apache.log4j.Logger;

public class Common_Utils {
	protected static Log log = LogFactory.getLog(Common_Utils.class);

	private static String pattern = "[a-zA-Z0-9]+$";
	private static StringBuffer returnString = null;

	public static void main(String[] args) {
		Common_Utils rndStr = new Common_Utils();

		System.out.println("[랜덤 문자열]");
		System.out.println("숫자 (50자리) : " + rndStr.getString(50, "1"));
		System.out.println("대문자 (16자리) : " + rndStr.getString(16, "A"));
		System.out.println("소문자 (16자리) : " + rndStr.getString(16, "a"));
		System.out.println("대문자 + 숫자 (32자리) : " + rndStr.getString(32, "A1"));
		System.out.println("소문자 + 숫자 (32자리) : " + rndStr.getString(32, "a1"));
		System.out.println("대문자 + 소문자 + 숫자 (32자리) : " + rndStr.getString(15, ""));
	}

	// Overload Constructor
	public Common_Utils() {
		returnString = new StringBuffer();
	}

	public Common_Utils(int len) {
		returnString = new StringBuffer();
		this.setLength(len);
	}

	public Common_Utils(String type) {
		returnString = new StringBuffer();
		this.setType(type);
	}

	public Common_Utils(int len, String type) {
		returnString = new StringBuffer();
		this.setLength(len);
		this.setType(type);
	}

	public Common_Utils(String type, int len) {
		returnString = new StringBuffer();
		this.setType(type);
		this.setLength(len);
	}

	// Get Random Character
	private static void getRndChar() {
		int r = (int) Math.round(Math.random() * 1000);

		java.util.Random random = new java.util.Random();
		int rnd = random.nextInt(1000);

		if (test(pattern, String.valueOf((char) rnd))) {
			returnString.append((char) rnd);
		} else {
			getRndChar();
		}
	}

	// Regular Express Check Function
	private static boolean test(String pattern, String value) {
		java.util.regex.Pattern p = java.util.regex.Pattern.compile(pattern);
		java.util.regex.Matcher m = p.matcher(value);
		boolean r = m.matches();

		return r;
	}

	// Set String Length
	public void setLength(int len) {
		returnString.setLength(0);
		for (int i = 0; i < Math.abs(len); i++) {
			getRndChar();
		}
	}

	// Set String Pattern Type
	public void setType(String type) {
		if (type.equals("1"))
			pattern = "[0-9]+$";
		else if (type.equals("A"))
			pattern = "[A-Z]+$";
		else if (type.equals("a"))
			pattern = "[a-z]+$";
		else if (type.equals("A1"))
			pattern = "[A-Z0-9]+$";
		else if (type.equals("a1"))
			pattern = "[a-z0-9]+$";
		else
			pattern = "[a-zA-Z0-9]+$";
	}

	// Get Random String
	public String getString() {
		return returnString.toString();
	}

	// Overload getString()
	public String getString(int len, String type) {
		this.setType(type);
		this.setLength(len);
		return this.getString();
	}

	// 접속 IP 확인
	/*
	 * 접속하는 클라이언트의 아이피를 확인 하려면 HttpServletRequest 객체에서 가져와서 확인하면 된다.
	 * request.getRemoteAddr() ; 그러나 프록시나 Load Balancer 같은것을 겨쳐 오게 되는 경우 위의 방법으로는
	 * 정확한 아이피를 가져 오지 못하게 된다.
	 * 
	 * URL : http://apieceofspace.blogspot.kr/2014/01/jsp.html
	 * https://www.lesstif.com/pages/viewpage.action?pageId=20775886 (참고)
	 */
	public String getClientIP(HttpServletRequest request) {

		String ip = request.getHeader("X-Forwarded-For");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_CLIENT_IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip;

	}

	// map 객체 뿌려주는 메소드

	public void selectCommandMapList(CommandMap commandMap) {
		if (commandMap.isEmpty() == false) {
			System.out.println("들어옴");
			Iterator<Entry<String, Object>> iterator = commandMap.getMap().entrySet().iterator();
			Entry<String, Object> entry = null;
			while (iterator.hasNext()) {
				entry = iterator.next();
				log.debug("key : " + entry.getKey() + ",\tvalue : " + entry.getValue());
				System.out.println("key : " + entry.getKey() + ",\tvalue : " + entry.getValue());
			}
		}
	}

	public void selectMap(Map<String, Object> map) {
		if (map.isEmpty() == false) {
			System.out.println("들어옴");
			Iterator<Entry<String, Object>> iterator = map.entrySet().iterator();
			// map.entryset vs mapkeySet 차이 찾아보기
			Entry<String, Object> entry = null;
			while (iterator.hasNext()) {
				entry = iterator.next();
				log.debug("key : " + entry.getKey() + ",\tvalue : " + entry.getValue());
				System.out.println("key : " + entry.getKey() + ",\tvalue : " + entry.getValue());
			}
		}
	}

	public void selectMapList(List<Map<String, Object>> mapList) {
		Iterator<Entry<String, Object>> iterator = null;
		Entry<String, Object> entry = null;
		log.debug("--------------------printList--------------------\n");
		int listSize = mapList.size();
		for (int i = 0; i < listSize; i++) {
			log.debug("list index : " + i);
			iterator = mapList.get(i).entrySet().iterator();
			while (iterator.hasNext()) {
				entry = iterator.next();
				log.debug("key : " + entry.getKey() + ",\tvalue : " + entry.getValue());
			}
			log.debug("\n");
		}
		log.debug("------------------------------------------------\n");
	}

	// Overload getString()
	public String TypeIntToString(String type, int before) {

		String result = null;
		if (type == "board") {
			if (before == 0) {
				result = "삭제완료.";
			} else if (before == 1) {
				result = "임시저장.";
			} else if (before == 2) {
				result = "공지완료.";
			}

		}
		return result;
	}

	/**
	 * null체크
	 *
	 * @param object 객체
	 * @return null 여부 true : null false : null이 아님.
	 * 
	 *         이슈 최초 입력되는 타입에 대한 확인 후 변형되어야한다 최초 입력되는 타입을 어떻게 할지 부분 고민
	 */
	public static boolean isEmpty(Object obj) {
		if (obj == null || obj.toString().equals("")) {
			return true;
		}
		return false;
	}

	/**
	 * 접근자 구분하기
	 *
	 * @param request 객체
	 * @return yyyy년MM월dd일 HH시mm분ss초
	 * 
	 *         이슈 최초 입력되는 타입에 대한 확인 후 변형되어야한다 최초 입력되는 타입을 어떻게 할지 부분 고민
	 */
	@SuppressWarnings("unused")
	public static Map<String, Object> typeToChar(HttpServletRequest request) {
		char type = 0;

		System.out.println("들어왔다.");
		Map<String, Object> map = new HashMap<String, Object>();

		String key = null;

		HttpSession session = request.getSession();
		CookieBox cookieBox = new CookieBox(request);
		Member_tbl_VO Member;

		try {

			// 관리자영역
			if (request.getParameter("staff") != null) {
				type = 'S';
				key = request.getParameter("staff");
				log.info("staff은 request 값");
			} else if ((String) session.getAttribute("staff") != null) {
				type = 'S';
				key = (String) session.getAttribute("staff");
				log.info("staff은 세션값");
			} else if (cookieBox.isExist("staff")) {
				type = 'S';
				key = cookieBox.getValue("staff");
				log.info("staff은 쿠키값");
			}

			// 파트너영역
			else if (request.getParameter("partner") != null) {
				type = 'A';
				key = request.getParameter("partner");
				log.info("partner은 request 값");
			} else if ((String) session.getAttribute("partner") != null) {
				type = 'A';
				key = (String) session.getAttribute("partner");
				log.info("partner은 세션값");
			} else if (cookieBox.isExist("partner")) {
				type = 'A';
				key = cookieBox.getValue("partner");
				log.info("partner은 쿠키값");
			}
			// 회원영역
			else if (request.getParameter("member") != null) {
				type = 'M';
				key = request.getParameter("member");

				log.info("member은 request 값");
			} else if ((Member_tbl_VO) session.getAttribute("member") != null) {
				type = 'M';
				Member = (Member_tbl_VO) session.getAttribute("member");
				key = String.valueOf(Member.getMember_id());
				log.info("member은 세션값");
			} else if (cookieBox.isExist("member")) {
				type = 'M';
				key = cookieBox.getValue("member");
				log.info("member은 쿠키값");
			}
			// 프로모터 영역
			else if (request.getParameter("pgl") != null) {
				type = 'P';
				key = request.getParameter("pgl");
				log.info("pgl은 request 값");
			} else if ((String) session.getAttribute("pgl") != null) {
				type = 'P';
				key = (String) session.getAttribute("pgl");
				log.info("pgl은 세션값");
			} else if (cookieBox.isExist("pgl")) {
				type = 'P';
				key = cookieBox.getValue("pgl");
				log.info("pgl은 쿠키값");
			} else {
				type = 'N';

			}
			// 지금구조는 마지막에 있는 놈이 될 수 밖에없다.
			map.put("type", type);
			map.put("value", key);

		}

		catch (Exception e) {
			e.printStackTrace();
		}

		return map;
	}

	/**
	 * 자바 dateformat 변경하기 String expectedPattern = "yyyyMMddkkmmss";
	 *
	 * @param textDate ex) 20141219093040
	 * @return yyyy년MM월dd일 HH시mm분ss초
	 * 
	 *         이슈 최초 입력되는 타입에 대한 확인 후 변형되어야한다 최초 입력되는 타입을 어떻게 할지 부분 고민
	 */
	public static String convertStringToDateFormat(String textDate, String type) {
		String dateString = null;
		String type_dateFormat = null;
		try {
			if (type.equals("1")) {
				type_dateFormat = "yyyyMMddhhmmss";
			} else if (type.equals("2")) {
				type_dateFormat = "yyyyMMdd";
			} else if (type.equals("3")) {
				type_dateFormat = "yyyy년MM월dd일 HH시mm분ss초";
			} else if (type.equals("4")) {
				type_dateFormat = "yyyy-MM-dd hh:mm:ss";
			} else if (type.equals("5")) {
				type_dateFormat = "yyyyMMddhhmmss";
			} else {
				type_dateFormat = "yyyy-MM-dd";
			}

			SimpleDateFormat format1 = new SimpleDateFormat(type_dateFormat);
			Date date = format1.parse(textDate);
			dateString = format1.format(date);

			// 현재 날짜 구하기
			// 자바의 String 형을 날짜로 변환하여 오늘의 날짜와의 차이를 구하려고 합니다.
			/*
			 * String todate= formatter.format(new Date());
			 * 
			 * 
			 * log.info("현재시간 년월일 = " + todate01); log.info("현재시간 년월일 = " + todate02);
			 * log.info("현재시간 년월일 = " + todate03);
			 * 
			 * String testDate = "20160421"; Date todate_date = formatter03.parse(todate03);
			 * Date test_date = formatter03.parse(testDate);
			 * 
			 * log.info(todate_date + "====== " + test_date); long diff =
			 * todate_date.getTime() - test_date.getTime(); // 시간차이를 시간,분,초를 곱한 값으로 나누면 하루
			 * 단위가 나옴 long diffDays = diff / (24 * 60 * 60 * 1000);
			 * 
			 * log.info("날짜계산차이 : " + diff); log.info("일차이 : " + diffDays);
			 * log.info("년차이 : " + diffDays / 365);
			 */

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return dateString;
	}

	/**
	 * 자바 string 치환하기
	 * 
	 * @param String textData 대상 문자열
	 * @return result 치환된 문자열
	 * 
	 */
	public static List<String> convertStringToMark(List<String> selectIdFinder) {

		for (int i = 0; i < selectIdFinder.size(); i++) {

			int txt_length = selectIdFinder.get(i).length();
			int start_point = ((txt_length / 2) - 1);
			int end_point = ((txt_length / 2) + 1);

			String imsi_textData = selectIdFinder.get(i);
			String extract_textData = null;
			String result = null;

			if (txt_length >= 7) {
				// 7자리 이상이면 3개이상 변환

				extract_textData = imsi_textData.substring(start_point - 1, end_point);
				result = selectIdFinder.get(i).replace(extract_textData, "****");

			} else {
				// 7자리 이하이면 2개변환
				extract_textData = imsi_textData.substring(start_point, end_point);
				result = selectIdFinder.get(i).replace(extract_textData, "***");

			}
			System.out.println("dd" + result);
			selectIdFinder.set(i, result);
		}
		return selectIdFinder;
	}

	// get request headers
	public Map<String, Object> getHeadersInfo(HttpServletRequest request) {

		Map<String, Object> map = new HashMap<String, Object>();

		Enumeration headerNames = request.getHeaderNames();
		while (headerNames.hasMoreElements()) {
			String key = (String) headerNames.nextElement();
			String value = (String) request.getHeader(key);
			map.put(key, value);
		}

		// User-agent 분석
		String browserDetails = request.getHeader("User-Agent");
		String userAgent = browserDetails;
		String user = userAgent.toLowerCase();

		String os = "";
		String browser = "";

		log.info("User Agent for the request is===>" + browserDetails);
		System.out.println("User Agent for the request is===>" + browserDetails);
		// =================OS=======================
		if (userAgent.toLowerCase().indexOf("windows") >= 0) {
			os = "Windows";
		} else if (userAgent.toLowerCase().indexOf("mac") >= 0) {
			os = "Mac";
		} else if (userAgent.toLowerCase().indexOf("x11") >= 0) {
			os = "Unix";
		} else if (userAgent.toLowerCase().indexOf("android") >= 0) {
			os = "Android";
		} else if (userAgent.toLowerCase().indexOf("iphone") >= 0) {
			os = "IPhone";
		} else {
			os = "UnKnown, More-Info: " + userAgent;
		}
		// ===============Browser===========================
		if (user.contains("msie")) {
			String substring = userAgent.substring(userAgent.indexOf("MSIE")).split(";")[0];
			browser = substring.split(" ")[0].replace("MSIE", "IE") + "-" + substring.split(" ")[1];
		} else if (user.contains("safari") && user.contains("version")) {
			browser = (userAgent.substring(userAgent.indexOf("Safari")).split(" ")[0]).split("/")[0] + "-"
					+ (userAgent.substring(userAgent.indexOf("Version")).split(" ")[0]).split("/")[1];
		} else if (user.contains("opr") || user.contains("opera")) {
			if (user.contains("opera"))
				browser = (userAgent.substring(userAgent.indexOf("Opera")).split(" ")[0]).split("/")[0] + "-"
						+ (userAgent.substring(userAgent.indexOf("Version")).split(" ")[0]).split("/")[1];
			else if (user.contains("opr"))
				browser = ((userAgent.substring(userAgent.indexOf("OPR")).split(" ")[0]).replace("/", "-"))
						.replace("OPR", "Opera");
		} else if (user.contains("chrome")) {
			browser = (userAgent.substring(userAgent.indexOf("Chrome")).split(" ")[0]).replace("/", "-");
		} else if ((user.indexOf("mozilla/7.0") > -1) || (user.indexOf("netscape6") != -1)
				|| (user.indexOf("mozilla/4.7") != -1) || (user.indexOf("mozilla/4.78") != -1)
				|| (user.indexOf("mozilla/4.08") != -1) || (user.indexOf("mozilla/3") != -1)) {
			// browser=(userAgent.substring(userAgent.indexOf("MSIE")).split("
			// ")[0]).replace("/",
			// "-");
			browser = "Netscape-?";

		} else if (user.contains("firefox")) {
			browser = (userAgent.substring(userAgent.indexOf("Firefox")).split(" ")[0]).replace("/", "-");
		} else if (user.contains("rv")) {
			browser = "IE";
		} else {
			browser = "UnKnown, More-Info: " + userAgent;
		}
		log.info("Operating System======>" + os);
		log.info("Browser Name==========>" + browser);
		map.put("os", os);
		map.put("browser", browser);
		return map;
	}

	// 인코딩 종류 확인
	public String encoding(String parameter) throws IOException {
		String search_parameter = parameter.toString();
		String result = null;
		if (search_parameter != null && search_parameter != "") {
			String charset[] = { "KSC5601", "8859_1", "ascii", "UTF-8", "EUC-KR", "MS949" };

			System.out.println("Not convert charset : " + search_parameter + "<br>");
			for (int i = 0; i < charset.length; i++) {
				for (int j = 0; j < charset.length; j++) {
					if (i == j) {
						continue;
					} else {
						result = new String(search_parameter.getBytes(charset[i]), charset[j]);
						System.out.println(charset[i] + " : " + charset[j] + " :" + result + "<br>");
					}
				}
			}
		}

		System.out.println("========여기까지 인코딩의 종류이다.=========");
		return result;
	}

	/*
	 * http://erictus.tistory.com/entry/Map-to-Object-%EC%99%80-Object-to-Map
	 * 
	 * Object를 Map으로 변경해주는 ObjectUtil!! 1. getDeclaredFields()를 통해 선언되어있는 필드를 가져온후
	 * Loop돌며 2. Field.setAccessible(true)를 통해 private 필드접근을 가능하도록 한다. 3. 그담엔? 필드명을
	 * Key로하고 값을 저장하여 Map을 뱉어내면 끝~!!
	 */
	public static Map ConverObjectToMap(Object obj) {
		try {
			// Field[] fields = obj.getClass().getFields(); //private field는 나오지
			// 않음.
			Field[] fields = obj.getClass().getDeclaredFields();
			Map resultMap = new HashMap();
			for (int i = 0; i <= fields.length - 1; i++) {
				fields[i].setAccessible(true);
				resultMap.put(fields[i].getName(), fields[i].get(obj));
			}
			return resultMap;
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static String setPageName(String urlPath) {

		String url = null;
		url = urlPath;
		String slPageName = null;
		String url_1depth = null;
		String url_2depth = null;
		String last_depth = null;
		int first_slash = url.indexOf("/");
		int second_slash = url.indexOf("/", first_slash + 1);
		int third_slash = url.indexOf("/", second_slash + 1);
		// int fourth_slash = url.indexOf("/", third_slash + 1);
		// int last_slash = url.lastIndexOf("/");
		int last_slash = url.lastIndexOf("/");
		int lastDot = url.lastIndexOf('.');

		try {

			if (second_slash != -1) {
				url_1depth = url.substring(first_slash + 1, second_slash);
				log.info("url_1depth" + url_1depth);
			}
			if (third_slash != -1) {
				url_2depth = url.substring(second_slash + 1, third_slash);
				log.info("url_2depth" + url_2depth);
			}
			if (lastDot != -1) {
				last_depth = url.substring(last_slash + 1, lastDot);
				// System.out.println("last_depth"+last_depth);
			}

			// url 은 전체 url_1depth은 /제외
			if (url != null && url_1depth != null && (url.equals("/") || url_1depth.equals("Index"))) {
				slPageName = "메인페이지";
			} else if (url_1depth != null && url_1depth.equals("Company")) {
				// 회사 색션.'
				// url_2depth.equals -> contains으로 변경 언제가 마지막 / 일지 모른다.
				// 즉 /Company/ITTrends/ITTrends 등 마지막 단계가 어딘지.
				// url_2depth.equals로 하게되면.
				if (url.contains("ActualResults")) {
					slPageName = "회사실적";
				} else if (url.contains("BusinessField")) {
					slPageName = "사업분야";
				} else if (url.contains("Certificates")) {
					slPageName = "회사인증서";
				} else if (url.contains("Cooperation")) {
					slPageName = "제휴업체";
				} else if (url.contains("Greetings")) {
					slPageName = "대표인사말";
				} else if (url.contains("History")) {
					slPageName = "회사연혁";
				} else if (url.contains("HR-Affairs")) {
					slPageName = "인사채용정보";
				} else if (url.contains("Introduction")) {
					slPageName = "회사소개";
				} else if (url.contains("LocationMap")) {
					slPageName = "회사약도";
				} else if (url.contains("MgrPhilosophy")) {
					slPageName = "경영이념";
				} else if (url.contains("Organization")) {
					slPageName = "회사조직도";
				} else if (url.contains("Profitsharing")) {
					slPageName = "수익분배 프로그램";
				} else if (url.contains("ITTrends")) {
					slPageName = "언론보도";
				} else if (url.contains("Vision")) {
					slPageName = "경영기념(비전)";
				} else {
					// 문자열 자르는것은 추후 모듈화
					// slPageName 의 경우 varchar(50)
					if (url.length() > 35) {
						url = url.substring(0, 34);
					}
					slPageName = "Company_미정_" + url;

				}
				// URL 변경시 변동 필요.
			} else if (url_1depth != null && url_1depth.equals("CompanyItem")) {
				if (url_2depth.equals("ITSolutions")) {
					if (url.contains("OrgChart")) {
						slPageName = "OrgChart";
					} else if (url.contains("Aervision")) {
						slPageName = "Aervision";
					} else {
						slPageName = "기타";
					}
				} else if (url_2depth.equals("ITProducts")) {
					if (url.contains("Azure")) {
						slPageName = "Azure";
					} else if (url.contains("HighSofts")) {
						slPageName = "HighSofts";
					} else if (url.contains("InsWave")) {
						slPageName = "InsWave";
					} else if (url.contains("MSOffice")) {
						slPageName = "MSOffice";
					} else if (url.contains("OpenSRS")) {
						slPageName = "OpenSRS";
					} else if (url.contains("Windows")) {
						slPageName = "Windows";
					} else if (url.contains("Aervision")) {
						slPageName = "Aervision";
					} else if (url.contains("vanillaNAV")) {
						slPageName = "vanillaNAV";
					} else if (url.contains("QuickHeal")) {
						slPageName = "QuickHeal";
					} else {
						slPageName = "기타";
					}
				} else if (url_2depth.equals("WebSiteBuilding")) {
					slPageName = "웹사이트제작";
				} else if (url_2depth.equals("DigitalMarketing")) {
					slPageName = "디지털마케팅";
				} else if (url_2depth.equals("ITConsulting")) {
					slPageName = "IT컨설팅";
				} else {
					if (url.length() > 30) {
						url = url.substring(0, 29);
					}
					slPageName = "CompanyItem_미정_" + url;
				}
			} else if (url_1depth != null && url_1depth.equals("CustomerService")) {
				if (url.contains("Agreement")) {
					slPageName = "이용약관";
				} else if (url.contains("Announcement")) {
					slPageName = "안내발표(공지사항)";
				} else if (url.contains("ClientFTP")) {
					slPageName = "고객FTP";
				} else if (url.contains("ClientPDS")) {
					slPageName = "고객자료실";
				} else if (url.contains("Contact")) {
					slPageName = "담당부서안내";
				} else if (url.contains("FAQ")) {
					slPageName = "자주하는 질문";
				} else if (url.contains("MemberShip")) {
					slPageName = "회원정보";
				} else if (url.contains("MyPage")) {
					slPageName = "마이페이지";
				} else if (url.contains("Policy")) {
					slPageName = "회사정책";
				} else if (url.contains("RejectMail")) {
					slPageName = "메일수신거부";
				} else if (url.contains("SiteGuide")) {
					slPageName = "이용방법";
				} else if (url.contains("SiteMap")) {
					slPageName = "사이트맵";
				} else if (url.contains("Summary")) {
					slPageName = "CS요약";
				} else {
					// 문자열 자르는것은 추후 모듈화
					// slPageName 의 경우 varchar(50)
					if (url.length() > 28) {
						url = url.substring(0, 27);
					}
					slPageName = "CustomerService_미정_" + url;
				}
			} else if (url_1depth != null && (url_1depth.equals("MasterPage") || url_1depth.equals("MasterPage_1"))) {
				if (url.contains("mode=SMbrLogin")) {
					slPageName = "로그인페이지";
				} else if (url.contains("mode=Default")) {
					slPageName = "약관동의";
				} else if (url.contains("mode=SMbrInput")) {
					slPageName = "회원정보입력";
				} else if (url.contains("mode=SDMbrInput")) {
					slPageName = "가입완료";
				} else {
					// 문자열 자르는것은 추후 모듈화
					// slPageName 의 경우 varchar(50)
					if (url.length() > 35) {
						url = url.substring(0, 34);
					}
					slPageName = "MasterPage_미정_" + url;
				}
			} else if (url_1depth != null && url_1depth.equals("member")) {
				if (url.contains("mbrTempLoginPwUpdate")) {
					slPageName = "패스워드찾기(비밀번호 초기화)";
				} else if (url.contains("Login")) {
					slPageName = "로그인시도";
				} else if (url.contains("mbrTempLoginPwSeek ")) {
					slPageName = "패스워드찾기(비밀번호 조회)";
				} else if (url.contains("mbrLoginPwUpdate")) {
					slPageName = "패스워드찾기(비밀번호 업데이트)";
				} else if (url.contains("mbrLoginIdSeek")) {
					slPageName = "아이디찾기(아이디조회)";
				} else {
					// 문자열 자르는것은 추후 모듈화
					// slPageName 의 경우 varchar(50)
					if (url.length() > 37) {
						url = url.substring(0, 36);
					}
					slPageName = "member_미정_" + url;
				}
			} else if (url_1depth != null && url_1depth.equals("qa")) {

				slPageName = "qa_미정_" + url;

			} else if (url_1depth != null && url_1depth.equals("login")) {
				if (url.contains("post")) {

					slPageName = "로그인 완료";
				}
			} else if (url_1depth != null && url_1depth.equals("admins")) {

				slPageName = "관리자" + url;

			} else if (url_1depth != null && url_1depth.equals("board")) {
				if (url.contains("bnsList")) {
					slPageName = "뉴스목록";
				} else if (url.contains("buView")) {
					slPageName = "뉴스조회";
				} else if (url.contains("buList")) {
					slPageName = "공지목록";
				} else if (url.contains("buView")) {
					slPageName = "공지사항조회";
				}
			}

			// 예외 발생 부분.
			else if (url_1depth != null && url_1depth.equals("MessageView")) {
				if (url.contains("throwable")) {
					slPageName = "에러(최상위)";
				} else if (url.contains("exception")) {
					slPageName = "예외";
				} else if (url.contains("400")) {
					slPageName = "에러(400)";
				} else if (url.contains("401")) {
					slPageName = "에러(401)";
				} else if (url.contains("403")) {
					slPageName = "에러(403)";
				} else if (url.contains("404")) {
					slPageName = "에러(404)";
				} else if (url.contains("500")) {
					slPageName = "에러(500)";
				} else if (url.contains("503")) {
					slPageName = "에러(503)";
				} else {
					// 문자열 자르는것은 추후 모듈화
					// slPageName 의 경우 varchar(50)
					if (url.length() > 39) {
						url = url.substring(0, 38);
					}
					slPageName = "에러_미정_" + url;
				}
			}
			// 서블릿 거치는 부분, Admin
			else {
				// statistics_tbl 의 PageName 은 null 이 허용안된다.
				// 문자열 자르는것은 추후 모듈화
				// slPageName 의 경우 varchar(50)
				if (url.length() > 44) {
					url = url.substring(0, 43);
				}
				slPageName = "기타_" + url;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return slPageName;
	}

	/** 
	 * @method name : setMetaData
	 * @author : (정) Lewis
	             (부)
	 * @since  : 2019. 5. 4.
	 * @version : v1.0
	 * @see :
	 * @description :   
	 * @history :
	   ----------------------------------------
	   * Modification Information(개정이력)
	   ----------------------------------------
	           수정일                    수정자                  수정내용
	   --------       --------    ----------------
	     2019. 5. 4.  jusun       
	 * @param : url 
	 * @param : metaData
	 * @return : meta
	 * @throws : IllegalArgumentException 날짜 포맷이 정해진 바와 다를 경우.
	 *           입력 값이 <code>null</code>인 경우.
	 <pre>
	 * {@code : 예제 코드 작성
	 * xxxx.setMetaData(request.getRequestURI(), (Map<String, Object>) request.getAttribute("boardMetaData"))  = "19810916"
	 * } 
	 </pre>
	*/
	public static Map<String, Object> setMetaData(String url, Map<String, Object> metaData) {

		Map<String, Object> map = new HashMap<String, Object>();

		//URL 
		int first_slash = url.indexOf("/");
		int second_slash = url.indexOf("/", first_slash + 1);
		int third_slash = url.indexOf("/", second_slash + 1);
		int fourth_slash = url.indexOf("/", third_slash + 1);
		int last_slash = url.lastIndexOf("/");
		int lastDot = url.lastIndexOf('.');

		String url_1depth = null;
		String url_2depth = null;
		String url_3depth = null;
		String last_depth = null;
		
		if (second_slash != -1) {
			url_1depth = url.substring(first_slash + 1, second_slash);
		}
		if (third_slash != -1) {
			url_2depth = url.substring(second_slash + 1, third_slash);
		}
		if (fourth_slash != -1) {
			url_3depth = url.substring(third_slash + 1, fourth_slash);
		}
		if (lastDot != -1) {
			last_depth = url.substring(last_slash + 1, lastDot);
		}

		// 두개 모두 지정해줘야 NULLPOINTEREXCEPTION 안남.
		if (url_1depth == null) {
			url_1depth = "/";
		}

		if (last_depth == null) {
			last_depth = "/";
		}

		String set_Title = null;

		// 캐치프레이즈라고 한다.
		String main_Title = "hihi your infinite possibilities with IT Optimization!!";
		String aervision_Title = "Biometric authentication & computer vision & machine learning";

		
		String keywords_default = "Digital Marketing, E-Consulting, IT Consulting, WebSite Building, Cloud, AI, MR, VR, ARIoT Platform, Deep Learning, Agile, DevOps, Domain, Web Hosting, Server Hosting, Hosting, HomePage, IT Solution, IT Product, DataBase, Maintenance, EC, Shopping Mall, Web Mail, News Solution, 디지털마케팅, E-컨설팅, IT컨설팅, 웹사이트 제작, 클라우드, 인공지능, 증강현실, 혼합현실, 가상현실, IOT 플랫폼, 딥 러닝, 에자일, 데브옵스, 도메인, 웹호스팅, 서버호스팅, 호스팅, 홈페이지, 웹사이트, 솔루션개발, 데이터베이스, 유지보수, 전자상거래, 쇼핑몰, 웹메일, 뉴스솔루션";
		String keywords = null;
		
		//
		String thumbnail = null;
		
		String description = null;

		// 대분류 안에 소분류로 !
		StringLib stringLib = StringLib.getInstance();
		if (!(stringLib.isEmpty(metaData))) {
			main_Title = "[Mwav.net] >> [" + url_1depth + " > " + last_depth + "] - " + (String) metaData.get("title");
			set_Title = (String) metaData.get("title");
			description = (String) metaData.get("description");
			thumbnail = (String) metaData.get("thumbnail");
			keywords = (String) metaData.get("newsKeyword") + " " + keywords_default;

			System.out.println("thumbnail"+thumbnail);
			System.out.println("keywords "+keywords);
		} else {
			description = "This is the website for Mwav.net. We are an IT development company possessing total E-Commerce platform based on the fancy technologies. You can contact at https://www.mwav.net/CustomerService/Contact/Contact.mwav?modal=Q&A if you have a question or an inquiry on the site.";
			thumbnail = "https://www.mwav.net/Images/CompanyLogos/CompanyLogo_L.jpg";

			if (url_1depth.equals("Company")) {
				set_Title = "[Mwav.net] >> [" + url_1depth + " > " + last_depth + "] - " + main_Title;

			} else if (url_1depth.equals("CustomerService")) {
				url_1depth = "CS";
				set_Title = "[Mwav.net] >> [" + url_1depth + " > " + last_depth + "] - " + main_Title;

			} else if (url_1depth.equals("hightsofts") && url_2depth.equals("hightsofts")) {
				url_1depth = "CS";
				set_Title = "[Mwav.net] >> [HightSofts] - " + main_Title;
				keywords = "Highcharts, Highstock, Highmaps, " + keywords_default;

			} else if (url_1depth.equals("CompanyItem")) {
				// 여기는 디지털마케팅 등 포함 2depth로

				if (url_2depth.equals("ITProducts") || url_2depth.equals("ITSolutions")) {
					if (url_3depth.equals("OpenSRS")) {
						set_Title = "[Mwav.net] >> [" + url_3depth + "] - " + main_Title;
						keywords = "SSL, Domains, RapisSSL, " + keywords_default;
					} else if (url_3depth.equals("Aervision")) {
						set_Title = "[Mwav.net] >> [" + url_3depth + "> " + aervision_Title + "] - " + main_Title;

						keywords = "AerPass, AerCrowd, AerPalm, AerID, AerGate, IDMatch, eyeLock, " + keywords_default;

					} else if (url_3depth.equals("OrgChart")) {
						set_Title = "[Mwav.net] >> [" + url_3depth + "] - " + main_Title;

						keywords = "OrgChart Platinum, OrgChart Now, OrgChart Enterprise, OrgChart Pro, "
								+ keywords_default;
					} else if (url_3depth.equals("Azure")) {
						set_Title = "[Mwav.net] >> [" + url_3depth + "] - " + main_Title;

						keywords = "Azure, " + keywords_default;
					} else if (url_3depth.equals("MSOffice")) {
						set_Title = "[Mwav.net] >> [" + url_3depth + "] - " + main_Title;
						keywords = "Word, PowerPoint, Excel, Outlook, " + keywords_default;

					} else if (url_3depth.equals("InsWave")) {
						set_Title = "[Mwav.net] >> [" + url_3depth + "] - " + main_Title;
						keywords = "NewsLetter Solutions, " + keywords_default;

					} else if (url_3depth.equals("Windows")) {
						set_Title = "[Mwav.net] >> [" + url_3depth + "] - " + main_Title;

						keywords = "Windows10, " + keywords_default;
					} else {
						set_Title = "[Mwav.net] >> [" + url_3depth + "] - " + main_Title;
					}
				}
				// 디지털 마케팅 등
				else {
					set_Title = "[Mwav.net] >> [" + url_2depth + " > " + last_depth + "] - " + main_Title;
				}
			} else {
				if (url_1depth.equals("/") && (!"/".equals(last_depth))) {
					set_Title = "[Mwav.net] >> [" + last_depth + "] - " + main_Title;
				} else if (url_1depth.equals("/") && last_depth.equals("/")) {
					set_Title = "[Mwav.net] >> " + main_Title;
				} else {
					// .do 등등 일단은 고객친화적이게 임시 변환
					set_Title = "[Mwav.net] - " + main_Title;
					// System.out.println("열로3");
				}
			}
		}
		log.info("title" + set_Title);
		log.info("keywords" + keywords);
		log.info("description" + description);
		
		map.put("mainTitle", main_Title);
		map.put("title", set_Title);
		map.put("keywords", keywords);
		map.put("description", description);
		map.put("thumbnail", thumbnail);

		return map;
	}

	// Hex Random Color 출력.
	public static String getRandomColor() {
		final Random random = new Random();
		final String[] letters = "0123456789ABCDEF".split("");
		String color = "#";
		for (int i = 0; i < 6; i++) {
			color += letters[Math.round(random.nextFloat() * 15)];
		}
		return color;
	}

}
