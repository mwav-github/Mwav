package net.mwav.common.module;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;

import net.common.common.CommandMap;
import net.common.logger.LoggerInterceptor;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.log4j.Category;
import org.apache.log4j.Logger;

public class Common_Utils {

	protected static Log log = LogFactory.getLog(LoggerInterceptor.class);
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
		System.out.println("대문자 + 소문자 + 숫자 (32자리) : "
				+ rndStr.getString(15, ""));
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
	 * request.getRemoteAddr() ; 그러나 프록시나 Load Balancer 같은것을 겨쳐 오게 되는 경우 위의
	 * 방법으로는 정확한 아이피를 가져 오지 못하게 된다.
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
			Iterator<Entry<String, Object>> iterator = commandMap.getMap()
					.entrySet().iterator();
			Entry<String, Object> entry = null;
			while (iterator.hasNext()) {
				entry = iterator.next();
				log.debug("key : " + entry.getKey() + ",\tvalue : "
						+ entry.getValue());
				System.out.println("key : " + entry.getKey() + ",\tvalue : "
						+ entry.getValue());
			}
		}
	}

	public void selectMap(Map<String, Object> map) {
		if (map.isEmpty() == false) {
			System.out.println("들어옴");
			Iterator<Entry<String, Object>> iterator = map.entrySet()
					.iterator();
			// map.entryset vs mapkeySet 차이 찾아보기
			Entry<String, Object> entry = null;
			while (iterator.hasNext()) {
				entry = iterator.next();
				log.debug("key : " + entry.getKey() + ",\tvalue : "
						+ entry.getValue());
				System.out.println("key : " + entry.getKey() + ",\tvalue : "
						+ entry.getValue());
			}
		}
	}
	
	public void selectMapList(List<Map<String, Object>> mapList) {
		Iterator<Entry<String,Object>> iterator = null;
	    Entry<String,Object> entry = null;
	    log.debug("--------------------printList--------------------\n");
	    int listSize = mapList.size();
	    for(int i=0; i<listSize; i++){
	        log.debug("list index : "+i);
	        iterator = mapList.get(i).entrySet().iterator();
	        while(iterator.hasNext()){
	            entry = iterator.next();
	            log.debug("key : "+entry.getKey()+",\tvalue : "+entry.getValue());
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
				result = "임시저장상태";
			} else if (before == 1) {
				result = "현재공지상태";
			}

		}
		return result;
	}

	// null 체크
	public boolean isEmpty(Object obj) {
		if (obj == null || obj.toString().equals(""))
			return true;
		return false;
	}
	
	
	   /**
     * 자바 dateformat 변경하기 
     * String expectedPattern = "yyyyMMddkkmmss";
     *
     * @param textDate ex) 20141219093040
     * @return yyyy년MM월dd일 HH시mm분ss초
     * 
     * 이슈 최초 입력되는 타입에 대한 확인 후 변형되어야한다
     * 최초 입력되는 타입을 어떻게 할지 부분 고민 
     */
    public static String convertStringToDateFormat(String textDate, String type) {
        String dateString = null;
    	String type_dateFormat = null;
        try {
        	if (type.equals("1")){
        		type_dateFormat = "yyyyMMddhhmmss";
        	}else if(type.equals("2")){
        		type_dateFormat = "yyyyMMdd";
        	}else if(type.equals("3")){
        		type_dateFormat = "yyyy년MM월dd일 HH시mm분ss초";
        	}else if(type.equals("4")){
        		type_dateFormat = "yyyy-MM-dd hh:mm:ss";
        	}else if(type.equals("5")){
        		type_dateFormat = "yyyyMMddhhmmss";
        	}else{
        		type_dateFormat = "yyyy-MM-dd";
        	}
        	
        	SimpleDateFormat format1 = new SimpleDateFormat(type_dateFormat);
        	 Date date = format1.parse(textDate);
            dateString = format1.format(date);

          //현재 날짜 구하기
           // 자바의 String 형을 날짜로 변환하여 오늘의 날짜와의 차이를 구하려고 합니다. 
          /*  String todate=  formatter.format(new Date());
            
            
            log.info("현재시간 년월일 = " + todate01);
            log.info("현재시간 년월일 = " + todate02);
            log.info("현재시간 년월일 = " + todate03);
                    
            String testDate = "20160421";
            Date todate_date =  formatter03.parse(todate03);
            Date test_date =  formatter03.parse(testDate);
                    
            log.info(todate_date + "====== " + test_date);
            long diff = todate_date.getTime() - test_date.getTime();
            // 시간차이를 시간,분,초를 곱한 값으로 나누면 하루 단위가 나옴
            long diffDays = diff / (24 * 60 * 60 * 1000);
                 
            log.info("날짜계산차이 : " + diff);
            log.info("일차이 : " + diffDays);
            log.info("년차이 : " + diffDays / 365);*/
            
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return dateString;
    }
}
