package net.mwav.common.module;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class StateManageLib {

	/* 싱글톤 구현 
	========각 메서드에 대한 설명과 호출하는 부분 명시========
	설명 : StateManageLib 은 하나의 클래스에 대해서 단 하나의 인스턴스만을 생성할 수 있도록 제한 싱글톤형태로 생성한다.
	              (동기화 적용-하나의 인스턴스에 참조에 대해서 동시접근 불가)  
	호출하는 부분에서 사용시 : StateManageLib stateManageLib = StateManageLib.getInstance();
	*/	
	//public StateManageLib() {}	
	
	private static StateManageLib stateManageLib;
	
	// 쿠키를 <쿠키이름, cookie 객체> 쌍으로 저장하는 맵
	private Map cookieMap = new java.util.HashMap();
	
	public static synchronized StateManageLib getInstance(){
		if(stateManageLib ==null){
			stateManageLib = new StateManageLib();
		}
		return stateManageLib;   
	}	

	
	/**
	 * 유저의 요청에 담긴 쿠키를 가져와 배열로 저장한다.
	 * 
	 * @param request
	 * @throws IOException
	 */	
	public void AddCookieBox(HttpServletRequest request) {
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
		if (getCookie(cookieKey) != null) {
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

}
