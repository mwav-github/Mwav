package net.common.common;

import net.mwav.common.module.MailLib;
import net.mwav.common.module.MessageBuilder;
import net.mwav.common.module.SecurityLib;
import org.aspectj.org.eclipse.jdt.internal.eval.IRequestor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.mail.Message;
import javax.mail.MessagingException;
import java.io.UnsupportedEncodingException;
import java.util.Properties;

@Controller
public class AccountEmailCertify {

    @RequestMapping("/certify")
    public String certify(@RequestParam(required = true) String id,
                            @RequestParam(required = true) String account) throws UnsupportedEncodingException, MessagingException {

        SecurityLib securityLib = SecurityLib.getInstance();

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.user", "tony950620@gmail.com");
        props.put("mail.smtp.password", "fkttfondlwbuppqu");

        Message msg = new MessageBuilder(props)
                                    .setRecipient("tony950620@naver.com")
                                    .setFrom("tony950620@gmail.com")
                                    .setSubject("제목")
                                    .setContent("컨텐츠").build();

        MailLib mailLib = MailLib.getInstance();
        mailLib.send(msg);

        return "accountCertify";
    }

}
