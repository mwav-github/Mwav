package net.mwav.common.module;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import org.apache.velocity.app.VelocityEngine;
import org.springframework.ui.velocity.VelocityEngineUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.view.velocity.VelocityConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.MailException;
import org.springframework.mail.MailParseException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;

public class EmailTemplates {
	// Autowired 관련 http://expert0226.tistory.com/195

	// MailSender 인터페이스를 상속받은 JavaMailSender는 Java Mail API의 MimeMessage를 이용해서
	// 메일을 발송하는 추가적인 기능 정의
	// - 메일 발송 기능을 위한 MailSender 인터페이스 제공
	// 여기서 setMailSender로 하면 에러난다.
	// @Autowired로 없이, 빈 EmailTemplates 내 <property name="mailSender"
	// ref="mailSender"/> 되어야한다.
	@Autowired
	private JavaMailSender mailSender; // 해당 인터페이스는 MimeMessage 객체를 생성해주는
										// createMimeMessage() 메서드를 제공

	@Autowired
	private VelocityConfig velocityConfig;

	@Autowired
	private EmailVO email;

	Common_Utils cu = new Common_Utils();

	MimeMessage msg = null;

	// 회원가입시 발송
	public void sendVelocityEmail(final EmailVO email) throws Exception {
		// Do the business calculations...

		// Call the collaborators to persist the order.
		MimeMessagePreparator preparator = new MimeMessagePreparator() {

			public void prepare(MimeMessage mimeMessage) throws Exception {

				MimeMessageHelper message = new MimeMessageHelper(mimeMessage,
						true, "utf-8");

				String veloTemplate = VelocityEngineUtils
						.mergeTemplateIntoString(
								velocityConfig.getVelocityEngine(),
								email.getVeloTemplate(), "UTF-8",
								email.getEmailMap());
				message.setSubject(email.getSubject());
				message.setFrom(email.getFrom());
				message.setTo(email.getReceiver());
				// 중요!! true 안하면 plain/text로 인식한다. true는 파일첨부 포함 multipart
				// 아니면 message.setText(htmlContent, "UTF-8", "html"); 로 설정

				/*
				 * #이미지내 파일 삽입 FileSystemResource css = new
				 * FileSystemResource(new File(
				 * "/resources/CommonLibrary/CSS/mwav_style.css"));
				 * message.addInline("css", css);
				 * 
				 * #첨부파일 DataSource dataSource = new
				 * FileDataSource("c:\\책목록.xlsx");
				 * message.addAttachment(MimeUtility.encodeText("책목록.xlsx",
				 * "UTF-8", "B"), dataSource);
				 */

				// setText(String text, boolean html)
				// Set the given text directly as content in non-multipart mode
				// or as default body part in multipart mode

				if (StringUtils.isEmpty(email.getHtmlYn()) == false
						&& email.getHtmlYn().equals("Y")) {
					message.setText(veloTemplate, true);
				} else {
					message.setText(veloTemplate);
				}
				// helper.setTo(reciever);
			}
		};

		try {
			this.mailSender.send(preparator);

		} catch (Exception e) {
			System.out.println("MailException발생");
			// 상세내용을 알수 있따.
			e.printStackTrace();
		}
	}

	public void sendBasicEmail(EmailVO email) throws Exception {
		try {
			System.out.println("mailSender"+mailSender);
			System.out.println("출력"+mailSender.createMimeMessage());
			msg = mailSender.createMimeMessage(); // MimeMessage 객체 생성

			msg.setSubject(email.getSubject());
			msg.setText(email.getContent());
			msg.setFrom(new InternetAddress("webmaster@mwav.net"));
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
			/*
			 * messageHelper.setTo(new InternetAddress(email.getReceiver(),
			 * email .getName(), "UTF-8"));
			 */
			DataSource dataSource = new FileDataSource(
					"c:\\Users\\김주성\\Desktop\\123.txt");
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
					+ "http://mwav.net/Images/CompanyLogos/CompanyLogo.gif"
					+ ">";
			messageHelper.setText(htmlContent, true);
			messageHelper.setFrom("ebizpromwav@gmail.com", "Mwav");
			/*
			 * messageHelper.setTo(new InternetAddress(email.getReceiver(),
			 * email .getName(), "UTF-8"));
			 */
			messageHelper.addInline("첨부파일", new FileDataSource(
					"c:\\Users\\김주성\\Desktop\\123.txt"));

		} catch (MessagingException e) {
			throw new MailParseException(e);
		}
		mailSender.send(msg);
	}
}