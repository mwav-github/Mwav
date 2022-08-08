package net.newmember.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
//        ModelAndView mav = new ModelAndView();
//        mav.setViewName("NewMember/SignUp/form");
        ModelAndView mv = new ModelAndView("/Admins/form");
        return mv;
    }

}
