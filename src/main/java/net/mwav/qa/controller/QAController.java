package net.mwav.qa.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.common.common.CommandMap;
import net.mwav.qa.service.QAService;
import net.mwav.shop.service.GoodsService;
import net.mwav.common.module.Common_Utils;
import net.mwav.common.module.Paging;
import net.mwav.common.module.PagingVO;

@Controller
public class QAController {
	Logger log = Logger.getLogger(this.getClass());
	// HttpServlsetRequest request = null;
	// 자바에서 세션사용을 위해서는 아래와 같이 필요
	// 세션 관련 설정은 prehandle 에서 추후 지정(들어오는 url에 따라서)
	// HttpSession session = request.getSession();
	Common_Utils cou = new Common_Utils();
	Paging paging = new Paging();
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
	@Resource(name = "qaService")
	private QAService qaService;

	/*
	 * ========================================등록================================
	 * ========
	 */

	// 1번 bnsForm : Form 입력만 가능 (뒤로가기, list)
	@RequestMapping(value = "/qa/qaForm.mwav")
	public @ResponseBody boolean insertQAForm(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("member_id");
		commandMap.put("member_id", m_id);
		System.out.println("순서");
		log.debug("인터셉터 테스트");
		qaService.insertQAForm(commandMap.getMap(), request);

		boolean flag = qaService.insertQAForm(commandMap.getMap(), request);

		System.out.println("df" + flag);
		// mv.addObject("insertBnsForm", insertBnsForm);
		// mv.addObject("IDX", commandMap.get("IDX"));

		return flag;
	}

	/*
	 * ========================================보기================================
	 * ========
	 */
	@RequestMapping(value = "/qa/qaView.mwav")
	public ModelAndView selectOneNsmView(CommandMap commandMap,
			HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/CustomerService/CS-MasterPage");

		log.debug("인터셉터 테스트");
		Map<String, Object> selectOneQAView = qaService
				.selectOneQAView(commandMap.getMap());
		//System.out.println("값" + selectOneQAView.get("QnA_id_2"));
		
		System.out.println("sdf"+selectOneQAView.get("uqStatus"));

		if (selectOneQAView != null && !selectOneQAView.isEmpty()) {
			
			String mm = "site";
			mv.addObject("mm", mm);
			mv.addObject("mode", "qaView");
			mv.addObject("breadcrumb", "Q&A");
			mv.addObject("page_header", "Q&A");

			mv.addObject("selectOneQAView", selectOneQAView);
		}

		return mv;
	}

	/*
	 * ========================================수정================================
	 * ========
	 */

	/*
	 * ========================================리스트(SelectOne, SelectList
	 * 순)========================================
	 */
	// 조인해서 가져와야 할듯.
	@RequestMapping(value = "/qa/qaFrontList.mwav")
	public ModelAndView selectListBnsFrontList(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/CommonApps/BoardQnA/FrontQAList");

		cou.selectCommandMapList(commandMap); // 키 출력

		List<Map<String, Object>> selectListQAFrontList = qaService
				.selectListQAFrontList(commandMap.getMap());

		if (selectListQAFrontList != null && !selectListQAFrontList.isEmpty()) {

			mode = "SFbnsList";
			request.setAttribute("mode", mode);
			mv.addObject("breadcrumb", "IT Trends");
			mv.addObject("page_header", "IT Trends");

			mv.addObject("selectListQAFrontList", selectListQAFrontList);
		}

		return mv;
	}

	// 2번 bnsList : 리스트
	@RequestMapping(value = "/qa/qaList.mwav")
	public ModelAndView selectListQAList(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/CustomerService/CS-MasterPage");

		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("member_id");
		String m_email = (String) commandMap.get("uqUserEmail");
		commandMap.put("member_id", m_id);
		String pageNum = (String) commandMap.get("pageNum");
		Paging paging = new Paging();
		if (pageNum == null) {
			pageNum = "1";
		}
		int totalRow = qaService.selectOneGetTotalCount(m_id, m_email);
		System.out.println("totalRow=" + totalRow);

		// Paging pv = new Paging(pageNum, 10 , 10, totalCount);
		List<Map<String, Object>> selectListQAList;
		PagingVO pagingVO = paging.setPagingInfo(totalRow, 5, pageNum); // 총 숫자,
																		// 한페이지에
																		// 노출 수
		commandMap.put("startRow", paging.getStartRow(pageNum)); // 시작 열
		commandMap.put("endRow", paging.getEndRow(pageNum)); // 끝 열
		if (totalRow > 0) {
			selectListQAList = qaService.selectListQAList(commandMap.getMap());
			// selectboardList =
			// boardService.selectbnsList(commandMap.getMap());

		} else {
			selectListQAList = Collections.emptyList();
		}
		System.out.println("찍히낭");
		String mm = "site";
		mv.addObject("mm", mm);
		mv.addObject("mode", "qaList");
		mv.addObject("NO", "qaList");

		mv.addObject("breadcrumb", "IT Trends");
		// mv.addObject("page_header", "IT Trends");
		mv.addObject("page_header", null);

		mv.addObject("selectListQAList", selectListQAList);
		mv.addObject("pagingVO", pagingVO);
		mv.addObject("totalRow", totalRow);
		// mv.addObject("paging", pv.print());
		return mv;
	}

	@RequestMapping(value = "/qa/qaLogin.mwav")
	public ModelAndView selectListQALogin(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/CustomerService/QnA/QnA");

		int loginCheck = 0; // 초기값
		Map<String, Object> qaLogin = null;
		String a_uqUserEmail = null;
		qaLogin = qaService.selectOneQALogin(commandMap.getMap());
		// String uqUserPw = null;
		if (qaLogin != null) {
			System.out.println("loginCheck =" + loginCheck);

			// 페이지에서 온 값
			String b_uqUserPw = null;
			b_uqUserPw = (String) commandMap.get("uqUserPw");
			System.out.println("페이지에서 온값 " + b_uqUserPw);

			// 디비 다녀와서 온 값
			String a_uqUserPw = (String) qaLogin.get("uqUserPw");
			System.out.println("디비다녀온값" + a_uqUserPw);

			// 페이지에서 온 값
			String b_uqUserEmail = (String) commandMap.get("uqUserEmail");
			// int member_id = (int) memberLogin.get("member_id");

			
					a_uqUserEmail=	(String) qaLogin.get("uqUserEmail");
			// System.out.println("디비다녀온값" + a_uqUserEmail);

			if (b_uqUserPw.equals(a_uqUserPw)) {
				loginCheck = 1;

			} else if (a_uqUserEmail != null
					&& !(b_uqUserPw.equals(a_uqUserPw))) {
				// check 0 비밀번호가 틀렸을 때
				loginCheck = 2;
				System.out.println("비밀번호틀림");
			}
		} else {
			loginCheck = 3;
			System.out.println("아이디 존재하지 않음.");
		}
		mv.addObject("qaLogin", qaLogin);
		request.setAttribute("loginCheck", loginCheck);
		request.setAttribute("uqUserEmail", a_uqUserEmail);
		
		return mv;
	}
	/*
	 * ========================================삭제================================
	 * ========
	 */

}