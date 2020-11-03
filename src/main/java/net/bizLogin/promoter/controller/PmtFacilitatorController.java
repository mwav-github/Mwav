package net.bizLogin.promoter.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
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

	
	/**
		 * 메서드에 대한 설명
		 * <pre>
		 * {@code
		 * // 예제코드 작성
		 * 
		 * }
		 * </pre>
		 * @param param1 parameter에 대한 설명(필수)
	             * @param param2
		 * @return return 값에 대한 설명(필수)
		 * @throws Exception 발생하는 예외에 대한 설명(필수) 
	 * @see 해당 메서드와 연관된 메서드
	 * @since 작성 버전
	 * @version 현재 버전
	*/
	@RequestMapping(value = "/sample/abcd.mwav")
	public ModelAndView openBoardList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/sample/boardList");

		pmtFacilitatorService.insertBoard(commandMap.getMap());

		return mv;
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
