package net.common.common;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;


public class APINaverTrend {
	
	public String requestNaverTrend(String bnKeywords) {
		StringBuffer response = new StringBuffer();

		String clientId = "IgsxtB0uBqToYHbY1TEK";//애플리케이션 클라이언트 아이디값";
		String clientSecret = "Md4yzO3biF";//애플리케이션 클라이언트 시크릿값";
		
		List<String> keywords = Arrays.asList(bnKeywords.split(","));
		
		SimpleDateFormat simpleDataFormat = new SimpleDateFormat("yyyy-MM-dd");
		Calendar calendarObj = Calendar.getInstance();
		Date dateObj = calendarObj.getTime();
		
		int currentYear = dateObj.getYear();
		String currentDate = simpleDataFormat.format(dateObj);
		
		dateObj.setYear(currentYear-1);
		int previousYear = dateObj.getYear();
		calendarObj.set(Calendar.YEAR, previousYear);
		String privousDate = simpleDataFormat.format(dateObj);
		
//		System.out.println("currentDate : " + currentDate);
//		System.out.println("privousDate : " + privousDate);
		
		try {
			String apiURL = "https://openapi.naver.com/v1/datalab/search";
			/* example) */
			String body = "{\"startDate\":\"2017-01-01\","
					+ "\"endDate\":\"2017-12-30\",\"timeUnit\":\"month\","
					+ "\"keywordGroups\":"
					+ "[{\"groupName\":\"한글\",\"keywords\":[\"한글\",\"korean\"]},"
					+ "{\"groupName\":\"영어\",\"keywords\":[\"영어\",\"english\"]}],"
					+ "\"device\":\"pc\",\"ages\":[\"1\",\"2\"],\"gender\":\"f\"}";
//			String body = "{\"startDate\":\"" + privousDate + "\","
//					+ "\"endDate\":\"" + currentDate + "\",\"timeUnit\":\"month\","
//					+ "\"keywordGroups\":"
//					+ "[";
//			
//			for(int i = 0; i < keywords.size(); i++) {
//				body += "{\"groupName\":\"" + keywords.get(i) + "\",\"keywords\":[\"" + keywords.get(i) + "\"]}";
//				if(i < (keywords.size()-1)){
//					body += ",";
//				}
//			}
//			body += "],\"device\":\"pc\",\"mo\",\"ages\":[\"10\",\"20\",\"30\",\"40\"],\"gender\":\"m\",\"f\"}";
			
			
			System.out.println("body : " + body);
			
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("POST");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			con.setRequestProperty("Content-Type", "application/json");
//			con.setRequestProperty("Accept", "application/json");

			con.setDoOutput(true);
			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			wr.write(body.getBytes(Charset.forName("UTF-8")));
			wr.flush();
			wr.close();

			int responseCode = con.getResponseCode();
			BufferedReader br;
			if(responseCode==200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {  // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}

			String inputLine;
			
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
//			System.out.println("response.toString() : " + response.toString());
			
			return response.toString(); // 정상로직
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return response.toString(); // response!=200 이면 오류 텍스트 검출, catch문 이동시 예외 오류 텍스트 검출
	}
}