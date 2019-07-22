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
import org.springframework.core.io.ClassPathResource;
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
	private String fromAddressName = "thKong";
	private String host;
	private String post;
	
	private final String encoding = "UTF-8";
	private final String contentEncoding = "text/html; charset=UTF-8";
	
	private MailLib() {
		//velocityConfig.setResourceLoaderPath("Templates/");
		velocityConfig.setResourceLoaderPath("/Templates");
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
	
	// MimeMessageHelper객체로 이메일 발송
	private void sendEmail(MimeMessageHelper msg){
		try{
			javaMailSender.send(msg.getMimeMessage());
		}catch(MailException msgErr){
			System.out.println("이메일 발송 에러 - " + msgErr.getMessage());
			msgErr.printStackTrace();
		}
	}
	
	//이메일 발신을 위한 최소한의 셋팅, 모든 발신 메소드들은 이 메소드를 필수로 실행해야한다.
	private void emailRequiredSet(MimeMessageHelper msg, String toAddress, 
			String subject, String templatePath, Map map) throws MessagingException, VelocityException, IOException {
		msg.setFrom(fromAddress, fromAddressName);
		msg.setSubject(subject);
		msg.setTo(toAddress);
		msg.setText(getVeloTemplate(map, templatePath), true);
	}
	
	//임시 비밀번호 발급
	public void sendCreatePassword(CommandMap commandMap) throws Exception {
		
		String mbrEmail = (String) commandMap.get("mbrEmail");
		String mbrTempLoginPw = (String) commandMap.get("mbrTempLoginPw");
		String mbrLoginId = (String) commandMap.get("mbrLoginId");
		
		MimeMessageHelper msg = new MimeMessageHelper(createMimeMessage(), true, encoding);
		
		//password set
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("TempPw", mbrTempLoginPw);
		
		//email require setting
		emailRequiredSet(msg
					   , mbrEmail
					   , "Mwav 홈페이지 " + mbrLoginId + "님 [임시비밀번호]발급 메일입니다."
					   , "/GeneralMail/PWSeekEmail.vm"
					   , map);
		
		//send email
		sendEmail(msg);
	}
	
	// 멤버 회원가입시 이메일 발송
	public void sendRegistrationEmail(Map<String, Object> map) throws Exception {
		
		MimeMessageHelper msg = new MimeMessageHelper(createMimeMessage(), true, encoding);
		
		//email require setting		
		emailRequiredSet(msg
				      , (String) map.get("mbrEmail")
				      , "[Mwav]" + (String) map.get("mbrLoginId") + "님, 회원가입을 환영합니다."
				      , "/GeneralMail/GeneralMail_Registration.vm"
				      , map);
		
		sendEmail(msg);
		//emailTemplates.sendAlertEmail("회원이 가입되었습니다."); // 관리자 Alert
	}
	
	// 질문 메일 발신?
	public void sendQuestionEmail(Map<String, Object> map) throws Exception {
		
		MimeMessageHelper msg = new MimeMessageHelper(createMimeMessage(), true, encoding);
		
		emailRequiredSet(msg
				       , (String) map.get("uqUserEmail")
				       , "[접수]_"+(String) map.get("uqUserName") + "님 문의해주신 내용이 정상 접수 되었습니다."
				       , "QnAnswer/Question.vm"
				       , map); 
		
		sendEmail(msg);
//		emailTemplates.sendAlertEmail("문의가 접수되었습니다."); // 관리자 Alert
	}
	
	
}

