package net.mwav.common.module;

import java.io.UnsupportedEncodingException;

import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.MailParseException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public class EmailTemplates {
	// Autowired 관련 http://expert0226.tistory.com/195

	@Autowired
	protected JavaMailSender mailSender; //해당 인터페이스는 MimeMessage 객체를 생성해주는 createMimeMessage() 메서드를 제공
	MimeMessage msg = null;

	public void sendBasicEmail(EmailVO email) throws Exception {
		msg = mailSender.createMimeMessage(); //MimeMessage 객체 생성

		try {
			System.out.println("1" + email.getSubject());
			System.out.println("2" + email.getContent());
			System.out.println("3" + email.getReceiver());
			System.out
					.println("4" + InternetAddress.parse(email.getReceiver()));

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
			// 상세내용을 알수 있따.
			e.printStackTrace();
		}
	}

	// 파일 또는 이미지 첨부
	public void sendMailWithAttachment(EmailVO email)
			throws UnsupportedEncodingException {
		msg = mailSender.createMimeMessage();

		try {
			MimeMessageHelper messageHelper = new MimeMessageHelper(msg, true,
					"UTF-8");
			messageHelper.setSubject("[공지] 회원 가입 안내");
			String htmlContent = "<strong>안녕하세요</strong>, 반갑습니다.";
			messageHelper.setText(htmlContent, true);
			messageHelper.setFrom("gz.kyungho@gmail.com", "갱짱");
			messageHelper.setTo(new InternetAddress(email.getReceiver(), email
					.getName(), "UTF-8"));
			DataSource dataSource = new FileDataSource("c:\\Users\\김주성\\Desktop\\123.txt");
			messageHelper.addAttachment(
					MimeUtility.encodeText("책목록.xlsx", "UTF-8", "B"),
					dataSource);

		} catch (MessagingException e) {
			throw new MailParseException(e);
		}
		mailSender.send(msg);
	}

	// 이메일 내 파일 또는 이미지 삽입
	public void sendMailInAttachment(EmailVO email)
			throws UnsupportedEncodingException {
		msg = mailSender.createMimeMessage();

		try {
			MimeMessageHelper messageHelper = new MimeMessageHelper(msg, true,
					"UTF-8");
			messageHelper.setSubject("[공지] 회원 가입 안내");
			String htmlContent = "<strong>안녕하세요</strong>, 반갑습니다." + "<img src="
					+ "http://mwav.net/Images/CompanyLogos/CompanyLogo.gif" + ">";
			messageHelper.setText(htmlContent, true);
			messageHelper.setFrom("ebizpromwav@gmail.com", "Mwav");
			messageHelper.setTo(new InternetAddress(email.getReceiver(), email
					.getName(), "UTF-8"));
			messageHelper.addInline("첨부파일", new FileDataSource("c:\\Users\\김주성\\Desktop\\123.txt"));

		} catch (MessagingException e) {
			throw new MailParseException(e);
		}
		mailSender.send(msg);
	}
}