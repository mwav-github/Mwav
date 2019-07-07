package net.mwav.member.auth.naver;

import com.github.scribejava.core.builder.api.DefaultApi20;

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
