package net.mwav.staff.contrloller;

import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import net.common.common.CommandMap;
import net.mwav.staff.service.StaffService;
import net.mwav.common.module.Common_Util;
import net.mwav.common.module.Paging;
import net.mwav.common.module.PagingVO;

@Controller
public class StaffController {
	Logger log = Logger.getLogger(this.getClass());
	// HttpServletRequest request = null;
	// 자바에서 세션사용을 위해서는 아래와 같이 필요
	// 세션 관련 설정은 prehandle 에서 추후 지정(들어오는 url에 따라서)
	// HttpSession session = request.getSession();

	Common_Util cou = new Common_Util();

	String mode;

	// - Controller > Service > ServiceImpl > DAO > SQL(XML) > Controller > JSP

	// 페이지별 세션지정 -> GET문
	/*
	 * 1. bnsForm : mode = SbnsForm /CommonApps/BoardNews/bnsForm.jsp 2. bnsList
	 * : mode = SbnsList /CommonApps/BoardNews/bnsList.jsp 3. bnsView : mode =
	 * SbnsView /CommonApps/BoardNews/bnsView.jsp 4. FrontNewsList : mode =
	 * SFbnsList /CommonApps/BoardNews/FrontNewsList.jsp 5. bnsUpdate : mode =
	 * SbnsUpdate /CommonApps/BoardNews/bnsForm.jsp
	 */
	@Resource(name = "staffService")
	private StaffService staffService;

	/* ======================Staff====================== */

	/*
	 * ========================================등록================================
	 * ========
	 */
	// 1번 StfForm : Form 입력만 가능 (뒤로가기, list)
	@RequestMapping(value = "/staff/stfForm.do")
	public ModelAndView insertStfForm(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/Company/CompanyMasterPage_1");

		System.out.println("순서");
		log.debug("인터셉터 테스트");
		String stfCellularP_1 = (String) commandMap.get("stfCellularP_1");
		String stfCellularP_2 = (String) commandMap.get("stfCellularP_2");
		String stfCellularP_3 = (String) commandMap.get("stfCellularP_3");

		String stfCellularP = stfCellularP_1 + stfCellularP_2 + stfCellularP_3;
		commandMap.put("stfCellularP", stfCellularP);

		String stfPhone_1 = (String) commandMap.get("stfPhone_1");
		String stfPhone_2 = (String) commandMap.get("stfPhone_2");
		String stfPhone_3 = (String) commandMap.get("stfPhone_3");

		String stfPhone = stfPhone_1 + stfPhone_2 + stfPhone_3;
		commandMap.put("stfPhone", stfPhone);

		String stfAddress_1 = (String) commandMap.get("stfAddress_1");
		String stfAddress_2 = (String) commandMap.get("stfAddress_2");

		String stfAddress = stfAddress_1 + stfAddress_2;
		System.out.println("stfAddress=" + stfAddress);

		commandMap.put("stfAddress", stfAddress);

		staffService.insertStfForm(commandMap.getMap());

		// mode = "SbnsForm";
		// request.setAttribute("mode", mode);

		// mv.addObject("insertBnsForm", insertBnsForm);
		// mv.addObject("IDX", commandMap.get("IDX"));

		return mv;
	}

	@RequestMapping(value = "/staff/stfList.do")
	public ModelAndView selectListStfList(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/Admins/CompanyMgr/Staff/StfList");

		String pageNum = (String) commandMap.get("pageNum");
		Paging paging = new Paging();
		if (pageNum == null) {
			pageNum = "1";
		}
		System.out.println("pageNum=" + pageNum);
		int totalRow = staffService.selectOneGetTotalCount();
		System.out.println("totalRow=" + totalRow);

		// Paging pv = new Paging(pageNum, 10 , 10, totalCount);
		List<Map<String, Object>> selectListStfList;
		PagingVO pagingVO = paging.setPagingInfo(totalRow, 5, pageNum); // 총 숫자,
																		// 한페이지에
																		// 노출 수
		commandMap.put("startRow", paging.getStartRow(pageNum)); // 시작 열
		commandMap.put("endRow", paging.getEndRow(pageNum)); // 끝 열
		if (totalRow > 0) {
			selectListStfList = staffService.selectListStfList(commandMap
					.getMap());
			// selectboardList =
			// boardService.selectbnsList(commandMap.getMap());

		} else {
			selectListStfList = Collections.emptyList();
		}
		System.out.println("찍히낭");

		mv.addObject("selectListStfList", selectListStfList);
		mv.addObject("pagingVO", pagingVO);
		mv.addObject("totalRow", totalRow);
		// mv.addObject("paging", pv.print());
		return mv;
	}

	// 2번 StfView : 수정, 삭제버튼
	@RequestMapping(value = "/staff/stfView.do")
	public ModelAndView selectStfView(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		int staff_id = (int) session.getAttribute("staff_id");
		System.out.println("staff_id=" + staff_id);
		commandMap.put("staff_id", staff_id);
		ModelAndView mv = new ModelAndView("/Admins/CompanyMgr/Staff/StfView");
		Map<String, Object> selectStfView = staffService
				.selectStfView(commandMap.getMap());

		if (selectStfView != null && !selectStfView.isEmpty()) {
			System.out.println("view 줄랭");
			mv.addObject("mode", "SstfView");
			mv.addObject("selectStfView", selectStfView);
		}
		return mv;
	}

	/*
	 * ========================================수정================================
	 * ========
	 */
	/*
	 *  board 처러 하나의 form 에 등록 수정을 같이 사용하면, update 할때 최초 select 후 update 즉 update> updatePro 가 필요없다
	 *  그러나 아래와 같이 하려면, 별도 controller을 해줘야하며 어짜피 쿼리는 동일하므로 view 이용하면된다. ~! 
	 *  즉 controller에서만 작업 후 이후 꺼는 view 이용
	 */

	@RequestMapping(value = "/staff/stfUpdate.do")
	public ModelAndView updateBnsform(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/CommonApps/Member/MbrShipForm");

		mode = "SmbrUpdate";
		request.setAttribute("mode", mode);

		// 위의 view랑 동일하게 사용

		Map<String, Object> updateStfForm = staffService
				.updateStfForm(commandMap.getMap());
		if (updateStfForm != null && !updateStfForm.isEmpty()) {
			System.out.println("view 줄랭");
			mv.addObject("mode", "SstfUpdate");
			mv.addObject("updateStfForm", updateStfForm);
		}
		return mv;
	}
	
	/*
	 * 
	 * logincheck = 1 :  정상로그인
logincheck = 2 :  비밀번호 틀림
logincheck = 3 :  아이디 존재하지 않음
logincheck = 5 :  DB 조회시 NULL (임시패스워드 발급 단계에서 중간하였을때 포함)
logincheck = 6 :  탈퇴하지 않음
logincheck = 7 :  탈퇴
	 */
	@RequestMapping(value = "/staff/stfLogin.do")
	public ModelAndView selectLogin(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/Admins/CompanyMgr/Staff/StfView");

		HttpSession session = request.getSession();
		// * action-servlet.xml에서 위에 .jsp 설정해줘서 위의 CommonApps 부터 되는거

		System.out.println("여기는?");
		Map<String, Object> selectStfLogin = null;
		selectStfLogin = staffService.selectStfLogin(commandMap.getMap());

		int loginCheck = 0; // 초기값

		if (selectStfLogin != null && loginCheck != 5) {
			loginCheck = (int) selectStfLogin.get("loginCheck");
			// 페이지에서 온 값
			System.out.println("loginCheck =" + loginCheck);
			String b_stfLoginPw = null;
			b_stfLoginPw = (String) commandMap.get("stfLoginPw");
			System.out.println("페이지에서 온값 " + b_stfLoginPw);

			// 디비 다녀와서 온 값
			String a_stfLoginPw = (String) selectStfLogin.get("stfLoginPw");
			System.out.println("디비다녀온값" + a_stfLoginPw);

			String stfLoginId = (String) selectStfLogin.get("stfLoginId");
			int staff_id = (int) selectStfLogin.get("staff_id");

			if (loginCheck == 7) {
				loginCheck = 7;
				System.out.println("탈퇴한 회원입니다.");
			} else if (b_stfLoginPw.equals(a_stfLoginPw)) {
				// login 성공
				loginCheck = 1;
				session.setAttribute("stfLoginId", stfLoginId);
				session.setAttribute("staff_id", staff_id);
				System.out.println("로그인성공");
			} else if (stfLoginId != null
					&& !(b_stfLoginPw.equals(a_stfLoginPw))) {
				// check 0 비밀번호가 틀렸을 때
				loginCheck = 2;
				System.out.println("비밀번호틀림");
			}
		} else if (selectStfLogin != null && loginCheck == 5) {
			loginCheck = 5; // 임시패스워드

		} else {
			loginCheck = 3;
			System.out.println("아이디 존재하지 않음.");
		}
		// Convert Map to byte array
		/*
		 * ByteArrayOutputStream byteOut = new ByteArrayOutputStream();
		 * ObjectOutputStream out = new ObjectOutputStream(byteOut);
		 * out.writeObject(memberLogin.get("mbrLoginPw"));
		 */

		// http://linuxism.tistory.com/1089

		mv.addObject("selectStfLogin", selectStfLogin);
		request.setAttribute("loginCheck", loginCheck);
		return mv;

	}

}