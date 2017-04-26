package net.mwav.common.module;


import java.net.URI;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.client.RestOperations;

public class VerifyRecaptcha {
	 @Autowired
	private RestOperations restTemplate;

	 //http://blog.saltfactory.net/using-resttemplate-in-spring/
	
	public static boolean verify(String gRecaptchaResponse) {
		if (gRecaptchaResponse == null || "".equals(gRecaptchaResponse)) {
			return false;
		}
		
		try{
			//String response = request.getParameter("g-recaptcha-response");
	        //captchaService.processResponse(response);
			
	        final URI verifyUri = URI.create(String.format("https://www.google.com/recaptcha/api/siteverify?secret=%s&response=%s&remoteip=%s", "11", "11", "11"));
	         
	     //   final  GoogleResponse googleResponse = restTemplate.getForObject(verifyUri, GoogleResponse.class);
			 

		}
		catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}
}
