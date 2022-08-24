package net.newmember.controller;

import net.newmember.vo.NewMemberVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/newMember")
public class NewMemberController {

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

    @RequestMapping(value = "register", method = RequestMethod.POST)
    public ModelAndView signUpRegister(NewMemberVO vo){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/NewMember/SignUp/form");

        System.out.println("테스트 - " + vo.getName());

        return mv;
    }

}
