package net.mwav.mail;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;

public class EmailSender {
	//Autowired 관련 http://expert0226.tistory.com/195

	@Autowired
	protected JavaMailSender mailSender;

	public void SendEmail(EmailVO email) throws Exception {
		MimeMessage msg = null;
		msg = mailSender.createMimeMessage();
		try {
			System.out.println("1"+email.getSubject());
			System.out.println("2"+email.getContent());
			System.out.println("3"+email.getReceiver());
			System.out.println("4"+InternetAddress.parse(email.getReceiver()));
			
			msg.setSubject(email.getSubject());
			msg.setText(email.getContent());
			msg.setFrom(new InternetAddress("ebizpromwav@gmail.com"));
			msg.setRecipients(MimeMessage.RecipientType.TO,
					InternetAddress.parse(email.getReceiver()));
		} catch (MessagingException e) {
			e.printStackTrace();
			System.out.println("MessagingException");
		}
		try {
			mailSender.send(msg);

		} catch (MailException e) {
			System.out.println("MailException발생");
			//상세내용을 알수 있따.
			e.printStackTrace();
		}
	}
}