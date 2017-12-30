package net.promoter.controller;

import java.io.PrintWriter;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.common.common.CommandMap;
import net.mwav.common.module.Common_Utils;
import net.mwav.common.module.Paging;
import net.mwav.common.module.PagingVO;
import net.promoter.service.PromoterService;
import net.promoter.vo.Promoter_VO;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class PromoterController {
	Logger log = Logger.getLogger(this.getClass());

	Common_Utils cou = new Common_Utils();

	String mode;

	@Resource(name = "promoterService")
	private PromoterService promoterService;

	@RequestMapping(value = "/promoter/proForm.mwav")
	public ModelAndView test(CommandMap commandMap,
			HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("/Promoter/PmtForm2");
		return mv;
	}


	@RequestMapping(value = "/promoter/pmtLogin.mwav",method = RequestMethod.GET)
	public ModelAndView selectLogin(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/Promoter/PmtLogin");

		String mm = "firms";
		mv.addObject("mm", mm);
		mv.addObject("test1","end1");
		mv.addObject("test2","end2");
		mv.addObject("mode", "m_PmtForm");
		return mv;

	}


    @RequestMapping(value="/promoter/pmtLoginIdCheck.mwav")
	public void selectOnePmtIdCheck(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String pmtLoginId = request.getParameter("LoginId");

		boolean selectIdCheck = promoterService.selectOnePmtLoginIdCheck(pmtLoginId);

		response.setContentType("text/html;charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		PrintWriter out = response.getWriter();
		// id 중복 처리

		String result = null;
		System.out.println("selectIdCheck" + selectIdCheck);
		if (selectIdCheck == true) {
			// 응답 메세지 1 : 이미 등록된 ID 입니다.
			// 이때 pw 규칙 알려주기
			result = "<div class='alert alert-danger text-left'><strong>이미 등록된 ID 입니다. 재 입력해주세요.<br>"
					+ "<strong>1. 4 ~ 20 자 사이의 문자길이 <br> 2. 첫 문자는 영어로 시작 <br> 3. 특수문자 사용금지 (제외문자: . _ -) <br> 4. 공백문자 사용금지  <br> 5. 대소문자는 식별이 가능하나 구분 및 구별을 하지 않음</strong></strong></div>";
		} else {
			// 응답 메세지 2 : 사용할 수 있는 ID 입니다.
			result = "<div class='alert alert-success text-left'><strong>사용할 수 있는 ID 입니다.</strong></div>";
		}
		out.println(result);
		// response.getWriter().print(result); 주석풀면 3번 나온다.
		// response.getWriter().print(result);
	}

	@RequestMapping(value = "/promoter/pmtList.mwav")
	public ModelAndView selectListPmtList(CommandMap commandMap,
			HttpServletRequest request, HttpServletResponse reponse)
			throws Exception {
		ModelAndView mv = new ModelAndView("/Promoter/PmtList");

		String pageNum = (String) commandMap.get("pageNum");
		Paging paging = new Paging();
		if (pageNum == null) {
			pageNum = "1";
		}
		System.out.println("pageNum=" + pageNum);
		int totalRow = promoterService.selectOneGetTotalCount();
		System.out.println("totalRow=" + totalRow);

		// Paging pv = new Paging(pageNum, 10 , 10, totalCount);
		List<Map<String, Object>> selectListPmtList;
		PagingVO pagingVO = paging.setPagingInfo(totalRow, 5, pageNum); // 총 숫자,
																		// 한페이지에
																		// 노출 수
		commandMap.put("startRow", paging.getStartRow(pageNum)); // 시작 열
		commandMap.put("endRow", paging.getEndRow(pageNum)); // 끝 열
		if (totalRow > 0) {
			System.out.println("전체행의 갯수 1이상");
			selectListPmtList = promoterService.selectListPmtList(commandMap
					.getMap());
			// selectboardList = boardService.selectbnsList(commandMap.getMap());

		} else {
			selectListPmtList = Collections.emptyList();
		}
		System.out.println("찍히낭");

		mv.addObject("selectListPmtList", selectListPmtList);
		mv.addObject("pagingVO", pagingVO);
		mv.addObject("totalRow", totalRow);

		String mm = "firms";
		mv.addObject("mm", mm);
		mv.addObject("mode", "m_stfList");

		// mv.addObject("paging", pv.print());
		return mv;
	}

	@RequestMapping(value = "/promoter/PmtForm.mwav",method = RequestMethod.POST )
	public ModelAndView insertPmtForm(CommandMap commandMap,RedirectAttributes rttr,
		Promoter_VO promoter,Errors errors) throws Exception {
		ModelAndView mv = new ModelAndView("/Promoter/PmtForm2");

		if(errors.hasFieldErrors("pmtPhone")){
			errors.rejectValue("pmtPhone", "핸드폰 ","핸드폰 번호가 없습니다");
			return mv;
		}


		log.info("순서");
		log.info("인터셉터 테스트");
		String PmtCellularP_1 = (String) commandMap.get("pmtCellularP_1");
		String PmtCellularP_2 = (String) commandMap.get("pmtCellularP_2");
		String PmtCellularP_3 = (String) commandMap.get("pmtCellularP_3");

		String PmtCellularP = PmtCellularP_1 + PmtCellularP_2 + PmtCellularP_3;
		commandMap.put("pmtCellularP", PmtCellularP);

		String PmtPhone_1 = (String) commandMap.get("pmtPhone_1");
		String PmtPhone_2 = (String) commandMap.get("pmtPhone_2");
		String PmtPhone_3 = (String) commandMap.get("pmtPhone_3");

		String PmtPhone = PmtPhone_1 + PmtPhone_2 + PmtPhone_3;
		commandMap.put("pmtPhone", PmtPhone);

		String PmtAddress_1 = (String) commandMap.get("pmtAddress_1");
		String PmtAddress_2 = (String) commandMap.get("pmtAddress_2");

		String PmtAddress = PmtAddress_1 + PmtAddress_2;
		log.info("pmtAddress=" + PmtAddress);

		commandMap.put("pmtAddress", PmtAddress);


		promoterService.insertPmtForm(commandMap.getMap());
		mv.setViewName("redirect:/promoter/pmtLogin.mwav");
		rttr.addFlashAttribute("msg", "SUCCESS");

		return mv;
	}

	/*@RequestMapping(value = "/promoter/PmtForm.mwav",method = RequestMethod.POST )
	public ModelAndView insertPmtForm(CommandMap commandMap,RedirectAttributes rttr,
			 Promoter_VO promoter) throws Exception {
		ModelAndView mv = new ModelAndView("/Promoter/PmtLogin");

		log.info("순서");
		log.info("인터셉터 테스트");
		String PmtCellularP_1 = (String) commandMap.get("pmtCellularP_1");
		String PmtCellularP_2 = (String) commandMap.get("pmtCellularP_2");
		String PmtCellularP_3 = (String) commandMap.get("pmtCellularP_3");

		String PmtCellularP = PmtCellularP_1 + PmtCellularP_2 + PmtCellularP_3;
		commandMap.put("pmtCellularP", PmtCellularP);

		String PmtPhone_1 = (String) commandMap.get("pmtPhone_1");
		String PmtPhone_2 = (String) commandMap.get("pmtPhone_2");
		String PmtPhone_3 = (String) commandMap.get("pmtPhone_3");

		String PmtPhone = PmtPhone_1 + PmtPhone_2 + PmtPhone_3;
		commandMap.put("pmtPhone", PmtPhone);

		String PmtAddress_1 = (String) commandMap.get("pmtAddress_1");
		String PmtAddress_2 = (String) commandMap.get("pmtAddress_2");

		String PmtAddress = PmtAddress_1 + PmtAddress_2;
		log.info("pmtAddress=" + PmtAddress);

		commandMap.put("pmtAddress", PmtAddress);


		promoterService.insertPmtForm(commandMap.getMap());

		rttr.addFlashAttribute("msg", "SUCCESS");
		String mm = "firms";
		mv.addObject("mm", mm);
		mv.addObject("mode", "m_PmtForm");

		return mv;
	}*/



	// update

	/**
	 * @param commandMap
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/promoter/updatePmtForm.mwave")
	public ModelAndView updatePmtForm(CommandMap commandMap,
		HttpServletRequest request)throws Exception{

		ModelAndView mv = new ModelAndView("/Promoter/PmtForm2");

		mode = "PmtUpdate";
		HttpSession session = request.getSession();

/*		Promoter_VO promoter = (Promoter_VO) session.getAttribute("admin");
		commandMap.put("member_id", promoter.getPromoter_id());*/
		// 위의 view랑 동일하게 사용
		commandMap.put("promoter_id", request.getParameter("promoter_id"));
		Promoter_VO promoter =  promoterService.selectOnePmtInfo((String)commandMap.getMap().get("promoter_id"));
		if (promoter != null) {
			System.out.println("view 줄랭");
			System.out.println("mode 출력" + mode);
			mv.addObject("mode", mode);
			mv.addObject("updatePmtForm", promoter);
		}
		return mv;

	}

	@RequestMapping(value = "/promoter/PmtUpdatePro.mwav",method = RequestMethod.POST)
	public String PmtUpdatePro(CommandMap commandMap,
		HttpServletRequest request) throws Exception {
		//1번 상황 성공 2번 실패 3번 비밀번호 값이 다름
		int result =1;
		String pmtPw1 =(String) commandMap.get("pmtLogiNewPw");
		String pmtPw2 = (String) commandMap.get("pmtLogiNewPw");
		if(!pmtPw1.equals("")&&pmtPw1!=null){ //첫번째 비밀번호와 두번째 비밀번호가 같을경우 수정
			if(pmtPw1.equalsIgnoreCase(pmtPw2))
				commandMap.put("pmtNewPw", pmtPw1);
				System.out.println("비밀번호가 다름");
		}
		promoterService.updatePmtPro(commandMap.getMap());
		ModelAndView mv = new ModelAndView("/Promoter/PmtForm");
		return "redirect:/promoter/pmtList.mwav";
	}



}
