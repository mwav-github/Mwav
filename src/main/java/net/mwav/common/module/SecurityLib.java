package net.mwav.common.module;

import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.util.regex.Pattern;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
import javax.net.ssl.HttpsURLConnection;

/**
 *@class name : SecurityLib.java
 *@description : 
 *@author : (정)
            (부)
 *@since : 2019. 7. 13.
 *@version : v1.0
 *@see
   #method : 현재 클래스의 메소드나 변수 연결
   MyClass#method : MyClass 클래스의 메소드나 변수 연결
   my.package.MyClass#method : my.package 에 있는 MyClass 클래스의 메소드나 변수 연결
 * @history :
   ----------------------------------------
   * Modification Information(개정이력)
   ----------------------------------------
           수정일                   수정자                        수정내용
   --------    --------    ----------------
    2019. 7. 13.     jusun    
 */
public class SecurityLib {
	private static SecurityLib securityLib;

	private SecurityLib() {}

	public static synchronized SecurityLib getInstance() {
		if (securityLib == null) {
			securityLib = new SecurityLib();
		}
		return securityLib;
	}

	public String clearXSSMinimum(String value) {
		if (value == null || value.trim().equals("")) {
			return "";
		}

		String returnValue = value;

		returnValue = returnValue.replaceAll("&", "&amp;");
		returnValue = returnValue.replaceAll("<", "&lt;");
		returnValue = returnValue.replaceAll(">", "&gt;");
		returnValue = returnValue.replaceAll("\"", "&#34;");
		returnValue = returnValue.replaceAll("\'", "&#39;");
		returnValue = returnValue.replaceAll(".", "&#46;");
		returnValue = returnValue.replaceAll("%2E", "&#46;");
		returnValue = returnValue.replaceAll("%2F", "&#47;");
		return returnValue;
	}

	public String clearXSSMaximum(String value) {
		String returnValue = value;
		returnValue = clearXSSMinimum(returnValue);

		returnValue = returnValue.replaceAll("%00", null);

		returnValue = returnValue.replaceAll("%", "&#37;");

		// \\. => .

		returnValue = returnValue.replaceAll("\\.\\./", ""); // ../
		returnValue = returnValue.replaceAll("\\.\\.\\\\", ""); // ..\
		returnValue = returnValue.replaceAll("\\./", ""); // ./
		returnValue = returnValue.replaceAll("%2F", "");

		return returnValue;
	}

	public String filePathBlackList(String value) {
		String returnValue = value;
		if (returnValue == null || returnValue.trim().equals("")) {
			return "";
		}

		returnValue = returnValue.replaceAll("\\.\\./", ""); // ../
		returnValue = returnValue.replaceAll("\\.\\.\\\\", ""); // ..\

		return returnValue;
	}

	/**
	 * 행안부 보안취약점 점검 조치 방안.
	 *
	 * @param value
	 * @return
	 */
	public String filePathReplaceAll(String value) {
		String returnValue = value;
		if (returnValue == null || returnValue.trim().equals("")) {
			return "";
		}

		returnValue = returnValue.replaceAll("/", "");
		returnValue = returnValue.replaceAll("\\", "");
		returnValue = returnValue.replaceAll("\\.\\.", ""); // ..
		returnValue = returnValue.replaceAll("&", "");

		return returnValue;
	}

	public String filePathWhiteList(String value) {
		return value;
	}

	public boolean isIPAddress(String str) {
		Pattern ipPattern = Pattern
				.compile("\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}");

		return ipPattern.matcher(str).matches();
	}

	public String removeCRLF(String parameter) {
		return parameter.replaceAll("\r", "").replaceAll("\n", "");
	}

	public String removeSQLInjectionRisk(String parameter) {
		return parameter.replaceAll("\\p{Space}", "").replaceAll("\\*", "")
				.replaceAll("%", "").replaceAll(";", "").replaceAll("-", "")
				.replaceAll("\\+", "").replaceAll(",", "");
	}

	public String removeOSCmdRisk(String parameter) {
		return parameter.replaceAll("\\p{Space}", "").replaceAll("\\*", "")
				.replaceAll("|", "").replaceAll(";", "");
	}
	

	/** 
	 * @method name : recapchaVerify
	 * @author : (정) 김주성
	             (부) 
	 * @since  : 2019. 7. 13.
	 * @version : v1.0
	 * @see : https://o7planning.org/en/10397/using-google-recaptcha-with-java-web-application#a859239
	 * @description : recapcha에 대해서 middletier에서 구글 서버와 rq/rs를 통해서, 재 점검 가능. 
	 * @history :
	   ----------------------------------------
	   * Modification Information(개정이력)
	   ----------------------------------------
	            수정일                              수정자                        수정내용
	   --------          --------    ----------------
	     2019. 7. 13.     jusun       최초 작성.
	 * @param : gRecaptchaResponse - authentication code from google server <br>
	 *          *g-recaptcha-response POST parameter when the user submits the form on your site (http attributes, hidden field)
	 * @return : boolean
	 * @throws : 
	 * @Library <!-- http://mvnrepository.com/artifact/org.glassfish/javax.json --> 필수        
	 <pre>
	 * {@code : 예제 코드 작성
	 *  if (valid) {
         String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
         // Verify CAPTCHA.
         valid = SecurityLib.recapchaVerify(gRecaptchaResponse);
         if (!valid) {
             errorString = "Captcha invalid!";
         }
     }
	 * } 
	 </pre>
	*/
	public boolean recapchaVerify(String gRecaptchaResponse) {
		final String SECRET_KEY = "6LcdRxoUAAAAAEhlMG_bH6mhyxLMIoBLTuAhtA1E";
		final String SITE_VERIFY_URL = "https://www.google.com/recaptcha/api/siteverify";

		
		if (gRecaptchaResponse == null || gRecaptchaResponse.length() == 0) {
			return false;
		}

		try {
			URL verifyUrl = new URL(SITE_VERIFY_URL);

			// Open Connection to URL
			HttpsURLConnection conn = (HttpsURLConnection) verifyUrl
					.openConnection();

			// Add Request Header
			conn.setRequestMethod("POST");
			// conn.setRequestProperty("User-Agent", "Mozilla/5.0");
			// conn.setRequestProperty("Accept-Language", "en-US,en;q=0.5");

			// Data will be sent to the server.
			String postParams = "secret=" + SECRET_KEY + "&response="
					+ gRecaptchaResponse;

			// Send Request
			conn.setDoOutput(true);

			// Get the output stream of Connection
			// Write data in this stream, which means to send data to Server.
			OutputStream outStream = conn.getOutputStream();
			outStream.write(postParams.getBytes());

			outStream.flush();
			outStream.close();

			// Response code return from server.
			// HTTP.STATUS CODE
			int responseCode = conn.getResponseCode();
			//System.out.println("responseCode=" + responseCode);

			// Get the InputStream from Connection to read data sent from the
			// server.
			InputStream is = conn.getInputStream();

			JsonReader jsonReader = Json.createReader(is);
			JsonObject jsonObject = jsonReader.readObject();
			jsonReader.close();

			// ==> {"success": true}
			// 예)
			/*
			 * { "success": true|false, "challenge_ts": timestamp, // timestamp
			 * of the challenge load (ISO format yyyy-MM-dd'T'HH:mm:ssZZ)
			 * "hostname": string, // the hostname of the site where the
			 * reCAPTCHA was solved "error-codes": [...] // optional }
			 */

			//System.out.println("Response: " + jsonObject);

			boolean success = jsonObject.getBoolean("success");
			return success;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
}
