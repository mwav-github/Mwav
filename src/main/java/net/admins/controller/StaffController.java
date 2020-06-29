package net.admins.controller;

import java.io.PrintWriter;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.admins.dao.StaffDAO;
import net.admins.service.StaffService;
import net.admins.vo.Staff_VO;
import net.common.common.CommandMap;
import net.mwav.common.module.Common_Utils;
import net.mwav.common.module.Paging;
import net.mwav.common.module.PagingVO;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class StaffController {
	Logger log = Logger.getLogger(this.getClass());
	// HttpServletRequest request = null;
	// 자바에서 세션사용을 위해서는 아래와 같이 필요
	// 세션 관련 설정은 prehandle 에서 추후 지정(들어오는 url에 따라서)
	// HttpSession session = request.getSession();

	Common_Utils cou = new Common_Utils();

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
	@RequestMapping(value = "/test.mwav")
	public ModelAndView test(CommandMap commandMap,
			HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("/Admins/CompanyMgr/Staff/StfForm");
		return mv;
	}
	@RequestMapping(value = "/test2.mwav")
	public ModelAndView test2(CommandMap commandMap,
			HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("/Admins/Goods/GdsCellForm");
		return mv;
	}
	@RequestMapping(value = "/test3.mwav")
	public ModelAndView test3(CommandMap commandMap,
			HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("/Admins/Goods/GdsUpLoader");
		return mv;
	}
	
	
    @RequestMapping(value="/admins/staff/stfLoginIdCheck.mwav")
	public void selectOneMbrStfIdCheck(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String stfLoginId = request.getParameter("stfLoginId");

		boolean selectIdCheck = staffService.selectOneStfLoginIdCheck(stfLoginId);

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
	
	@RequestMapping(value = "/admins/staff/stfForm.mwav")
	public ModelAndView insertStfForm(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/Admins/CompanyMgr/Staff/StfLogin");

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
		
		commandMap.put("staff_id",staffService.selectNextStfPk());
		
		staffService.insertStfForm(commandMap.getMap());

		String mm = "firms";
		mv.addObject("mm", mm);
		mv.addObject("mode", "m_stfForm");

		return mv;
	}

	@RequestMapping(value = "/admins/staff/stfList.mwav")
	public ModelAndView selectListStfList(CommandMap commandMap,
			HttpServletRequest request, HttpServletResponse reponse)
			throws Exception {
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
			System.out.println("전체행의 갯수 1이상");
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

		String mm = "firms";
		mv.addObject("mm", mm);
		mv.addObject("mode", "m_stfList");

		// mv.addObject("paging", pv.print());
		return mv;
	}

	// 2번 StfView : 수정, 삭제버튼
	@RequestMapping(value = "/admins/staff/stfView.mwav")
	public ModelAndView selectStfView(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		int staff_id = (int) session.getAttribute("staff");
		System.out.println("staff_id=" + staff_id);
		commandMap.put("staff_id", staff_id);
		ModelAndView mv = new ModelAndView("/Admins/CompanyMgr/Staff/StfView");
		Map<String, Object> selectStfView = staffService
				.selectStfView(commandMap.getMap());

		if (selectStfView != null && !selectStfView.isEmpty()) {
			System.out.println("view 줄랭");
			String mm = "firms";
			mv.addObject("mm", mm);
			mv.addObject("mode", "m_stfView");

			mv.addObject("selectStfView", selectStfView);
		}
		return mv;
	}

	/*
	 * ========================================수정================================
	 * ========
	 */
	/*
	 * board 처러 하나의 form 에 등록 수정을 같이 사용하면, update 할때 최초 select 후 update 즉
	 * update> updatePro 가 필요없다 그러나 아래와 같이 하려면, 별도 controller을 해줘야하며 어짜피 쿼리는
	 * 동일하므로 view 이용하면된다. ~! 즉 controller에서만 작업 후 이후 꺼는 view 이용
	 */

	@RequestMapping(value = "/admins/staff/stfUpdate.mwav")
	public ModelAndView updateStfform(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/Admins/CompanyMgr/Staff/StfForm");

		/*
		 * list에서 가져오는 것이기 때문에 session이 기준값이 아니다. !! list에서 확인시에 mypage에서는
		 * session 이 맞겠지
		 * 
		 * HttpSession session = request.getSession(); int staff_id = (int)
		 * session.getAttribute("staff_id");
		 * 
		 * System.out.println("staff_id=" + staff_id);
		 * commandMap.put("staff_id", staff_id);
		 */

		// 위의 view랑 동일하게 사용

		Map<String, Object> updateStfForm = staffService
				.updateStfForm(commandMap.getMap());
		if (updateStfForm != null && !updateStfForm.isEmpty()) {
			System.out.println("view 줄랭");
			String mm = "firms";
			mv.addObject("mm", mm);
			mv.addObject("mode", "m_stfUpdate");

			mv.addObject("updateStfForm", updateStfForm);
		}
		return mv;
	}

	@RequestMapping(value = "/admins/staff/stfUpdatePro.mwav")
	public ModelAndView updateProStfform(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/Admins/CompanyMgr/Staff/StfForm");

		staffService.updateProStfForm(commandMap.getMap());

		return mv;
	}

	/*
	 * 
	 * logincheck = 1 : 정상로그인 logincheck = 2 : 비밀번호 틀림 logincheck = 3 : 아이디 존재하지
	 * 않음 logincheck = 5 : DB 조회시 NULL (임시패스워드 발급 단계에서 중간하였을때 포함) logincheck = 6
	 * : 탈퇴하지 않음 logincheck = 7 : 탈퇴
	 */
/*	@RequestMapping(value = "/admins/staff/stfLogin.mwav")
	public ModelAndView selectLogin(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/Admins/AdminsIndex");

		HttpSession session = request.getSession();
		// * action-servlet.xml에서 위에 .jsp 설정해줘서 위의 CommonApps 부터 되는거

		System.out.println("여기는?");
		Map<String, Object> selectStfLogin = null;
		selectStfLogin = staffService.selectStfLogin(commandMap.getMap());
		String returnUrl = null;
		String returnUrl_imsi = null;
		String staff_id = null;
		returnUrl_imsi = (String) commandMap.get("returnUrl");
		System.out.println("returnUrl_imsi" + returnUrl_imsi);
		if (returnUrl_imsi == null || returnUrl_imsi == "") {
			returnUrl = null;
		} else {
			returnUrl = returnUrl_imsi;
		}

		System.out.println("returnUrl" + returnUrl);

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
			staff_id = String.valueOf(selectStfLogin.get("staff_id"));

			if (loginCheck == 7) {
				loginCheck = 7;
				System.out.println("탈퇴한 회원입니다.");
			} else if (b_stfLoginPw.equals(a_stfLoginPw)) {
				// login 성공
				loginCheck = 1;
				session.setAttribute("stfLoginId", stfLoginId);
				session.setAttribute("staff", staff_id);
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
		
		 * ByteArrayOutputStream byteOut = new ByteArrayOutputStream();
		 * ObjectOutputStream out = new ObjectOutputStream(byteOut);
		 * out.writeObject(memberLogin.get("mbrLoginPw"));
		 

		// http://linuxism.tistory.com/1089

		//추후 vo 객체로 변경.
		session.setAttribute("staff", staff_id);
		request.setAttribute("returnUrl", returnUrl);
		mv.addObject("selectStfLogin", selectStfLogin);
		request.setAttribute("loginCheck", loginCheck);
		return mv;

	}*/

	
	@RequestMapping(value = "/admins/staff/stfLogin.mwav")
	public ModelAndView selectLogin(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/Admins/AdminsIndex");

		HttpSession session = request.getSession();
		// * action-servlet.xml에서 위에 .jsp 설정해줘서 위의 CommonApps 부터 되는거

		System.out.println("여기는?");
		Staff_VO selectStfLogin = null;
		selectStfLogin = staffService.selectStfLogin(commandMap.getMap());
		String returnUrl = null;
		String returnUrl_imsi = null;
		String staff_id = null;
		returnUrl_imsi = (String) commandMap.get("returnUrl");
		System.out.println("returnUrl_imsi" + returnUrl_imsi);
		if (returnUrl_imsi == null || returnUrl_imsi == "") {
			returnUrl = null;
		} else {
			returnUrl = returnUrl_imsi;
		}

		System.out.println("returnUrl" + returnUrl);

		int loginCheck = 0; // 초기값

		if (selectStfLogin != null && loginCheck != 5) {
			loginCheck = (int) selectStfLogin.getStfLoginCheck();
			// 페이지에서 온 값
			System.out.println("loginCheck =" + loginCheck);
			String b_stfLoginPw = null;
			b_stfLoginPw = (String) commandMap.get("stfLoginPw");
			System.out.println("페이지에서 온값 " + b_stfLoginPw);

			// 디비 다녀와서 온 값
			String a_stfLoginPw = (String) selectStfLogin.getStfLoginPw();
			System.out.println("디비다녀온값" + a_stfLoginPw);

			String stfLoginId = (String) selectStfLogin.getStfLoginId();
			staff_id = String.valueOf(selectStfLogin.getStaff_id());

			if (loginCheck == 7) {
				loginCheck = 7;
				System.out.println("탈퇴한 회원입니다.");
			} else if (b_stfLoginPw.equals(a_stfLoginPw)) {
				// login 성공
				loginCheck = 1;
				session.setAttribute("staff", selectStfLogin);
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

		//추후 vo 객체로 변경.
		session.setAttribute("staff",selectStfLogin );
		request.setAttribute("returnUrl", returnUrl);
		mv.addObject("selectStfLogin", selectStfLogin);
		request.setAttribute("loginCheck", loginCheck);
		return mv;

	}

	@RequestMapping(value = "/admins/staff/stfLogout.mwav")
	public ModelAndView selectLogout(HttpSession  session,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/Admins/CompanyMgr/Staff/StfLogin");
		Object obj = session.getAttribute("staff");
		 if (obj != null) {
			  session.removeAttribute("staff");
		      log.info("세선제거 성공");			      
		 }else{
				log.info("세션에 로그인 정보가 존재하지 않아, 로그아웃 하지 못하였습니다.");
		 }

		mode = "SDMbrLogout";
		request.setAttribute("mode", mode);

		return mv;
	}
	
	@RequestMapping(value="/admins/staff/stf.mwav")
	public ModelAndView insertRegist(HttpServletRequest request,HttpServletResponse response,StaffDAO staff){
		ModelAndView mv = new ModelAndView("/Index");
		
		
		return mv;
	}

	@RequestMapping(value = "/admins/staff/pmtList.mwav")
	public ModelAndView selectListPmtList(CommandMap commandMap,
										  HttpServletRequest request, HttpServletResponse reponse)
			throws Exception {
		ModelAndView mv = new ModelAndView("/Admins/CompanyMgr/Staff/PmtList");

		String pageNum = (String) commandMap.get("pageNum");
		Paging paging = new Paging();
		if (pageNum == null) {
			pageNum = "1";
		}
		int totalRow = staffService.selectPmtOneGetTotalCount();

		List<Map<String, Object>> selectListPmtList;
		PagingVO pagingVO = paging.setPagingInfo(totalRow, 5, pageNum); // 총 숫자,
		// 한페이지에
		// 노출 수
		commandMap.put("startRow", paging.getStartRow(pageNum)); // 시작 열
		commandMap.put("endRow", paging.getEndRow(pageNum)); // 끝 열
		if (totalRow > 0) {
			selectListPmtList = staffService.selectListPmtList(commandMap.getMap());
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

	@RequestMapping(value = "/admins/staff/pmtForm.mwav")
	public ModelAndView insertPmtForm(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/Admins/CompanyMgr/Staff/StfLogin");

		staffService.insertPmtForm(commandMap);

		// TODO : 프로모터 수정 INSERT 필요
		mv.addObject("mm", "firms");
		mv.addObject("mode", "m_stfForm");

		return mv;
	}

}