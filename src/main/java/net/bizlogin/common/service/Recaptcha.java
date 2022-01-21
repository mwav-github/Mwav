package net.bizlogin.common.service;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
import javax.net.ssl.HttpsURLConnection;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Service;

/**
 * Google Recaptcha 인증
 * TODO : 예외 상황에서의 {@link AutoCloseable} 파악
 * TODO : responseCode가 200이 아닌 경우 처리
 * TODO : response 변환 로직을 다른 메서드로 분리
 */
@Service
public class Recaptcha {

	private static final Logger logger = LoggerFactory.getLogger(Recaptcha.class);

	private String key = "6LcdRxoUAAAAAEhlMG_bH6mhyxLMIoBLTuAhtA1E";

	private String url = "https://www.google.com/recaptcha/api/siteverify";

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public boolean verify(String token) throws IOException {
		if (token == null || token.length() == 0) {
			return false;
		}

		HttpsURLConnection conn = openConnection(token);
		int responseCode = conn.getResponseCode();
		logger.debug("responseCode=" + responseCode);

		InputStream is = conn.getInputStream();
		JsonReader jsonReader = Json.createReader(is);
		JsonObject response = jsonReader.readObject();
		boolean success = response.getBoolean("success");

		is.close();
		jsonReader.close();
		conn.disconnect();

		logger.debug("response : " + response);
		return success;
	}

	public HttpsURLConnection openConnection(String token) throws IOException {
		URL recaptchaUrl = new URL(url);
		HttpsURLConnection conn = (HttpsURLConnection) recaptchaUrl.openConnection();
		conn.setRequestMethod(HttpMethod.POST.name());
		conn.setDoOutput(true);

		OutputStream output = conn.getOutputStream();
		String param = "secret=" + key + "&response=" + token;
		output.write(param.getBytes());
		output.flush();
		output.close();

		return conn;
	}

}
