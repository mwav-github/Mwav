package net.common.common;

import net.mwav.common.module.*;
import net.promoter.dao.PromoterDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.mail.Message;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.StringTokenizer;

@Controller
@RequestMapping("/accounts/email")
public class AccountEmailCertify {

    @Autowired
    ServletContext servletContext;

    @Autowired
    PromoterDAO promoterDAO;

    private final String EncryptKey = "EncryptKey";

    /**
     * <pre>description : 이메일 인증 발송과 동시에 이메일 인증 확인 페이지로 포워딩</pre>
     * @param id    :   Member, Promoter의 LoginId
     * @param account   : Member, Promoter 등의 구분자 (member or promoter)
     * @return
     * @throws Exception
     */
    @RequestMapping("/certify")
    public String certify(@RequestParam(required = true) String email,
                          @RequestParam(required = true) String account,
                          @RequestParam(required = true) String id,
                        HttpServletResponse res,
                        Model model) throws Exception {
        String view = "SendEmail";

        // 구분자에 맞춰 DB에서 인증여부 검색
        switch (account){
            case "promoter" :
                if(promoterDAO.selectChkPmtCertifyDt(id) != null){
                    model.addAttribute("status", "pmtLogin");
                    model.addAttribute("msg", "이미 인증받은 사용자입니다<br>로그인 페이지로 이동합니다.");
                    return view;
                }
                break;
            case "member" : break;  // Member는 미구현
            default: res.setStatus(HttpServletResponse.SC_BAD_REQUEST); //잘못된 구분값이 온다면 400 반환
        }

        // 이메일 설정 불러오기
        final String realPath = servletContext.getRealPath("/xConfig/mail.xml.config");
        XmlLib xmlLib = XmlLib.getInstance();
        MailConfig config = (MailConfig) xmlLib.unmarshal(realPath, MailConfig.class);

        // id 및 account, time 이중 암호화
        // TODO: IV 하드코딩, 별도의 관리 필요
        SecurityLib securityLib = SecurityLib.getInstance();
        String encryptAccount = securityLib.encryptToString(EncryptKey, "account", account);
        String encryptId = securityLib.encryptToString(EncryptKey, "id", id);
        String encryptTime = securityLib.encryptToString(EncryptKey, "time", String.valueOf(new Date().getTime()));

        String encryptQuery = securityLib.encryptToString(EncryptKey, "total", encryptAccount + encryptId + encryptTime);
        encryptQuery = encryptQuery.replaceAll("/","~");


        // 이메일 양식 작성
        // TODO: 이메일 템플릿 작성 필요
        Message msg = new MessageBuilder(config.getCollectAllFieldProp())
                                    .setRecipient(email)
                                    .setFrom("tony950620@gmail.com")
                                    .setSubject("이메일 인증 요청")
                                    .setContent("<h1>이메일 인증</h1> <br> " + encryptQuery).build();

        // 메일 발송
        MailLib mailLib = MailLib.getInstance();
        mailLib.send(msg);

        model.addAttribute("status", "sendMail");
        model.addAttribute("msg", "인증 메일을 발송하였습니다.");
        return view;
    }

    @RequestMapping("/authority/{key}")
    public String authority(@PathVariable(value = "key") String key
                        , Model model
                        , HttpServletResponse res) throws Exception {
        String view = "CheckCertify";

        // TODO: IV 하드코딩, 별도의 관리 필요
        String[] ivList = {"account", "id", "time"};
        Map<String, String> keyMap = new HashMap<String, String>();

        // path로 받은 key를 복호화
        SecurityLib securityLib = SecurityLib.getInstance();

        key = key.replaceAll("~","/");
        final String decryptKey = securityLib.decryptToString(EncryptKey, "total", key);

        // key를 분배 후 복호화하여 map에 등록
        StringTokenizer tokenizer = new StringTokenizer(decryptKey, "==");

        int index = 0;
        while(tokenizer.hasMoreTokens()){
            keyMap.put(ivList[index], securityLib.decryptToString(EncryptKey, ivList[index], tokenizer.nextToken()+"=="));
            index+=1;
        }

        // 구분자에 맞춰 DB에서 인증여부 검색
        switch (keyMap.get("account")){
            case "promoter" :
                if(promoterDAO.selectChkPmtCertifyDt(keyMap.get("id")) != null){
                    model.addAttribute("msg", "이미 인증받은 사용자입니다.");
                    return view;
                }
                break;
            case "member" : break;  // Member는 미구현
            default: res.setStatus(HttpServletResponse.SC_BAD_REQUEST); //잘못된 구분값이 온다면 400 반환
        }

        promoterDAO.updatePmtCertifyDt(keyMap.get("id"));

        model.addAttribute("msg", "이메일 인증되었습니다.");
       return view;
    }

}
