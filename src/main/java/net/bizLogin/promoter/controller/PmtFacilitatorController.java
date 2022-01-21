package net.bizLogin.promoter.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.model.OAuth2AccessToken;
import net.bizLogin.promoter.auth.PmtNaverUrl;
import net.bizLogin.promoter.service.PmtFacilitatorService;
import net.bizLogin.promoter.vo.PmtFacilitatorSO;
import net.bizLogin.promoter.vo.PmtFacilitatorVO;
import net.common.common.CommandMap;
import net.common.common.Status;
import net.mwav.common.module.Common_Utils;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.client.methods.RequestBuilder;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Map;


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

	@Autowired
	PmtNaverUrl pmtNaverUrl;

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
		// 1. MaV의 View를 정의하여 성공시 로그인 페이지로 리다이렉트
		ModelAndView mv = new ModelAndView("redirect:/Promoter/Facilitator/PmtLogin.mwav");

		// 2. PromoterValueLog_tbl 로그를 위해 최초 IP를 map에 등록
		commandMap.put("pvlIpAddress", request.getRemoteAddr());

		// 3. 비즈니스 로직 실행
		final Map<String, Object> pmtFormResult = pmtFacilitatorService.insertPmtForm(commandMap);

		// 4. Model에 Attribute 등록
		// TODO : 등록 후 mode, mm 쿼리스트링 수정필요
		mv.addAllObjects(pmtFormResult);
		mv.addObject("mm", "firms");
		mv.addObject("mode", "m_stfForm");

		// 5. 이메일 발송
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

	@RequestMapping("/promoter/naver/signin.mwav")
//	@ResponseBody
	public String callbackNaverUrl(@RequestParam String code, @RequestParam String state, HttpSession session, HttpServletRequest request) throws Exception {

		// 1. code를 이용해서 access_token 받아오기
		// 2. access_token을 이용해서 사용자 profile 정보 가져오기
//		PmtNaverUrl pmtNaverUrlUtil = new PmtNaverUrl();
		OAuth2AccessToken accessToken = pmtNaverUrl.getAccessToken(state, code);
		String userProfile = pmtNaverUrl.getUserProfile(accessToken);

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> userProfileMap = mapper.readValue(userProfile, Map.class);

		System.out.println("userProfileMap = " + userProfileMap);

		// 3. DB 해당 유저가 존재하는지 체크
		if (userProfileMap.get("resultcode").equals("00")) {
			Map<String, Object> ufResult = (Map<String, Object>) userProfileMap.get("response");

			int check = pmtFacilitatorService.checkNaverAccount(ufResult);

			// 4. 존재 시 강제로그인, 미 존재시 가입하고 로그인
			if (check == 0) pmtFacilitatorService.saveNaverAccount(ufResult, request);

		}
		return "redirect:/Promoter/Index.mwav";
	}
}
