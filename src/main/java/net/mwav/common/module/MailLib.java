package net.mwav.common.module;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.springframework.ui.velocity.VelocityEngineUtils;
import org.springframework.web.servlet.view.velocity.VelocityConfig;
import org.springframework.web.servlet.view.velocity.VelocityConfigurer;

/**
 *@class name : MailLib.java
 *@description : It's MailLib
 *				 This lib has the ability to send or verify email. 
 *				 MailLib made Singleton Design Patterm. 
 *				 To use MailLib, Create getInstence() method. 
 *
 *				 Default Properties Settings
 *				  - Host : smtp.gmail.com
 *				  - Port : 587
 *@author : (정) 공태현
            (부)
 *@since : 2019. 7. 17.
 *@version : v1.0
 *@see
 * @history :
   ----------------------------------------
   * Modification Information(개정이력)
   ----------------------------------------
           수정일                  수정자                         수정내용
   --------    --------    ----------------
   2019. 7. 17.     John    
 */
public class MailLib {

	private Properties property;
	private MimeMessage msg;
	Session session;
	
	private MailLib() {}
	
	private static class MailLibSingleton{
		private static final MailLib instance = new MailLib();
	}
	
	// 초기화 블록을 사용하여 최초 한번만 Default Setting을 부여한다.
	{
		property = new Properties();
		try {
		    
		    InputStream inputStream = getClass().getClassLoader().getResourceAsStream("googleProperties/googleAccout.properties");
		    
		    property.load(inputStream);
		    
		    //람다가 안됨; https://stackoverflow.com/questions/26875226/using-a-lambda-expression-in-session
		    session = Session.getDefaultInstance(property, new Authenticator(){
		    	public PasswordAuthentication getPasswordAuthentication() {
		    		return new PasswordAuthentication(property.getProperty("mail.smtp.username"), property.getProperty("mail.smtp.password"));
		    	}
		    });
		    
			System.out.println("로드 완료");
		} catch (IOException e) {
			System.out.println("로드 실패");
			e.printStackTrace();
		}
		
	} 
	
	public static MailLib getInstance() {
		return MailLibSingleton.instance;
	}
	
	
	public boolean basicTextSendEmail(String title, String Content){
		boolean bool = false;
		
		/*mailSender.setJavaMailProperties(property);
		msg = mailSender.createMimeMessage();

		try {
			msg.setSubject(title);
			msg.setContent("본문 내용", "utf-8");
			msg.setText(Content);
			msg.setFrom(new InternetAddress("tony950620@gmail.com"));
			msg.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse("tony950620@naver.com"));
			
			mailSender.send(msg);
			
			bool = true;
			
		}catch(MessagingException err) {
			System.out.println("에러 : " + err);
		}*/
		
		return bool;
	}
	
	public void sendTest() throws UnsupportedEncodingException{
		
		try {
			msg = new MimeMessage(session);
			
			msg.setFrom(new InternetAddress("tony950620@gmail.com"));
			msg.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse("tony950620@naver.com"));
			
			String htmlContent = "<strong>안녕하세요</strong>, 반갑습니다." + "<img src=" + "http://mwav.net/Images/CompanyLogos/CompanyLogo.gif" + ">";
			msg.setSubject("Mwav Test Mail", "UTF-8");
			
			MimeBodyPart mbp1 = new MimeBodyPart();
			File file = new File("D:\\unnamed.png");
//			FileDataSource fds = new FileDataSource(file.getAbsolutePath());
//			
//			mbp1.setDataHandler(new DataHandler(fds));
//			mbp1.setFileName(fds.getName());
			mbp1.attachFile(file);
			
			
			MimeBodyPart mbp2 = new MimeBodyPart();
			mbp2.setContent(htmlContent, "text/html; charset=utf-8");

			VelocityConfig velocityConfig = new VelocityConfigurer();
			Map<String, Object> emailMap = new HashMap<String, Object>(); 
			emailMap.put("PW", "값");
			String veloTemplate = VelocityEngineUtils.mergeTemplateIntoString(velocityConfig.getVelocityEngine(), "GeneralMail/PWSeekEmail.vm", "UTF-8", emailMap);
			System.out.println("벨로시티 : " + veloTemplate);
			Multipart mp = new MimeMultipart();
			
			mp.addBodyPart(mbp1);
			mp.addBodyPart(mbp2);
			
			//msg.setContent(mp);
			msg.setText(veloTemplate);
			
			//Transport.send(msg);
		} catch (MessagingException e) {
			System.out.println("에러남 : " + e.getMessage());
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
}

