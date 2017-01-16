package net.common.common;

import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/MessageView")
public class ErrorController {
	Logger log = Logger.getLogger(this.getClass());
	
	@RequestMapping(value = "/throwable.mwav")
	public String throwable(Model model,
			HttpServletRequest request) throws Exception {
		
		log.info("throwable");
		pageErrorLog(request);
		model.addAttribute("msg", "예외가 발생하였습니다.");

		return "/MessageView/error";
	}
	
	@RequestMapping(value = "/exception.mwav")
	public String exception(Model model,
			HttpServletRequest request) throws Exception {
		
		log.info("exception");
		pageErrorLog(request);
		model.addAttribute("msg", "예외가 발생하였습니다.");

		return "/MessageView/error";
	}
	
	@RequestMapping(value = "/400.mwav")
	public String pageError400(Model model,
			HttpServletRequest request) throws Exception {
		
		log.info("page error code 400");
		pageErrorLog(request);
		model.addAttribute("msg", "잘못된 요청입니다.");

		return "/MessageView/error";
	}
	
	@RequestMapping(value = "/403.mwav")
	public String pageError403(Model model,
			HttpServletRequest request) throws Exception {
		
		log.info("page error code 403");
		pageErrorLog(request);
		model.addAttribute("msg", "잘못된 요청입니다.");

		return "/MessageView/error";
	}

	
	@RequestMapping(value = "/404.mwav")
	public String pageError404(Model model,
			HttpServletRequest request) throws Exception {
		System.out.println("고고");
		log.info("page error code 404");
		pageErrorLog(request);
		model.addAttribute("msg", "잘못된 요청입니다.");

		return "/MessageView/error";
	}

	@RequestMapping(value = "/405.mwav")
	public String pageError405(Model model,
			HttpServletRequest request) throws Exception {
		
		log.info("page error code 405");
		pageErrorLog(request);
		model.addAttribute("msg", "잘못된 요청입니다.");

		return "/MessageView/error";
	}
	
	@RequestMapping(value = "/500.mwav")
	public String pageError500(Model model,
			HttpServletRequest request) throws Exception {
		
		log.info("page error code 500");
		pageErrorLog(request);
		model.addAttribute("msg", "잘못된 요청입니다.");

		return "/MessageView/error";
	}
	
	@RequestMapping(value = "/503.mwav")
	public String pageError503(Model model,
			HttpServletRequest request) throws Exception {
		
		log.info("page error code 503");
		pageErrorLog(request);
		model.addAttribute("msg", "잘못된 요청입니다.");

		return "/MessageView/error";
	}
	
	private void pageErrorLog(HttpServletRequest request){
		log.info("status_code : " +request.getAttribute("javax.servlet.error.status.code"));
		log.info("exception_type : " +request.getAttribute("javax.servlet.error.exception_type"));
		log.info("message : " +request.getAttribute("javax.servlet.error.message"));
		log.info("request_uri : " +request.getAttribute("javax.servlet.error.request_uri"));
		log.info("exception : " +request.getAttribute("javax.servlet.error.exception"));
		log.info("servlet_name : " +request.getAttribute("javax.servlet.error.servlet_name"));
	}
	
}