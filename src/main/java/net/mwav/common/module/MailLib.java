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

public class MailLib {

	MimeMessage msg = null;
	
	public MailLib(){
		
	}

	public MailLib initializeSession(Properties props){
		//초기 MimeMessage 작업시 필요
		Session session = Session.getDefaultInstance(props,  new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(props.getProperty("user"), props.getProperty("password"));
			}
		});
		this.msg = new MimeMessage(session);
		return this;
	}
	
	//발신자
	public MailLib setFrom(String address, String recipentName) throws UnsupportedEncodingException, MessagingException{
		this.msg.setFrom(new InternetAddress(address, recipentName));
		return this;
	}
	
	//받는 사람
	public MailLib setRecipient(String address, String recipentName) throws UnsupportedEncodingException, MessagingException{
		this.msg.addRecipient(Message.RecipientType.TO, new InternetAddress(address, recipentName));
//	    msg.addRecipient(Message.RecipientType.CC, new InternetAddress("ggg@hhh.co.kr", "의자왕"));
		return this;
	}
	
	//제목
	public MailLib setSubject(String subject) throws MessagingException{
		this.msg.setSubject(subject);
		return this;
	}
	
	//본문
	public MailLib setContent(String content) throws MessagingException{
		this.msg.setContent(content, "text/html; charset=utf-8");
		return this;
	}
	
	//메세지 발송. boolean를 사용하여 보냄여부를 한번 더 체크
	public boolean send() throws Exception{
		boolean check = false;
		
	    try {
			Transport.send(this.msg);
			check = true;
		} catch (Exception e) {
			throw e;
		}
	    
	    return check;
	}
	
}
