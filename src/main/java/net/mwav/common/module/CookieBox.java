package net.mwav.common.module;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class CookieBox {
	/*
	 * 사용법
	 * 
	 * // CookieBox 클래스의 생성자는 request로부터 쿠키 정보를 추출 CookieBox cookieBox = new
	 * CookieBox(request);
	 * CookieBox.createCookie("statistics_id", statistics_id);
	 * CookieBox.createCookie("statistics_id", statistics_id, "/", 60 * 60 * 24 * 7);
	 * Cookie idCookie = cookieBox.getCookie("id"); // 쿠키가 존재하지 않으면 null 리턴
	 * 
	 * // 지정한 이름의 쿠키가 존재하는지의 여부 if (cookieBox.exists("name")) { ... }
	 * 
	 * // 지정한 이름의 쿠키가 존재하지 않으면 값으로 null 리턴 String value =
	 * cookieBox.getValue("ROLE");
	 * 
	 * 
	 * 
	 * 출처: http://cofs.tistory.com/38 [Continuous Of Shoveling]
	 */

	// 쿠키를 <쿠키이름, cookie 객체> 쌍으로 저장하는 맵
	private Map cookieMap = new java.util.HashMap();

	/**
	 * 생성자 cookie배열을 cookieMap에 저장한다.
	 * 
	 * @param request
	 */
	public CookieBox(HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				cookieMap.put(cookies[i].getName(), cookies[i]);
			}
		}
	}

	/**
	 * 쿠키객체를 생성해서 리턴
	 * 
	 * @param name
	 * @param value
	 * @return cookie
	 * @throws IOException
	 */
	public static Cookie createCookie(String name, String value)
			throws IOException {
		return new Cookie(name, URLEncoder.encode(value, "utf-8"));
	}

	/**
	 * 쿠키객체를 생성해서 리턴
	 * 
	 * @param name
	 * @param value
	 * @param path
	 * @param maxAge  (일,시간,분,초 //  365*24*60*60 : 1년 // 20*60 : 20분)
	 * @return cookie
	 * @throws IOException
	 */
	public static Cookie createCookie(String name, String value, String path,
			int maxAge) throws IOException {
		Cookie cookie = new Cookie(name, URLEncoder.encode(value, "utf-8"));
		cookie.setPath(path);
		cookie.setMaxAge(maxAge);
		return cookie;
	}

	/**
	 * 쿠키객체를 생성해서 리턴
	 * 
	 * @param name
	 * @param value
	 * @param domain
	 * @param path
	 * @param maxAge
	 * @return cookie
	 * @throws IOException
	 */
	
	public static Cookie createCookie(String name, String value, String domain,
			String path, int maxAge) throws IOException {
		Cookie cookie = new Cookie(name, URLEncoder.encode(value, "utf-8"));
		cookie.setDomain(domain);
		cookie.setPath(path);
		cookie.setMaxAge(maxAge);
		return cookie;
	}
	

	/**
	 * 쿠키를 가져온다
	 * 
	 * @param name
	 * @return cookie
	 */
	public Cookie getCookie(String name) {
		return (Cookie) cookieMap.get(name);
	}

	/**
	 * 쿠키의 값을 가져온다
	 * 
	 * @param name
	 * @return value
	 * @throws IOException
	 */
	public String getValue(String name) throws IOException {
		Cookie cookie = (Cookie) cookieMap.get(name);
		if (cookie == null)
			return null;
		return URLDecoder.decode(cookie.getValue(), "utf-8");
	}

	/**
	 * 쿠키 삭제
	 * 
	 * @param cookieKey
	 * @return
	 * @throws IOException 
	 */
	public Cookie deleteCookie(String cookieKey) throws IOException {
		Cookie cookie = null;
		if (isExist(cookieKey)) {
			cookie = getCookie(cookieKey);
			// 쿠키생성시에 setPath()가 설정되어 있으면 삭제시에도 해당 패스를 다시 삭제하기위해서 생성된
			// 쿠키에 재설정하고 setMaxAge(0)으로 설정하며 삭제합니다.

			if (cookie.getPath() != null) {
				cookie.setPath(cookie.getPath());
			} else {
				cookie.setPath("/");
			}
			if (cookie.getDomain() != null) {
				cookie.setDomain(cookie.getDomain());
			}
			cookie.setMaxAge(0);
		}
		return cookie;
	}

	/**
	 * 쿠키 존재 여부
	 * 
	 * @param name
	 * @return 존재 : true, 미존재 : false
	 */
	public boolean isExist(String name) throws IOException  {
		return cookieMap.get(name) != null;
	}

}
