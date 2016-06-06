package net.mwav.member.auth;

import java.io.IOException;
import java.util.Arrays;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleTokenResponse;
import com.google.api.client.http.GenericUrl;
import com.google.api.client.http.HttpRequest;
import com.google.api.client.http.HttpRequestFactory;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson.JacksonFactory;

/**
 * https://github.com/mdanter/OAuth2v1를 참고하여, 필요한 부분은 수정하였습니다.
 * @author pooha302
 * @see https://github.com/mdanter/OAuth2v1
 *
 */
@Component
public class GoogleAuthHelper {
	@Value("${com.google.clintId}")
	private String CLIENT_ID;
	@Value("${com.google.clientSecret}")
	private String CLIENT_SECRET ;
	//수정
	@Value("${com.google.callback}")
	private String CALLBACK_URI;
	
	@Value("${com.google.userInfo}")
	private String USER_INFO_URL;
	@Value("${com.google.groupsUrl}")
	private String GOOGLE_GROUPS_URL;
	@Value("${com.google.groupApiKey}")
	private String GOOGLE_GROUPS_API_KEY;
	@Value("${com.google.refresh}")
	private String REFRESH_TOKEN ;
	@Value("${com.google.accesstoken}")
	private String ACCESS_TOKEN;
	
	
	private final String[] SCOPES = new String[]{
		"https://www.googleapis.com/auth/userinfo.profile",
		"https://www.googleapis.com/auth/userinfo.email",
	};

	// 여기까지는 properties로 관리할 것

	private final JsonFactory JSON_FACTORY = new JacksonFactory();
	private final HttpTransport HTTP_TRANSPORT = new NetHttpTransport();

	
	public String buildLoginUrl(String callback) {
		GoogleAuthorizationCodeFlow flow = new GoogleAuthorizationCodeFlow.Builder(HTTP_TRANSPORT,
				JSON_FACTORY, CLIENT_ID, CLIENT_SECRET, Arrays.asList(SCOPES)).build();

		return flow.newAuthorizationUrl().setRedirectUri(CALLBACK_URI).setState(generateStateToken(callback)).setAccessType("offline").build();
	}

	private String generateStateToken(String callback){
		//return "google;"+(new SecureRandom().nextInt()) + "callback;"+callback;
		return callback;
	}

	/**
	 * 사용자 정보를 가져옴
	 * @param authCode
	 * @return
	 * @throws IOException
	 */
	public GoogleUser getUserInfoJson(String callback, String authCode) throws IOException {
		GoogleAuthorizationCodeFlow flow = new GoogleAuthorizationCodeFlow.Builder(HTTP_TRANSPORT,
				JSON_FACTORY, CLIENT_ID, CLIENT_SECRET, Arrays.asList(SCOPES)).setAccessType("offline").build();

		GoogleTokenResponse response = flow.newTokenRequest(authCode).setRedirectUri(CALLBACK_URI).execute();
		Credential credential = flow.createAndStoreCredential(response, null);
		HttpRequestFactory requestFactory = HTTP_TRANSPORT.createRequestFactory(credential);

		HttpRequest request = requestFactory.buildGetRequest(new GenericUrl(USER_INFO_URL));

		request.getHeaders().setContentType("application/json");
		final String jsonIdentity = request.execute().parseAsString();

		return new ObjectMapper().readValue(jsonIdentity, GoogleUser.class);
	}

	public String getCLIENT_ID() {
		return CLIENT_ID;
	}

	public void setCLIENT_ID(String cLIENT_ID) {
		CLIENT_ID = cLIENT_ID;
	}

	public String getCLIENT_SECRET() {
		return CLIENT_SECRET;
	}

	public void setCLIENT_SECRET(String cLIENT_SECRET) {
		CLIENT_SECRET = cLIENT_SECRET;
	}

	public String getUSER_INFO_URL() {
		return USER_INFO_URL;
	}

	public void setUSER_INFO_URL(String uSER_INFO_URL) {
		USER_INFO_URL = uSER_INFO_URL;
	}

	public String getGOOGLE_GROUPS_URL() {
		return GOOGLE_GROUPS_URL;
	}

	public void setGOOGLE_GROUPS_URL(String gOOGLE_GROUPS_URL) {
		GOOGLE_GROUPS_URL = gOOGLE_GROUPS_URL;
	}

	public String getGOOGLE_GROUPS_API_KEY() {
		return GOOGLE_GROUPS_API_KEY;
	}

	public void setGOOGLE_GROUPS_API_KEY(String gOOGLE_GROUPS_API_KEY) {
		GOOGLE_GROUPS_API_KEY = gOOGLE_GROUPS_API_KEY;
	}

	public String getREFRESH_TOKEN() {
		return REFRESH_TOKEN;
	}

	public void setREFRESH_TOKEN(String rEFRESH_TOKEN) {
		REFRESH_TOKEN = rEFRESH_TOKEN;
	}

	public String getACCESS_TOKEN() {
		return ACCESS_TOKEN;
	}

	public void setACCESS_TOKEN(String aCCESS_TOKEN) {
		ACCESS_TOKEN = aCCESS_TOKEN;
	}	
	
	public String getCALLBACK_URI() {
		return CALLBACK_URI;
	}

	public void setCALLBACK_URI(String cALLBACK_URI) {
		CALLBACK_URI = cALLBACK_URI;
	}
	
}
