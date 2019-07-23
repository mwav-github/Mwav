package net.mwav.member.auth.naver;

import com.github.scribejava.core.builder.api.DefaultApi20;

/**
 * 
 * @class name : NaverAPI.java
 * @description : 네이버 로그인 인증을 위한 url value object<br>
 * 				  scribeJava의  DefaultApi20을 확장
 * @author : (정) 남동희
             (부)
 * @since : 2019. 7. 13
 * @version : v1.1
 * @see
 * @history :
   ----------------------------------------
 * Modification Information(개정이력)
   ----------------------------------------
     수정일              	수정자                수정내용
   --------    --------    ----------------
 * 2019.07.13    남동희          		최초 생성		
 */
public class NaverAPI extends DefaultApi20 {

	private NaverAPI() {
	}

	private static class NaverAPIHolder {
		private static final NaverAPI INSTANCE = new NaverAPI();
	}

	public static NaverAPI getInstance() {
		return NaverAPIHolder.INSTANCE;
	}

	@Override
	public String getAccessTokenEndpoint() {
		return "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code";
	}

	@Override
	protected String getAuthorizationBaseUrl() {
		return "https://nid.naver.com/oauth2.0/authorize";
	}

}
