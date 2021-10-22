package net.bizLogin.promoter.auth;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigInteger;
import java.security.SecureRandom;

@Configuration
@PropertySource("classpath:googleProperties/application.properties")
public class PmtNaverUrl {

    @Value("${promoter.naver.clientId}")
    private String clientId;
    @Value("${promoter.naver.clientSecret}")
    private String clientSecret;
    @Value("${promoter.naver.callbackUrl}")
    private String callbackUrl;

    private static final String NAVER_PROFILE = "https://openapi.naver.com/v1/nid/me";

    private String getRandomString() {
        SecureRandom random = new SecureRandom();
        String state = new BigInteger(130, random).toString();
        return state;
    }

    private void getRandomSessionState(HttpSession session, String name, String state) {
        session.setAttribute(name, state);
    }

    public String getAuthorizationUrl(HttpSession session) {
        String state = getRandomString();

        getRandomSessionState(session, "promoterId", state);

        OAuth20Service oAuth20Service = new ServiceBuilder().apiKey(clientId).apiSecret(clientSecret).callback(callbackUrl).state(state).build(PmtNaverAPI20.getInstance());

        return oAuth20Service.getAuthorizationUrl();
    }

    public OAuth2AccessToken getAccessToken(String state, String code) throws IOException {
        OAuth20Service oAuthService = new ServiceBuilder().apiKey(clientId).apiSecret(clientSecret).callback(callbackUrl).state(state).build(PmtNaverAPI20.getInstance());
        OAuth2AccessToken accessToken = oAuthService.getAccessToken(code);

        return accessToken;
    }

    public String getUserProfile(OAuth2AccessToken token) throws IOException {
        OAuth20Service oAuth20Service = new ServiceBuilder().apiKey(clientId).apiSecret(clientSecret).callback(callbackUrl).build(PmtNaverAPI20.getInstance());
        OAuthRequest oAuthRequest = new OAuthRequest(Verb.GET, NAVER_PROFILE, oAuth20Service);

        oAuth20Service.signRequest(token, oAuthRequest);

        Response response = oAuthRequest.send();

        return response.getBody();
    }
}