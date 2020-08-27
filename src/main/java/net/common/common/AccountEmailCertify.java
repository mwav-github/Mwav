package net.common.common;

import net.mwav.common.module.MailConfig;
import net.mwav.common.module.MailLib;
import net.mwav.common.module.MessageBuilder;
import net.mwav.common.module.XmlLib;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.mail.Message;
import javax.servlet.ServletContext;

@Controller
public class AccountEmailCertify {

    @Autowired
    ServletContext servletContext;

    /**
     * <pre>description : 이메일 인증 발송과 동시에 이메일 인증 확인 페이지로 포워딩</pre>
     * @param id
     * @param account
     * @return
     * @throws Exception
     */
    @RequestMapping("/certify")
    public String certify(@RequestParam(required = true) String id,
                          @RequestParam(required = true) String account) throws Exception {
        // 이메일 설정 불러오기
        final String realPath = servletContext.getRealPath("/xConfig/mail.xml.config");

        XmlLib xmlLib = XmlLib.getInstance();
        MailConfig config = (MailConfig) xmlLib.unmarshal(realPath, MailConfig.class);

        // TODO: id 및 account 암호화

        // 이메일 양식 작성
        Message msg = new MessageBuilder(config.getCollectAllFieldProp())
                                    .setRecipient("tony950620@naver.com")
                                    .setFrom("tony950620@gmail.com")
                                    .setSubject("제목2")
                                    .setContent("컨텐츠").build();

        // 메일 발송
        MailLib mailLib = MailLib.getInstance();
        mailLib.send(msg);

        return "accountCertify";
    }

}
