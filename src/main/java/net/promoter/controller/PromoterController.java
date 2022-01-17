package net.promoter.controller;

import net.common.common.CommandMap;
import net.mwav.common.module.AesEncryption;
import net.mwav.common.module.Common_Utils;
import net.mwav.common.module.Paging;
import net.mwav.common.module.PagingVO;
import net.promoter.service.PromoterService;
import net.promoter.vo.Promoter_VO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Collections;
import java.util.List;
import java.util.Map;

@Controller
public class PromoterController {
	private static final Logger logger = LoggerFactory.getLogger(PromoterController.class);

	String mode;

	@Inject
	private PromoterService promoterService;

	@RequestMapping(value = "/Promoter/Index")
	public ModelAndView redirectAdminsPmtController(HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView("/Promoter/Index");
		mv.addObject("promoter_id", "10001000");
		return mv;
	}

	@RequestMapping(value = "/Promoter/ProductList")
	public ModelAndView redirectAdminsPmtGoodsController(HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView("/Promoter/Goods/GoodsList");
		return mv;
	}

	/*---------------단순 페이지이동           -----------*/
	//프로모터 로그인, tiles에 영향 안받음
	@RequestMapping(value = "/pmt/pmtLoginForm.mwav", method = RequestMethod.GET)
	public String selectLogin(CommandMap commandMap, HttpServletRequest request) throws Exception {
		return "/AdminPmt/Promoters/PmtLogin";
	}

	//프로모터 회원가입
	@RequestMapping(value = "/Promoter/promoter-add.mwav")
	public String insertPromoter(CommandMap commandMap, HttpServletRequest request) throws Exception {

		String pmtUpperPromoId = (String) commandMap.get("p");

		byte[] decrypted = AesEncryption.hexToByteArray(pmtUpperPromoId);

		// AES/ECB 복호화
		decrypted = AesEncryption.aesDecryptEcb(AesEncryption.sKey, decrypted);
		logger.debug("암호화 : " + pmtUpperPromoId);
		logger.debug("복호화 : " + new String(decrypted, "UTF-8"));

		//암호화된 추천인 아이디를 넘겨준다.
		request.setAttribute("p", pmtUpperPromoId);

		return "/AdminPmt/Promoters/PmtForm";
	}

	@RequestMapping(value = "/Promoter/Policy")
	public ModelAndView PromoterPolicy(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/Promoter/PmtPolicy");
		return mv;
	}

	@RequestMapping(value = "/Promoter/URLShorten")
	public ModelAndView PromoterShorten(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/Promoter/URLShorten");
		return mv;
	}

	@RequestMapping(value = "/promoter/viewMyPoint.mwav", method = RequestMethod.GET)
	public ModelAndView viewMyPoint(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/Promoter/PmtMyPoint");

		return mv;
	}

	/*---------------  로그인 및 회원가입           -----------*/

	//로그인
	@RequestMapping(value = "/pmt/pmtLogin.mwav", method = RequestMethod.POST)
	public ModelAndView selectLoginPro(CommandMap commandMap, HttpServletRequest request, RedirectAttributes rtr) throws Exception {
		ModelAndView mv = new ModelAndView("/AdminPmt/Promoters/PmtLogin");
		Promoter_VO promoter = null;
		Map<String, Object> pmt = commandMap.getMap();
		if (((String) pmt.get("pmtLoginPw")).length() < 3 || ((String) pmt.get("pmtLoginId")).length() < 3) {
			rtr.addFlashAttribute("msg", "비밀번호와 아이디를 확인해주세요");
			return mv;
		}
		promoter = (Promoter_VO) promoterService.selectPmtLogin(commandMap.getMap());
		if (promoter == null) {
			logger.debug("프로모터 로그인 실패");
			rtr.addFlashAttribute("msg", "비밀번호와 아이디를 확인해주세요");
		} else {
			logger.debug("프로모터 로그인 성공");
			logger.debug("password= " + promoter.getPmtLoginPw());
			request.getSession().setAttribute("promoterId", promoter.getPromoter_id());
		}
		return mv;
	}

	//회원가입시 유효성체크 ajax 처리 매핑
	//이 매핑 Interceptor는 ajax 사용을 위하여 제외 -> action-servlet.xml 
	@RequestMapping(value = "/promoter/pmtLoginIdCheck.mwav")
	public void selectOnePmtIdCheck(HttpServletRequest request, HttpServletResponse response, String type, String value) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		int selectIdCheck = promoterService.selectOnePmtLoginIdCheck(value);

		response.getWriter().println(selectIdCheck);
	}

	//Promoter 회원가입 
	@RequestMapping(value = "/promoter/PmtForm.mwav", method = RequestMethod.POST)
	public ModelAndView insertPmtForm(CommandMap commandMap, RedirectAttributes rtr, Promoter_VO promoter, Errors errors, HttpServletRequest request) throws Exception {

		String pmtRcmderId = promoter.getPmtRcmderId();
		byte[] decrypted = AesEncryption.hexToByteArray(promoter.getPmtRcmderId());

		int result = 0;
		String ViewName = "";

		try {
			// 추천인은 AES/ECB 복호화 후 vo에 넣는다.
			decrypted = AesEncryption.aesDecryptEcb(AesEncryption.sKey, decrypted);
			promoter.setPmtRcmderId(new String(decrypted, "UTF-8"));

			result = promoterService.insertPmtForm(promoter);
		} catch (NullPointerException err) {
			//잘못된 추천인아이디 
			result = -1;
		}

		ModelAndView mv = new ModelAndView();

		if (result == 1) { // 회원가입 성공시 로그인페이지로 보낸다.
			mv.addObject("status", "1"); // 로그인페이지에 status를 넘긴다.
			ViewName = "/AdminPmt/Promoters/PmtLogin";

		} else { // 실패시 다시 회원가입페이지로 보낸다.
			mv.addObject("pmtUpperPromoId", pmtRcmderId); //쿼리스트링에 추천인 아이디를 남긴다.
			mv.addObject("status", "-1");
			ViewName = "redirect:/Promoter/promoter-add.mwav";
		}

		mv.setViewName(ViewName);

		return mv;
	}

	//Promoter 회원가입 
	@RequestMapping(value = "/promoter/test.mwav")
	public ModelAndView testController(CommandMap commandMap, RedirectAttributes rtr, Promoter_VO promoter, Errors errors, HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView();
		mv.addObject("statusTest", "1"); // 로그인페이지에 status를 넘긴다.
		rtr.addFlashAttribute("statusTest", "1");

		mv.setViewName("redirect:/Promoter/promoter-add.mwav");

		return mv;
	}

	//??
	@RequestMapping(value = "/Promoter/PmtList.mwav")
	public ModelAndView selectListPmtList(CommandMap commandMap, HttpServletRequest request, HttpServletResponse reponse) throws Exception {
		ModelAndView mv = new ModelAndView("/Promoter/PmtList");

		String pageNum = (String) commandMap.get("pageNum");
		Paging paging = new Paging();
		if (pageNum == null) {
			pageNum = "1";
		}
		logger.debug("pageNum=" + pageNum);
		int totalRow = promoterService.selectOneGetTotalCount();
		logger.debug("totalRow=" + totalRow);

		// Paging pv = new Paging(pageNum, 10 , 10, totalCount);
		List<Map<String, Object>> selectListPmtList;
		PagingVO pagingVO = paging.setPagingInfo(totalRow, 5, pageNum); // 총 숫자,
																		// 한페이지에
																		// 노출 수
		commandMap.put("startRow", paging.getStartRow(pageNum)); // 시작 열
		commandMap.put("endRow", paging.getEndRow(pageNum)); // 끝 열
		if (totalRow > 0) {
			logger.debug("전체행의 갯수 1이상");
			selectListPmtList = promoterService.selectListPmtList(commandMap.getMap());
			// selectboardList = boardService.selectbnsList(commandMap.getMap());

		} else {
			selectListPmtList = Collections.emptyList();
		}
		mv.addObject("selectListPmtList", selectListPmtList);
		mv.addObject("pagingVO", pagingVO);
		mv.addObject("totalRow", totalRow);

		String mm = "firms";
		mv.addObject("mm", mm);
		mv.addObject("mode", "m_stfList");

		// mv.addObject("paging", pv.print());
		return mv;
	}

	// update

	/**
	 * @param commandMap
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/promoter/updatePmtForm.mwave")
	public ModelAndView updatePmtForm(CommandMap commandMap, HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView("/Promoter/PmtForm2");

		mode = "PmtUpdate";
		HttpSession session = request.getSession();

		/*		Promoter_VO promoter = (Promoter_VO) session.getAttribute("admin");
				commandMap.put("member_id", promoter.getPromoter_id());*/
		// 위의 view랑 동일하게 사용
		commandMap.put("promoter_id", request.getParameter("promoter_id"));
		Promoter_VO promoter = promoterService.selectOnePmtInfo((String) commandMap.getMap().get("promoter_id"));
		if (promoter != null) {
			logger.debug("mode 출력" + mode);
			mv.addObject("mode", mode);
			mv.addObject("updatePmtForm", promoter);
		}
		return mv;

	}

	@RequestMapping(value = "/promoter/PmtUpdatePro.mwav", method = RequestMethod.POST)
	public String PmtUpdatePro(CommandMap commandMap, HttpServletRequest request) throws Exception {
		//1번 상황 성공 2번 실패 3번 비밀번호 값이 다름
		int result = 1;
		String pmtPw1 = (String) commandMap.get("pmtLogiNewPw");
		String pmtPw2 = (String) commandMap.get("pmtLogiNewPw");
		if (!pmtPw1.equals("") && pmtPw1 != null) { //첫번째 비밀번호와 두번째 비밀번호가 같을경우 수정
			if (pmtPw1.equalsIgnoreCase(pmtPw2))
				commandMap.put("pmtNewPw", pmtPw1);
			logger.debug("비밀번호가 다름");
		}

		promoterService.updatePmtPro(commandMap.getMap());
		ModelAndView mv = new ModelAndView("/Promoter/PmtForm");
		return "redirect:/promoter/pmtList.mwav";
	}

}
