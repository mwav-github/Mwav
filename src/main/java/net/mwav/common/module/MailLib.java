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
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.MimeMessage;

import org.apache.velocity.exception.VelocityException;
import org.springframework.mail.MailException;
import org.springframework.mail.MailParseException;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.ui.velocity.VelocityEngineUtils;
import org.springframework.web.servlet.view.velocity.VelocityConfigurer;

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
		//init set, Template ResourceLoaderPath
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
	
	/** 
	 * @method name : createMimeMessage
	 * @author : (정) 공태현
	             (부)
	 * @since  : 2019. 7. 22.
	 * @version : v1.0
	 * @see :
	 * @description : Create an MimeMessage instance with JavaMailSenderImpl
	 * @history :
	   ----------------------------------------
	   * Modification Information(개정이력)
	   ----------------------------------------
	   수정일     수정자        수정내용
	   --------    --------    ----------------
	   2019. 7. 22.     gong tae hyun     
	 * @param :
	 * @return : MimeMessage
	 * @throws : 
	 <pre>
	 * {@code : 
	 * createMimeMessage();
	 * } 
	 </pre>
	*/
	private MimeMessage createMimeMessage(){
		return javaMailSender.createMimeMessage();
	}
	
	/** 
	 * @method name : getVeloTemplate
	 * @author : (정) 공태현
	             (부)
	 * @since  : 2019. 7. 22.
	 * @version : v1.0
	 * @see :
	 * @description : HTML and *.vm file rendering for TemplateEngine
	 * @history :
	   ----------------------------------------
	   * Modification Information(개정이력)
	   ----------------------------------------
	   수정일     수정자        수정내용
	   --------    --------    ----------------
	   2019. 7. 22.     gong tae hyun     
	 * @param : map - key, value
	 * 			templatePath - HTML and *.vm file Path
	 * @return : String
	 * @throws : 
	 <pre>
	 * {@code : 예제 코드 작성
	 * DateUtil.addYearMonthDay("19810828", 0, 0, 19)  = "19810916"
	 * } 
	 </pre>
	*/
	private String getVeloTemplate(Map map, String templatePath) throws VelocityException, IOException{
		return VelocityEngineUtils.mergeTemplateIntoString(velocityConfig.createVelocityEngine(), templatePath, encoding, map);
	}
	
	/** 
	 * @method name : sendEmail
	 * @author : (정) 공태현
	             (부)
	 * @since  : 2019. 7. 22.
	 * @version : v1.0
	 * @see :
	 * @description :
	 * @history :
	   ----------------------------------------
	   * Modification Information(개정이력)
	   ----------------------------------------
	   수정일     수정자        수정내용
	   --------    --------    ----------------
	   2019. 7. 22.     gong tae hyun     
	 * @param : msg - MimeMessageHelper
	 * @return :
	 * @throws : 
	 <pre>
	 * {@code : 예제 코드 작성
	 * sendEmail(msg);
	 * } 
	 </pre>
	*/
	private void sendEmail(MimeMessageHelper msg){
		try{
			javaMailSender.send(msg.getMimeMessage());
		}catch(MailException msgErr){
			System.out.println("이메일 발송 에러 - " + msgErr.getMessage());
			msgErr.printStackTrace();
		}
	}
	
	/** 
	 * @method name : emailRequiredSet
	 * @author : (정) 공태현
	             (부)
	 * @since  : 2019. 7. 22.
	 * @version : v1.0
	 * @see :
	 * @description : require minimal setting for send.
	 * 				  overloading emailRequiredSet method
	 * @history :
	   ----------------------------------------
	   * Modification Information(개정이력)
	   ----------------------------------------
	   수정일     수정자        수정내용
	   --------    --------    ----------------
	   2019. 7. 22.     gong tae hyun     
	 * @param : msg - MimeMessageHelper
	 *          toAddress - Recipient Email Address
	 *          subject - email subject
	 *          contents - html format code or String
	 *          htmlYN - true or false
	 * @return :
	 * @throws : 
	 <pre>
	 * {@code : 
	 * emailRequiredSet(msg, "GildongHong@gmail.com", "This is Testing email", "<h1>Testing email.</h1>", true);
	 * } 
	 </pre>
	*/
	private void emailRequiredSet(MimeMessageHelper msg, String toAddress
			, String subject, String contents, boolean htmlYN) throws UnsupportedEncodingException, MessagingException{
		msg.setFrom(fromAddress, fromAddressName);
		msg.setSubject(subject);
		msg.setTo(toAddress);
		msg.setText(contents, htmlYN);
	}

	//이메일 발신을 위한 최소한의 셋팅, Template을 렌더링 후 반환값으로 메일에 적용 
	//모든 발신 메소드들은 이 메소드를 필수로 실행해야한다. emailRequiredSet OVERLOADING
	/** 
	 * @method name : emailRequiredSet
	 * @author : (정) 공태현
	             (부)
	 * @since  : 2019. 7. 22.
	 * @version : v1.0
	 * @see :
	 * @description : require minimal setting for send.
	 * 				  rendering templatePath
	 * 				  overloading emailRequiredSet method.
	 * @history :
	   ----------------------------------------
	   * Modification Information(개정이력)
	   ----------------------------------------
	   수정일     수정자        수정내용
	   --------    --------    ----------------
	   2019. 7. 22.     gong tae hyun     
	 * @param : msg - MimeMessageHelper
	 *          toAddress - Recipient Email Address
	 *          subject - email subject
	 *          templatePath - html or *.vm file Path
	 *          map - template Variable
	 * @return :
	 * @throws : 
	 <pre>
	 * {@code : 
	 * emailRequiredSet(msg, "GildongHong@gmail.com", "This is Testing email", "/GeneralMail/PWSeekEmail.vm", map);
	 * } 
	 </pre>
	*/
	private void emailRequiredSet(MimeMessageHelper msg, String toAddress, 
			String subject, String templatePath, Map map) throws MessagingException, VelocityException, IOException {
		msg.setFrom(fromAddress, fromAddressName);
		msg.setSubject(subject);
		msg.setTo(toAddress);
		msg.setText(getVeloTemplate(map, templatePath), true);
	}
	
	/** 
	 * @method name : sendTempPassword
	 * @author : (정) 공태현
	             (부)
	 * @since  : 2019. 7. 22.
	 * @version : v1.0
	 * @see :
	 * @description : Send a temp password email.
	 * @history :
	   ----------------------------------------
	   * Modification Information(개정이력)
	   ----------------------------------------
	   수정일     수정자        수정내용
	   --------    --------    ----------------
	   2019. 7. 22.     gong tae hyun     
	 * @param : toAddress - Recipient Email Address
	 *          TempLoginPw - encrypted Password
	 *          loginId - Recipient UserId
	 * @return :
	 * @throws : 
	 <pre>
	 * {@code :
	 * sendTempPassword("GildongHong@gmail.com", "q1w2e3!@#", "Gildong");
	 * } 
	 </pre>
	*/
	public void sendTempPassword(String toAddress, String TempLoginPw, String loginId) throws Exception {
		
		MimeMessageHelper msg = new MimeMessageHelper(createMimeMessage(), true, encoding);
		
		//password set
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("TempPw", TempLoginPw);
		
		//email require setting
		emailRequiredSet(msg
					   , toAddress
					   , "Mwav 홈페이지 " + loginId + "님 [임시비밀번호]발급 메일입니다."
					   , "/GeneralMail/PWSeekEmail.vm"
					   , map);
		
		//send email
		sendEmail(msg);
	}
	
	/** 
	 * @method name : sendRegistrationEmail
	 * @author : (정) 공태현
	             (부)
	 * @since  : 2019. 7. 22.
	 * @version : v1.0
	 * @see :
	 * @description : Send a join successed email. after member register and sendAlertEmail method run.
	 * @history :
	   ----------------------------------------
	   * Modification Information(개정이력)
	   ----------------------------------------
	   수정일     수정자        수정내용
	   --------    --------    ----------------
	   2019. 7. 22.     gong tae hyun     
	 * @param : toAddress - Recipient Email Address
	 *          loginId - Recipient UserId
	 * @return :
	 * @throws : 
	 <pre>
	 * {@code : 
	 * sendRegistrationEmail("GildongHong@gmail.com", "Gildong");
	 * } 
	 </pre>
	*/
	public void sendRegistrationEmail(String toAddress, String loginId) throws Exception {
		
		MimeMessageHelper msg = new MimeMessageHelper(createMimeMessage(), true, encoding);
		
		//email require setting		
		emailRequiredSet(msg
				      , toAddress
				      , "[Mwav]" + loginId + "님, 회원가입을 환영합니다."
				      , "/GeneralMail/GeneralMail_Registration.vm"
				      , null);
		
		sendEmail(msg);
		sendAlertEmail("\"" + loginId + "\" 회원이 가입되었습니다."); // 관리자 Alert
	}
	
	/** 
	 * @method name : sendQuestionEmail
	 * @author : (정) 공태현
	             (부)
	 * @since  : 2019. 7. 22.
	 * @version : v1.0
	 * @see :
	 * @description : send a Question success email and sendAlertEmail method run.
	 * @history :
	   ----------------------------------------
	   * Modification Information(개정이력)
	   ----------------------------------------
	   수정일     수정자        수정내용
	   --------    --------    ----------------
	   2019. 7. 22.     gong tae hyun     
	 * @param : toAddress - Recipient Email Address
	 *          loginId - Recipient UserId
	 * @return :
	 * @throws : 
	 <pre>
	 * {@code : 
	 * sendQuestionEmail("GildongHong@gmail.com", "Gildong")
	 * } 
	 </pre>
	*/
	public void sendQuestionEmail(String uqUserEmail, String uqUserName) throws Exception {
		
		MimeMessageHelper msg = new MimeMessageHelper(createMimeMessage(), true, encoding);
		
		emailRequiredSet(msg
				       , uqUserEmail
				       , "[접수]_"+ uqUserName + "님 문의해주신 내용이 정상 접수 되었습니다."
				       , "QnAnswer/Question.vm"
				       , null); 
		
		sendEmail(msg);
		
		sendAlertEmail("문의가 접수되었습니다."); // 관리자 Alert
	}
	
	/** 
	 * @method name : sendAlertEmail
	 * @author : (정) 공태현
	             (부)
	 * @since  : 2019. 7. 22.
	 * @version : v1.0
	 * @see :
	 * @description : Send mail to "jusung.kim@mwav.net".
	 * @history :
	   ----------------------------------------
	   * Modification Information(개정이력)
	   ----------------------------------------
	   수정일     수정자        수정내용
	   --------    --------    ----------------
	   2019. 7. 22.     gong tae hyun     
	 * @param : title - mail subject
	 * @return :
	 * @throws : 
	 <pre>
	 * {@code : 
	 * sendAlertEmail("문의가 접수되었습니다.");
	 * } 
	 </pre>
	*/
	public void sendAlertEmail(String title) throws Exception {
		
		MimeMessageHelper msg = new MimeMessageHelper(createMimeMessage(), true, encoding);

		emailRequiredSet(msg
					   , "tony950620@naver.com"//"jusung.kim@mwav.net"
					   , title
					   , "<h1>메일도착</h1>"
					   , true);
		
		sendEmail(msg);
	}
	
	
}

