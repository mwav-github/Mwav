package net.common.common;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class APINaverShorten {

	public static String getNaverShortenUrl(String originalUrl) {
        String clientId = "IgsxtB0uBqToYHbY1TEK";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "Md4yzO3biF";//애플리케이션 클라이언트 시크릿값";
        //String test = "http://www.mwav.net/board/buView.mwav?boardUser_id=100010&utm_source=twitter&utm_campaign=[업무제휴]Mwav&FusionCharts와업무제휴체결.&utm_medium=social&utm_content=notices&pgl=#news_top";
        String result = null;
        try {
            //String text = "https://developers.naver.com/notice";
            String apiURL = "https://openapi.naver.com/v1/util/shorturl?url=" + originalUrl;
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            System.out.println(response.toString());
            result = response.toString();
        } catch (Exception e) {
            System.out.println(e);
        }
        return result; // response!=200 이면 오류 텍스트 검출, catch문 이동시 예외 오류 텍스트 검출
    }
}