package net.common.common;

import net.mwav.common.module.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.mail.Message;
import javax.servlet.ServletContext;
import java.util.Date;

@Controller
@RequestMapping("/accounts/email")
public class AccountEmailCertify {

    @Autowired
    ServletContext servletContext;

    private final String EncryptKey = "EncryptKey";

    /**
     * <pre>description : 이메일 인증 발송과 동시에 이메일 인증 확인 페이지로 포워딩</pre>
     * @param id
     * @param account
     * @return
     * @throws Exception
     */
    @RequestMapping("/certify")
    public String certify(@RequestParam(required = true) String email,
                          @RequestParam(required = true) String account,
                          @RequestParam(required = true) String id) throws Exception {
        // 이메일 설정 불러오기
        final String realPath = servletContext.getRealPath("/xConfig/mail.xml.config");
        XmlLib xmlLib = XmlLib.getInstance();
        MailConfig config = (MailConfig) xmlLib.unmarshal(realPath, MailConfig.class);

        // id 및 account, time 이중 암호화
        SecurityLib securityLib = SecurityLib.getInstance();
        String encryptAccount = securityLib.encryptToString(EncryptKey, "account", account);
        String encryptId = securityLib.encryptToString(EncryptKey, "id", id);
        String encryptTime = securityLib.encryptToString(EncryptKey, "time", String.valueOf(new Date().getTime()));

        String encryptQuery = securityLib.encryptToString(EncryptKey, "total", encryptAccount + encryptId + encryptTime);

        // 이메일 양식 작성
        Message msg = new MessageBuilder(config.getCollectAllFieldProp())
                                    .setRecipient(email)
                                    .setFrom("tony950620@gmail.com")
                                    .setSubject("이메일 인증 요청")
                                    .setContent("<h1>이메일 인증</h1> <br> " + encryptQuery).build();

        // 메일 발송
        MailLib mailLib = MailLib.getInstance();
        mailLib.send(msg);

        return "checkEmail";
    }

}
