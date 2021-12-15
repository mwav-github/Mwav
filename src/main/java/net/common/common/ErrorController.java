package net.common.common;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 예외 페이지 처리
 * 추후 @ControllerAdivce로 변경예정
 * @author 78371
 *
 */
@Controller
@RequestMapping("/MessageView")
public class ErrorController {

	private static final Logger logger = LoggerFactory.getLogger(ErrorController.class);

	@RequestMapping(value = "/throwable.mwav")
	public String throwable(Model model, HttpServletRequest request) throws Exception {
		logger.info("throwable");
		pageErrorLog(request);
		model.addAttribute("msg", "예외가 발생하였습니다.");

		return "/MessageView/error";
	}

	@RequestMapping(value = "/exception.mwav")
	public String exception(Model model, HttpServletRequest request) throws Exception {
		logger.info("exception");
		pageErrorLog(request);
		model.addAttribute("msg", "예외가 발생하였습니다.");

		return "/MessageView/error";
	}

	@RequestMapping(value = "/400.mwav")
	public String pageError400(Model model, HttpServletRequest request) throws Exception {
		logger.info("page error code 400");
		pageErrorLog(request);
		model.addAttribute("msg", "잘못된 요청입니다.");

		return "/MessageView/error";
	}

	@RequestMapping(value = "/403.mwav")
	public String pageError403(Model model, HttpServletRequest request) throws Exception {
		logger.info("page error code 403");
		pageErrorLog(request);
		model.addAttribute("msg", "잘못된 요청입니다.");

		return "/MessageView/error";
	}

	@RequestMapping(value = "/404.mwav")
	public String pageError404(Model model, HttpServletRequest request) throws Exception {
		logger.info("page error code 404");
		pageErrorLog(request);
		model.addAttribute("msg", "잘못된 요청입니다.");

		return "/MessageView/error";
	}

	@RequestMapping(value = "/405.mwav")
	public String pageError405(Model model, HttpServletRequest request) throws Exception {
		logger.info("page error code 405");
		pageErrorLog(request);
		model.addAttribute("msg", "잘못된 요청입니다.");

		return "/MessageView/error";
	}

	@RequestMapping(value = "/500.mwav")
	public String pageError500(Model model, HttpServletRequest request) throws Exception {
		logger.info("page error code 500");
		pageErrorLog(request);
		model.addAttribute("msg", "잘못된 요청입니다.");

		return "/MessageView/error";
	}

	@RequestMapping(value = "/503.mwav")
	public String pageError503(Model model, HttpServletRequest request) throws Exception {
		logger.info("page error code 503");
		pageErrorLog(request);
		model.addAttribute("msg", "잘못된 요청입니다.");

		return "/MessageView/error";
	}

	private void pageErrorLog(HttpServletRequest request) {
		logger.info("status_code : " + request.getAttribute("javax.servlet.error.status.code"));
		logger.info("exception_type : " + request.getAttribute("javax.servlet.error.exception_type"));
		logger.info("message : " + request.getAttribute("javax.servlet.error.message"));
		logger.info("request_uri : " + request.getAttribute("javax.servlet.error.request_uri"));
		logger.info("exception : " + request.getAttribute("javax.servlet.error.exception"));
		logger.info("servlet_name : " + request.getAttribute("javax.servlet.error.servlet_name"));
	}

}