package net.mwav.common.module;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.velocity.exception.VelocityException;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.ui.velocity.VelocityEngineUtils;
import org.springframework.web.servlet.view.velocity.VelocityConfigurer;

import net.common.common.CommandMap;

/**
 *@class name : MailLib.java
 *@description : It's MailLib
 *				 This lib has the ability to send or verify email. 
 *				 MailLib made Singleton Design Patterm. 
 *				 To use MailLib, Create getInstence() method. 
 *
 *				 Default Properties Settings
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
	private Session session;
	private JavaMailSenderImpl javaMailSender = new JavaMailSenderImpl();
	private VelocityConfigurer velocityConfig = new VelocityConfigurer();
	
	private String fromAddress;
	private String fromAddressName = "";
	private String host;
	private String post;
	
	private final String encoding = "UTF-8";
	private final String contentEncoding = "text/html; charset=UTF-8";
	
	private MailLib() {
		velocityConfig.setResourceLoaderPath("Templates/");
	}
	
	private static class MailLibSingleton{
		private static final MailLib instance = new MailLib();
	}
	
	public static MailLib getInstance() {
		return MailLibSingleton.instance;
	}
	
	// 초기화 블록을 사용하여 최초 한번만  Default Setting을 부여한다.
	{
		try {
			property = new Properties();
			
		    // 기본 경로 : /mwav/src/main/resources/googleProperties/googleAccout.properties
		    InputStream inputStream = getClass().getClassLoader().getResourceAsStream("googleProperties/googleAccout.properties");
		    
		    //가져온 property를 읽고 load
		    property.load(inputStream);
		    
		    //전역변수로 등록
		    fromAddress = property.getProperty("mail.smtp.username");
		    fromAddressName = property.getProperty("mail.smtp.nickname");
		    host = property.getProperty("mail.smtp.host");
		    post = property.getProperty("mail.smtp.port");
		    
		    //람다가 안됨; https://stackoverflow.com/questions/26875226/using-a-lambda-expression-in-session
		    //구글 인증 객체 생성
		    session = Session.getDefaultInstance(property, new Authenticator(){
		    	public PasswordAuthentication getPasswordAuthentication() {
		    		return new PasswordAuthentication(property.getProperty("mail.smtp.username"), property.getProperty("mail.smtp.password"));
		    	}
		    });
		    
		    javaMailSender.setSession(session);
		    javaMailSender.setHost(host);
		    javaMailSender.setUsername(property.getProperty("mail.smtp.username"));
		    javaMailSender.setPassword(property.getProperty("mail.smtp.password"));
		    javaMailSender.setJavaMailProperties(property);
		    
			System.out.println("Success, First create MailLib getInstence! And Fist Setting");
			
		} catch (IOException e) {
			System.out.println("Error Fail, First Setting. Please Check your googleProperties/googleAccout.properties !");
			e.printStackTrace();
		}
		
	} 
	
	//이메일 샌더 객체 생성
	private MimeMessage createMimeMessage(){
		return javaMailSender.createMimeMessage();
	}
	
	// 템플릿 html 가져오기
	private String getVeloTemplate(Map map, String templatePath) throws VelocityException, IOException{
		return VelocityEngineUtils.mergeTemplateIntoString(velocityConfig.createVelocityEngine(), templatePath, encoding, map);
	}
	
	// MimeMessage객체로 이메일 발송
	private boolean sendEmail(MimeMessage msg){
		boolean check = false;
		try{
			javaMailSender.send(msg);
			check = true;
		}catch(MailException msgErr){
			System.out.println("이메일 발송 에러 - " + msgErr.getMessage());
			msgErr.printStackTrace();
		}
		return check;
	}
	
	// MimeMessageHelper객체로 이메일 발송
	private boolean sendEmail(MimeMessageHelper msg){
		boolean check = false;
		try{
			javaMailSender.send(msg.getMimeMessage());
			check = true;
		}catch(MailException msgErr){
			System.out.println("이메일 발송 에러 - " + msgErr.getMessage());
			msgErr.printStackTrace();
		}
		return check;
	}
	
	public void sendEmailAction(String Subject, String HtmlContents, File file, String toAddress){

		try {
			MimeMessage message = createMimeMessage();
			
			MimeMessageHelper msg = new MimeMessageHelper(message, true, encoding);
				
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("TempPw", "테스트입니다.");
			
			String veloTemplate = getVeloTemplate(map, "GeneralMail/PWSeekEmail.vm");

			msg.setSubject(Subject);
			msg.setTo(toAddress);
			msg.setFrom(fromAddress);
			msg.setText(veloTemplate, true);
			
			javaMailSender.send(message);
			
		} catch (MessagingException e) {
			System.out.println("MessagingException - ERROR " + e.getMessage());
		} catch (VelocityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public void sendCreatePassword(CommandMap commandMap) throws Exception {
		
		String mbrEmail = (String) commandMap.get("mbrEmail");
		String mbrTempLoginPw = (String) commandMap.get("mbrTempLoginPw");
		String mbrLoginId = (String) commandMap.get("mbrLoginId");
		
		MimeMessageHelper msg = new MimeMessageHelper(createMimeMessage(), true, encoding);
		
		msg.setSubject("Mwav 홈페이지 " + mbrLoginId + "님 [임시비밀번호]발급 메일입니다.");

		msg.setFrom(fromAddress);
		msg.setTo(mbrEmail);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("TempPw", mbrTempLoginPw);
		msg.setText(getVeloTemplate(map, "GeneralMail/PWSeekEmail.vm"), true);
		
		sendEmail(msg);
	}
	
	
}

