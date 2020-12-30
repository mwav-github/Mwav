package net.bizLogin.promoter.controller;

import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.promoter.vo.Promoter_VO;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.client.methods.RequestBuilder;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.log4j.Logger;
import org.apache.maven.model.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.bizLogin.promoter.service.PmtFacilitatorService;
import net.bizLogin.promoter.vo.PmtFacilitatorSO;
import net.bizLogin.promoter.vo.PmtFacilitatorVO;
import net.common.common.CommandMap;
import net.common.common.Status;
import net.mwav.common.module.Common_Utils;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


/**
 *  해당 클래스에 대한 설명을 기입 <p>
 *  줄 구분을 위해서는 <p> 태그 사용
 * <pre>
 * {@code
 * // 예제코드 작성
 * 
 * }
 * </pre>
 * @author 저자1
 * @author 저자2
 * @since 작성 버전
 * @version 현재 버전
 * @see 참고해야할 package 혹은 method
 * @see java.util.Arrays#copyOf(byte[], int)
 * @see #method(String)
 */
@Controller
public class PmtFacilitatorController {
	Logger log = Logger.getLogger(this.getClass());


	String mode;
	@Resource(name = "pmtFacilitatorService")
	private PmtFacilitatorService pmtFacilitatorService;
	
	Common_Utils cu = new Common_Utils();

	//로그인
	@RequestMapping(value = "/Promoter/Facilitator/pmtFacilitatorLogin.mwav",method = RequestMethod.POST)
	public ModelAndView selectLoginPro(CommandMap commandMap, HttpServletRequest request, RedirectAttributes rtr) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/Promoter/Index");
		PmtFacilitatorVO pmtFacilitator = null;
		Map<String, Object> pmt = commandMap.getMap();
		if( ((String) pmt.get("pmtLoginPw")).length()<3 || ((String) pmt.get("pmtLoginId")).length()<3 ){
			rtr.addFlashAttribute("msg", "비밀번호와 아이디를 확인해주세요");
			return mv;
		}
		pmtFacilitator = (PmtFacilitatorVO)pmtFacilitatorService.selectPmtFacLogin(commandMap.getMap());
		if(pmtFacilitator==null){
			log.info("프로모터 로그인 실패");
			rtr.addFlashAttribute("msg", "비밀번호와 아이디를 확인해주세요");
		}
		else {
			log.info("프로모터 로그인 성공");
			request.getSession().setAttribute("promoterId",pmtFacilitator.getPromoter_id() );
		}
		return mv;
	}
	/**
	 * 메서드에 대한 설명
	 * <pre>
	 * </pre>
	 * @param CommandMap parameter에 대한 설명(필수)
	 * @param param2
	 * @return return 값에 대한 설명(필수)
	 * @throws Exception 발생하는 예외에 대한 설명(필수)
	 * @see 해당 메서드와 연관된 메서드
	 * @since 21st/Oct/2020
	 * @version v1.0.0
	 */
	@RequestMapping(value = "/bizLogin/promoter/facilitator/pmtForm.mwav", method = RequestMethod.POST)
	public ModelAndView pmtFacilitatorInsert(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/Promoter/Facilitator/PmtLogin.mwav");

		// PromoterValueLog_tbl 로그를 위해 최초 IP입력
		commandMap.put("pvlIpAddress", request.getRemoteAddr());
		pmtFacilitatorService.insertPmtForm(commandMap);


		// TODO : 등록 후 mode, mm 쿼리스트링 수정필요
		mv.addObject("mm", "firms");
		mv.addObject("mode", "m_stfForm");

		final String uri = "http://localhost:8080/accounts/email/certify";
		HttpClient client = HttpClientBuilder.create().build();
		HttpUriRequest req = RequestBuilder.post()
				.setUri(uri)
				.addParameter("email", (String)commandMap.get("pmtMail"))
				.addParameter("account","pmt")
				.addParameter("id",(String)commandMap.get("pmtLoginId"))
				.build();
		HttpResponse response = client.execute(req);
		int statusCode = response.getStatusLine().getStatusCode();
//		if statusCode == 200 {
//			return mv;
//		}
		return mv;


	}
	/*
        return
            true : 중복된 아이디가 없음으로 가입이 가능함
            false: 이미 존재하는 아이디가 있으므로 가입이 불가능함
     */
	@RequestMapping(value="/bizLogin/promoter/facilitator/pmtLoginIdCheck.mwav")
	public @ResponseBody
	boolean selectOneMbrPmtIdCheck(String pmtLoginId) throws Exception {
		return pmtFacilitatorService.selectOnePmtLoginIdCheck(pmtLoginId);
	}
	
	@RequestMapping(value = "/Promoter/Index.mwav")
	public String index(CommandMap commandMap) throws Exception {
		return "/Promoter/Index";
	}
	
	@RequestMapping(value = "/promoter/kakaoLogin.mwav", method = RequestMethod.POST)
	public @ResponseBody String promoterKakaoLogin(@RequestBody PmtFacilitatorSO so, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		so.setSpIpAddress(cu.getClientIP(request));
		PmtFacilitatorVO pmtFacilitatorVO = pmtFacilitatorService.joinSocialLogin(so);
		session.setAttribute("promoter", pmtFacilitatorVO);
		return pmtFacilitatorVO.getSpPromoterId();
	}
	
	@RequestMapping(value = "/promoter/kakaoLogout.mwav")
	@ResponseBody
	public Status promoterKakaoLogout(HttpServletRequest request, HttpSession session, HttpServletResponse response) throws Exception {
		Object obj = session.getAttribute("promoter");
		
		if (obj != null) {
			session.removeAttribute("promoter");
			session.invalidate();
			log.info("promoter session remove");
		} else {
			log.info("세션에 프로모터 로그인 정보가 없어 로그아웃하지 못하였습니다");
		}
		return Status.OK;
	}
}
