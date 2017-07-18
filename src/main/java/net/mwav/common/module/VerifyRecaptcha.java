package net.mwav.common.module;

import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
import javax.net.ssl.HttpsURLConnection;

public class VerifyRecaptcha {

	// http://o7planning.org/en/10397/using-google-recaptcha-with-java-web-application
	// 구현법

	
	//Required. The shared key between your site and reCAPTCHA.
	public static final String SECRET_KEY = "6LcdRxoUAAAAAEhlMG_bH6mhyxLMIoBLTuAhtA1E";
	public static final String SITE_VERIFY_URL = "https://www.google.com/recaptcha/api/siteverify";

	// http://blog.saltfactory.net/using-resttemplate-in-spring/
	// https://developers.google.com/recaptcha/old/docs/java
	// https://www.google.com/recaptcha/admin?hl=en#site/337266461

	public static boolean verify(String gRecaptchaResponse) {
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
			//conn.setRequestProperty("User-Agent", "Mozilla/5.0");
			//conn.setRequestProperty("Accept-Language", "en-US,en;q=0.5");

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
			System.out.println("responseCode=" + responseCode);

			// Get the InputStream from Connection to read data sent from the
			// server.
			InputStream is = conn.getInputStream();

			JsonReader jsonReader = Json.createReader(is);
			JsonObject jsonObject = jsonReader.readObject();
			jsonReader.close();

			// ==> {"success": true}
			//예)
			/*{
				  "success": true|false,
				  "challenge_ts": timestamp,  // timestamp of the challenge load (ISO format yyyy-MM-dd'T'HH:mm:ssZZ)
				  "hostname": string,         // the hostname of the site where the reCAPTCHA was solved
				  "error-codes": [...]        // optional
				}*/
			
			System.out.println("Response: " + jsonObject);

			boolean success = jsonObject.getBoolean("success");
			return success;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
}
