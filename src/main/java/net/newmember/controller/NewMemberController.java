package net.newmember.controller;

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
    public ModelAndView signUpRegister(){
        ModelAndView mv = new ModelAndView("/NewMember/SignUp/form");
        logger.debug("register Controller connect");
        return mv;
    }

}
