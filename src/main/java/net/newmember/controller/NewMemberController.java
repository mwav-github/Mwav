package net.newmember.controller;

import net.mwav.common.module.MailConfig;
import net.mwav.common.module.MailLib;
import net.mwav.common.module.MessageBuilder;
import net.mwav.common.module.XmlLib;
import net.newmember.service.NewMemberService;
import net.newmember.vo.NewMemberVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.velocity.VelocityEngineUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.velocity.VelocityConfigurer;

import javax.inject.Inject;
import javax.mail.Message;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/newMember")
public class NewMemberController {

    @Inject
    private NewMemberService service;

    @Inject
    ServletContext servletContext;

    @Inject
    VelocityConfigurer velocityConfig;

    private final String EncryptKey = "EncryptKey";

    private static final Logger logger = LoggerFactory.getLogger(NewMemberController.class);

    /**
     * 신규멤버 등록 폼 forwarding
     * @return viewName
     */
    @RequestMapping(value = "/signUp")
    public ModelAndView signUpForm(){
        ModelAndView mv = new ModelAndView("/NewMember/SignUp/form");
        return mv;
    }

    /**
     * 신규 멤버 form 등록
     * @param vo
     * @return viewName
     */
    @RequestMapping(value = "register", method = RequestMethod.POST)
    public ModelAndView signUpRegister(@RequestBody NewMemberVO vo
                                        , HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/NewMember/SignUp/form");

        vo.setRemoteAddr(request.getRemoteAddr());
        vo.setXFF(request.getHeader("X-Forwarded-For"));
        vo.setReferer(request.getHeader("Referer"));
        vo.setUserAgent(request.getHeader("User-Agent"));

        // 가입성공 = Y, 가입실패 = N
        boolean registerYN = service.signUpRegister(vo);

        return mv;
    }

    /**
     * 신규가입 접수시 mwavmaster에게 메일 발송
     * @param vo
     * @return viewName
     */
    @RequestMapping("/emailSend")
    public ResponseEntity<Map<String, String>> emailSend(@RequestBody NewMemberVO vo
                                                        , HttpServletResponse res) throws Exception {
        Map<String, String> body = new HashMap<String, String>();

        // 이메일 설정 불러오기
        final String realPath = servletContext.getRealPath("/xConfig/mail.xml.config");
        XmlLib xmlLib = XmlLib.getInstance();
        MailConfig config = (MailConfig) xmlLib.unmarshal(realPath, MailConfig.class);

        // 이메일 양식 작성
        Map<String, Object> map = new HashMap<String, Object>();

        //client에서 템플릿엔진 라이브러리르 호출하여 html코드로 파싱 후 문자열로 반환
        // TODO: 메일 템플릿 추가 필요
        String content = VelocityEngineUtils.mergeTemplateIntoString(velocityConfig.createVelocityEngine(), "/GeneralMail/AccountCertify.vm", "UTF-8", map);

        // 이메일 템플릿 작성 필요
        Message msg = new MessageBuilder(config.getCollectAllFieldProp()).setRecipient(vo.getEmail()).setFrom(config.getFrom()).setSubject("[Mwav] 이메일 인증").setContent(content).build();

        // 메일 발송
        MailLib mailLib = MailLib.getInstance();
        mailLib.send(msg);

        //  메일 발송 성공여부를 status와 msg를 통해 넘겨줌
        body.put("status", "SEND_MAIL");
        body.put("msg", "인증 메일을 발송하였습니다.");
        return new ResponseEntity<>(body, HttpStatus.OK);
    }

}
