package net.bizLogin.promoter.auth;

import com.github.scribejava.core.builder.api.DefaultApi20;

public class PmtNaverAPI20 extends DefaultApi20{

    private PmtNaverAPI20() {}

    private static class InstanceHolder {
        private static final PmtNaverAPI20 INSTANCE = new PmtNaverAPI20();
    }

    public static PmtNaverAPI20 getInstance() {
        return InstanceHolder.INSTANCE;
    }

    @Override
    public String getAccessTokenEndpoint() {
        return "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code";
    }

    @Override
    protected String getAuthorizationBaseUrl() {
        return "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    }
}
