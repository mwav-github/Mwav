package net.mwav.common.module;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailLib extends MimeMessage{

	public MailLib(Session session) {
		super(session);
	}

	// properties로 정보를 받고 session생성후 MimeMessage를 상속받은 MailLib를 넘겨줌.
	public static MailLib createMessage(Properties props){
		//초기 MimeMessage 작업시 필요
		Session session = Session.getDefaultInstance(props,  new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(props.getProperty("user"), props.getProperty("password"));
			}
		});
		return new MailLib(session);
	}
	
	//발신자
	public MailLib setFrom(String address, String recipentName) throws UnsupportedEncodingException, MessagingException{
		super.setFrom(new InternetAddress(address, recipentName));
		return this;
	}
	
	//받는 사람
	public MailLib setRecipient(String address, String recipentName) throws UnsupportedEncodingException, MessagingException{
		super.addRecipient(Message.RecipientType.TO, new InternetAddress(address, recipentName));
//	    msg.addRecipient(Message.RecipientType.CC, new InternetAddress("ggg@hhh.co.kr", "의자왕"));
		return this;
	}
	
	//제목 subject에서 title로 변경.. MimeMessage 클래스와 메소드 충돌...
	public MailLib setTitle(String subject) throws MessagingException{
		super.setSubject(subject);
		return this;
	}
	
	//본문
	public MailLib setContent(String content) throws MessagingException{
		super.setContent(content, "text/html; charset=utf-8");
		return this;
	}
	
	//메세지 발송. boolean를 사용하여 보냄여부를 한번 더 체크
	public boolean send() throws Exception{
		boolean check = false;
		
	    try {
			Transport.send(this);
			check = true;
		} catch (Exception e) {
			throw e;
		}
	    
	    return check;
	}
	
}
