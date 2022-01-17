package net.common.common;

import net.mwav.common.module.Common_Utils;
import net.mwav.member.auth.naver.NaverUrlBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Enumeration;

@Controller
public class FrontCommonController {
	private static final Logger logger = LoggerFactory.getLogger(FrontCommonController.class);

	Common_Utils cou = new Common_Utils();
	String mode;

	@Inject
	NaverUrlBuilder naverUrlBuilder;

	/*
	 * ========================================등록================================
	 * ========
	 * 
	 * 실행시 아래는 오류가 아니다. Exception이 발생된 상황이 아니라 HandlerMapping에 의해 등록된
	 * Controller의 메소드 정보를 표시한 것으로 정상입니다.
	 * 
	 * 예) ic org.springframework.web.servlet.ModelAndView
	 * net.common.common.FrontCommonController
	 * .redirectIndexController(javax.servlet.http.HttpServletRequest) throws
	 * java.lang.Exception]
	 */
	String ext_url = null;

	@RequestMapping(value = { "/", "/Index" })
	public ModelAndView redirectIndexController(HttpServletRequest request) throws Exception {
		ModelAndView mv = null;

		try {
			String url = request.getRequestURI();
			int pos = url.lastIndexOf(".");

			// Root 인경우
			if (pos != -1) {
				ext_url = url.substring(0, pos);
				mv = new ModelAndView(ext_url);
			}
			// Index 인경우
			else {
				mv = new ModelAndView("/Index");
			}

		}

		catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	@RequestMapping(value = { "/Shop/Index" })
	public ModelAndView redirectShopIndexController(HttpServletRequest request) throws Exception {
		String url = request.getRequestURI();
		int pos = url.lastIndexOf(".");
		ext_url = url.substring(0, pos);
		ModelAndView mv = new ModelAndView(ext_url);

		return mv;
	}

	// 1번 bnsForm : Form 입력만 가능 (뒤로가기, list)
	@RequestMapping(value = "/hightsofts/hightsofts.mwav")
	public ModelAndView highsots(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/CompanyItem/ITProducts/HighSofts/HighSofts");
		String items = (String) commandMap.get("items");

		if (items.equals("Highcharts")) {
			mv.addObject("item", "Highcharts");

			mv.addObject("demo_1", "combo-dual-axes-default");
			mv.addObject("demo_2", "areaspline-default");
			mv.addObject("demo_3", "column-drilldown-default");
			mv.addObject("demo_4", "3d-pie-default");

			mv.addObject("demo_1_text", "Dual axes, line and column");
			mv.addObject("demo_2_text", "Area-spline");
			mv.addObject("demo_3_text", "Column with drilldown");
			mv.addObject("demo_4_text", "3D pie");

		} else if (items.equals("Highstock")) {

			mv.addObject("item", "Highstock");

			mv.addObject("demo_1", "compare-default");
			mv.addObject("demo_2", "intraday-area-default");
			mv.addObject("demo_3", "markers-only-default");
			mv.addObject("demo_4", "candlestick-default");

			mv.addObject("demo_1_text", "Compare multiple series");
			mv.addObject("demo_2_text", "Intraday area");
			mv.addObject("demo_3_text", "Point markers only");
			mv.addObject("demo_4_text", "Candlestick");
		} else if (items.equals("Highmaps")) {

			mv.addObject("item", "Highmaps");

			mv.addObject("demo_1", "all-maps-default");
			mv.addObject("demo_2", "map-drilldown-default");
			mv.addObject("demo_3", "geojson-default");
			mv.addObject("demo_4", "map-bubble-default");

			mv.addObject("demo_1_text", "Overview");
			mv.addObject("demo_2_text", "Drilldown");
			mv.addObject("demo_3_text", "GetJSON areas");
			mv.addObject("demo_4_text", "Map bubble");

		}
		return mv;
	}

	@RequestMapping(value = "/CompanyItem/**")
	public ModelAndView redirectCompanyItemController(HttpServletRequest request) throws Exception {
		String url = request.getRequestURI();
		int pos = url.lastIndexOf(".");
		ext_url = url.substring(0, pos);
		ModelAndView mv = new ModelAndView(ext_url);

		return mv;
	}

	@RequestMapping(value = "/CustomerService/**")
	public ModelAndView redirectCustomerServiceItemController(HttpServletRequest request) throws Exception {
		String url = request.getRequestURI();
		int pos = url.lastIndexOf(".");
		ext_url = url.substring(0, pos);

		ModelAndView mv = new ModelAndView(ext_url);

		return mv;
	}

	@RequestMapping(value = "/Promoter/**")
	public ModelAndView redirectPromoterController(HttpServletRequest request) throws Exception {
		String url = request.getRequestURI();
		int pos = url.lastIndexOf(".");
		ext_url = url.substring(0, pos);
		ModelAndView mv = new ModelAndView(ext_url);

		return mv;
	}

	@RequestMapping(value = "/filter.mwav", method = RequestMethod.GET)
	public ModelAndView filter(HttpServletRequest request) {
		String param = (String) request.getParameter("param");

		ModelAndView mv = new ModelAndView("/filter");
		mv.addObject("param1", param);
		return mv;
	}

	@RequestMapping(value = "/Company/**")
	public ModelAndView redirectCompanyController(HttpServletRequest request) throws Exception {
		String url = request.getRequestURI();
		int pos = url.lastIndexOf(".");
		ext_url = url.substring(0, pos);
		ModelAndView mv = new ModelAndView(ext_url);

		return mv;
	}

	@RequestMapping(value = "/Admins/**")
	public ModelAndView redirectAdminsController(HttpServletRequest request) throws Exception {
		String url = request.getRequestURI();
		int pos = url.lastIndexOf(".");
		ext_url = url.substring(0, pos);
		ModelAndView mv = new ModelAndView(ext_url);

		return mv;
	}

	@RequestMapping(value = "/Templates/**")
	public ModelAndView redirectTemplatesController(HttpServletRequest request) throws Exception {
		String url = request.getRequestURI();
		int pos = url.lastIndexOf(".");
		ext_url = url.substring(0, pos);
		ModelAndView mv = new ModelAndView(ext_url);

		return mv;
	}

	/**
	 * 로그인 페이지 호출
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/MasterPage")
	public ModelAndView redirectMasterPageController(HttpSession session, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("/MasterPage");
		Enumeration<?> param = request.getParameterNames();

		while (param.hasMoreElements()) {
			String paramName = (String) param.nextElement();
			mv.addObject(paramName, request.getParameter(paramName));
		}

		String naverAuthUrl = naverUrlBuilder.getAuthorizationUrl(session);
		mv.addObject("naver_url", naverAuthUrl);

		return mv;
	}

	@RequestMapping(value = "/MasterPage_1")
	public ModelAndView redirectMasterPage1Controller(HttpServletRequest request) throws Exception {
		String url = request.getRequestURI();
		int pos = url.lastIndexOf(".");
		ext_url = url.substring(0, pos);
		ModelAndView mv = new ModelAndView(ext_url);

		return mv;
	}

	// 미적용 + 파라미터 붙여서 넘길수있게 ㅎㅎ
	public ModelAndView redirectController(HttpServletRequest request, String url) throws Exception {
		ModelAndView mv = new ModelAndView("/CompanyItem/ITProducts/HighSofts/HighSofts");

		return mv;
	}
}