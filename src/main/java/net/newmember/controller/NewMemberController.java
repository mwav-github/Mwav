package net.newmember.controller;

import net.newmember.service.NewMemberService;
import net.newmember.vo.NewMemberVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/newMember")
public class NewMemberController {

    @Inject
    private NewMemberService service;

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
    public ModelAndView signUpRegister(NewMemberVO vo, HttpServletRequest request){
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

}
