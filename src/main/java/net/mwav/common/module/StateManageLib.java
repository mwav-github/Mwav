package net.mwav.common.module;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

/**
 *@class name : StateManageLib.java
 *@description : 
 *@author : (정) 공태현
            (부)
 *@since : 2019. 3. 30.
 *@version : v1.0
 *@see :    
 * @history :
   ----------------------------------------
   * Modification Information(개정이력)
   ----------------------------------------
   수정일     수정자        수정내용
   --------    --------    ----------------
   2019. 3. 30.     John   최초작성 
 */
public class StateManageLib {
	
	private static StateManageLib stateManageLib;
	
	// 쿠키를 <쿠키이름, cookie 객체> 쌍으로 저장하는 맵
	private Map cookieMap = new java.util.HashMap();
	
	/** 
	 * @method name : getInstance
	 * @author : (정) 공태현
	                 (부)
	 * @since  : 2019. 3. 30.
	 * @version : v1.0
	 * @see :
	 * @description : StateManageLib 은 하나의 클래스에 대해서 단 하나의 인스턴스만을 생성할 수 있도록 제한 싱글톤형태로 생성한다. 
	 * 				  (동기화 적용-하나의 인스턴스에 참조에 대해서 동시접근 불가)	 
	 * @history :
	   ----------------------------------------
	   * Modification Information(개정이력)
	   ----------------------------------------
	   수정일     수정자        수정내용
	   --------    --------    ----------------
	   2019. 3. 30.     John     
	 * @param :
	 * @return : 첫 호출이면 생성 또는 기존에 생성했던 인스턴스 반환
	 * @throws : 
	 <pre>
	 * {@code : 예제 코드 작성
	 * StateManageLib stateManageLib = StateManageLib.getInstance();
	 * } 
	 </pre>
	*/
	public static synchronized StateManageLib getInstance(){
		if(stateManageLib ==null){
			stateManageLib = new StateManageLib();
		}
		return stateManageLib;   
	}	
	
	/** 
	 * @method name : AddCookieBox
	 * @author : (정) 공태현
	                 (부)
	 * @since  : 2019. 3. 30.
	 * @version : v1.0
	 * @see :
	 * @description : 유저의 요청에 담긴 쿠키를 가져와 StateManageLib 인스턴스의 배열로 저장한다.
	 * @history :
	   ----------------------------------------
	   * Modification Information(개정이력)
	   ----------------------------------------
	   수정일     수정자        수정내용
	   --------    --------    ----------------
	   2019. 3. 30.     John     
	 * @param : request
	 * @return :
	 * @throws : IOException
	 <pre>
	 * {@code : 예제 코드 작성
	 * stateManageLib.AddCookieBox(request);
	 * } 
	 </pre>
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
	 * @method name : createCookie
	 * @author : (정) 공태현
	                 (부)
	 * @since  : 2019. 3. 30.
	 * @version : v1.0
	 * @see :
	 * @description : 쿠키객체를 생성해서 리턴
	 * @history :
	   ----------------------------------------
	   * Modification Information(개정이력)
	   ----------------------------------------
	   수정일     수정자        수정내용
	   --------    --------    ----------------
	   2019. 3. 30.     John     
	 * @param : name, value
	 * @return : cookie
	 * @throws : IOException
	 <pre>
	 * {@code : 예제 코드 작성
	 * stateManageLib.createCookie("name","value");
	 * } 
	 </pre>
	*/
	public static Cookie createCookie(String name, String value)
			throws IOException {
		return new Cookie(name, URLEncoder.encode(value, "utf-8"));
	}
	
	/** 
	 * @method name : createCookie
	 * @author : (정) 공태현
	                 (부)
	 * @since  : 2019. 3. 30.
	 * @version : v1.0
	 * @see :
	 * @description : 쿠키객체를 생성해서 쿠키의 유효한 디렉토리와 유효기간의 값 셋팅해주고 리턴
	 * @history :
	   ----------------------------------------
	   * Modification Information(개정이력)
	   ----------------------------------------
	   수정일     수정자        수정내용
	   --------    --------    ----------------
	   2019. 3. 30.     John     
	 * @param : name, value, path, maxAge  (일,시간,분,초 //  365*24*60*60 : 1년 // 20*60 : 20분)
	 * @return : cookie
	 * @throws : IOException
	 <pre>
	 * {@code : 예제 코드 작성
	 * stateManageLib.createCookie("name","value","/","60 * 60 * 24 * 14");
	 * } 
	 </pre>
	*/
	public static Cookie createCookie(String name, String value, String path,
			int maxAge) throws IOException {
		Cookie cookie = new Cookie(name, URLEncoder.encode(value, "utf-8"));
		cookie.setPath(path);
		cookie.setMaxAge(maxAge);
		return cookie;
	}
	
	/** 
	 * @method name : createCookie
	 * @author : (정) 공태현
	                 (부)
	 * @since  : 2019. 3. 30.
	 * @version : v1.0
	 * @see :
	 * @description : 쿠키객체를 생성해서 유효한 도메인과 쿠키의 유효한 디렉토리, 유효기간의 값 셋팅해주고 리턴
	 * @history :
	   ----------------------------------------
	   * Modification Information(개정이력)
	   ----------------------------------------
	   수정일     수정자        수정내용
	   --------    --------    ----------------
	   2019. 3. 30.     John     
	 * @param : name, value, domain, path, maxAge  (일,시간,분,초 //  365*24*60*60 : 1년 // 20*60 : 20분)
	 * @return : cookie
	 * @throws : IOException
	 <pre>
	 * {@code : 예제 코드 작성
	 * stateManageLib.createCookie("name","value", "mwav.com", "/","60 * 60 * 24 * 14");
	 * } 
	 </pre>
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
	 * @method name : getCookie
	 * @author : (정) 공태현
	                 (부)
	 * @since  : 2019. 3. 30.
	 * @version : v1.0
	 * @see :
	 * @description : 쿠키를 가져온다
	 * @history :
	   ----------------------------------------
	   * Modification Information(개정이력)
	   ----------------------------------------
	   수정일     수정자        수정내용
	   --------    --------    ----------------
	   2019. 3. 30.     John     
	 * @param : name
	 * @return : 인스턴스에서 name의 쿠키객체를 가져온다.
	 * @throws : 
	 <pre>
	 * {@code : 예제 코드 작성
	 * stateManageLib.getCookie("name");
	 * } 
	 </pre>
	*/
	public Cookie getCookie(String name) {
		return (Cookie) cookieMap.get(name);
	}	
	
	/** 
	 * @method name : getValue
	 * @author : (정) 공태현
	                 (부)
	 * @since  : 2019. 3. 30.
	 * @version : v1.0
	 * @see :
	 * @description : 인스턴스에서 name의 쿠키객체의 value만 디코딩 후 리턴
	 * @history :
	   ----------------------------------------
	   * Modification Information(개정이력)
	   ----------------------------------------
	   수정일     수정자        수정내용
	   --------    --------    ----------------
	   2019. 3. 30.     John     
	 * @param : name
	 * @return : 쿠키객체의 value만 리턴
	 * @throws : IOException
	 <pre>
	 * {@code : 예제 코드 작성
	 * stateManageLib.getValue("name");
	 * } 
	 </pre>
	*/
	public String getValue(String name) throws IOException {
		Cookie cookie = (Cookie) cookieMap.get(name);
		if (cookie == null)
			return null;
		return URLDecoder.decode(cookie.getValue(), "utf-8");
	}
	
	/** 
	 * @method name : deleteCookie
	 * @author : (정) 공태현
	                 (부)
	 * @since  : 2019. 3. 30.
	 * @version : v1.0
	 * @see :
	 * @description : 인스턴스의 cookieKey을 제거
	 * @history :
	   ----------------------------------------
	   * Modification Information(개정이력)
	   ----------------------------------------
	   수정일     수정자        수정내용
	   --------    --------    ----------------
	   2019. 3. 30.     John     
	 * @param : cookieKey
	 * @return :
	 * @throws : IOException
	 <pre>
	 * {@code : 예제 코드 작성
	 * stateManageLib.deleteCookie("cookieKey");
	 * } 
	 </pre>
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
