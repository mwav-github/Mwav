package net.common.common;

//#############################################################################################
//Google Developers URL Shortener : https://developers.google.com/url-shortener/
//API Key 발급 : https://developers.google.com/url-shortener/v1/getting_started#APIKey
//API 명세 : https://developers.google.com/url-shortener/libraries
//출처: http://groovysunday.tistory.com/135 [성냥의 불친절한 IT 이야기]
//#############################################################################################

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

// 성냥   : Map으로 사용하고자 할 경우 import
//import java.util.HashMap;
//import java.util.Map;
//import org.codehaus.jackson.map.ObjectMapper;
//import org.codehaus.jackson.type.TypeReference;

public class APIGoogleShorten {

	// 성냥 : Google 단축URL 사용을 위한 URL
	public static final String SHORTENER_URL = "https://www.googleapis.com/urlshortener/v1/url?key=";

	// 성냥 : 인터넷 검색으로 찾은 구글 API키는 현재 동작하지 않음
	// : 개인 계정으로 등록한 사용자 키로 테스트 (##새로운 키 등록이 필요함##)
	// public static final String API_KEY = "ukshaSyDYZdHzkR7-hPL548cjH-c125";
	public static final String API_KEY = "AIzaSyCTiWQxaOoPkpCdHmESGPYNsMxS8LQ0wx0"; // 새로운
																						// 키
																						// 등록
																						// 필요

	// #######################################################################################
	// 성냥 : 단축시킬 URL 주소를 String 문자열로 입력받고, Google API에 전송 (JSON 첨부)
	// : 결과 JSON String 데이터를 수신하여, JSONObject 혹은 Map(현재주석처리)으로 변환
	// : JSONObject 에서 단축URL을 String 타입으로 return
	// : 인증키당 일 100,000 변환 가능
	// #######################################################################################
	public static String getShortenUrl(String originalUrl) {

		System.out.println("[DEBUG] INPUT_URL : " + originalUrl);

		// 성냥 : Exception에 대비해 결과 URL은 처음에 입력 URL로 셋팅
		String resultUrl = originalUrl;

		// 성냥 : Google Shorten URL API는 JSON으로 longUrl 파라미터를 사용하므로, JSON String
		// 데이터 생성
		String originalUrlJsonStr = "{\"longUrl\":\"" + "http://www.mwav.net/board/buView.mwav?bUsers_id=100010&utm_source=twitter&utm_campaign=[업무제휴]Mwav&FusionCharts와업무제휴체결.&utm_medium=social&utm_content=notices&pgl=#news_top" + "\"}";
		System.out.println("[DEBUG] INPUT_JSON : " + originalUrlJsonStr);

		// 성냥 : Google에 변환 요청을 보내기위해 java.net.URL, java.net.HttpURLConnection 사용
		URL url = null;
		HttpURLConnection connection = null;
		OutputStreamWriter osw = null;
		BufferedReader br = null;
		StringBuffer sb = null; // Google의 단축URL서비스 결과 JSON String Data
		JSONObject jsonObj = null; // 결과 JSON String Data로 생성할 JSON Object

		// 성냥 : Google 단축 URL 요청을 위한 주소 -
		// https://www.googleapis.com/urlshortener/v1/url
		// : get방식으로 key(사용자키) 파라미터와, JSON 데이터로 longUrl(단축시킬 원본 URL이 담긴 JSON
		// 데이터) 를 셋팅하여 전송
		try {
			url = new URL(SHORTENER_URL + API_KEY);
			System.out.println("[DEBUG] DESTINATION_URL : " + url.toString());

		} catch (Exception e) {
			System.out.println("[ERROR] URL set Failed");
			e.printStackTrace();
			return resultUrl;
		}

		// 성냥 : 지정된 URL로 연결 설정
		try {
			connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("POST");
			connection.setRequestProperty("User-Agent", "toolbar");
			System.setProperty("http.agent", "Chrome");
			connection.setDoOutput(true);
			connection.setRequestProperty("Content-Type", "application/json");
		} catch (Exception e) {
			System.out.println("[ERROR] Connection open Failed");
			e.printStackTrace();
			return resultUrl;
		}

		// 성냥 : 결과 JSON String 데이터를 StringBuffer에 저장
		// : 필요에 따라 JSON Obejct 혹은 Map으로 셋팅 (현재 Map은 주석처리)
		try {
			// 성냥 : Google 단축URL 서비스 요청
			osw = new OutputStreamWriter(connection.getOutputStream());
			osw.write(originalUrlJsonStr);
			osw.flush();

			// 성냥 : BufferedReader에 Google에서 받은 데이터를 넣어줌
			br = new BufferedReader(new InputStreamReader(
					connection.getInputStream(), "UTF-8"));

			// 성냥 : BufferedReader 내 데이터 StringBuffer sb 에 저장
			sb = new StringBuffer();
			String buf = "";
			while ((buf = br.readLine()) != null) {
				sb.append(buf);
			}
			System.out.println("[DEBUG] RESULT_JSON_DATA : " + sb.toString());

			// 성냥 : Google에서 받은 JSON String을 JSONObject로 변환
			JSONParser parser = new JSONParser();
			Object obj = parser.parse( sb.toString() );
			jsonObj = (JSONObject) obj;


			// 성냥 : 결과 JSON Object의 데이터 확인 (주석처리)
			// String[] str = JSONObject.getNames(jsonObj);
			// for( String idx : str ){
			// System.out.println("[DEBUG] PARSING_JSON_DATA : [" + idx +
			// "] - [" + jsonObj.getString(idx) + "]");
			// }

			// 성냥 : 수신받은 JSON String 데이터를 필요시 Map에 저장
			// : return 타입을 Map 으로 받고자 할 때 사용 (현재는 결과 url만 String으로 리턴할 것이므로
			// 주석처리)
			// ObjectMapper mapper = new ObjectMapper();
			// Map<String,String> map = mapper.readValue(sb.toString(), new
			// TypeReference<HashMap<String, String>>() {});
			// resultUrl = (String) map.get("id"); // Map 으로 저장했을 때

			resultUrl = (String) jsonObj.get("id");
			System.out.println("resultUrl"+resultUrl);

		} catch (Exception e) {
			System.out
					.println("[ERROR] Result JSON Data(From Google) set JSONObject Failed");
			e.printStackTrace();
			return resultUrl;
		} finally {
			if (osw != null)
				try {
					osw.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			if (br != null)
				try {
					br.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
		}

		System.out.println("[DEBUG] RESULT_URL : " + resultUrl);
		return resultUrl;
	}

	// 성냥 : 테스트용 main
	// : inputURL에 변환대상 URL을 String으로 저장후 GoogleShortUrl 클래스의 getShortenUrl()
	// 메서드 호출
	// : getShortenUrl(String originalUrl) 은 static 이므로 객체생성없이 바로 사용
	public static void main(String[] args) {
		String originalUrl = "http://www.google.com";
		System.out.println("[DEBUG] main() RESULT_URL  : "
				+ APIGoogleShorten.getShortenUrl(originalUrl));
	}
}