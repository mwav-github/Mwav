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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import net.common.common.CommandMap;
import net.mwav.member.vo.Member_tbl_VO;
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
	HttpSession session;

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

	@Autowired
	Member_tbl_VO member_tbl_VO;

	/*
	 * ========================================등록================================
	 * ========
	 */

	// 1번 bnsForm : Form 입력만 가능 (뒤로가기, list)

	@RequestMapping(value = "/qa/qaFormAjax.mwav")
	public @ResponseBody boolean insertQAFormaAjax(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		// System.out.println("sdfdfs");

		boolean flag = false;
		int member_id = 0;
		int statistics_id = 0;
		try {
			HttpSession session = request.getSession();

			// 회원여부에 따른 member_id insert 여부
			if (session.getAttribute("member") != null) {
				member_tbl_VO = (Member_tbl_VO) session.getAttribute("member");
				member_id = member_tbl_VO.getMember_id();
			}

			// 통계키 넣기.
			if (session.getAttribute("statistics_id") != null) {
				statistics_id = Integer.parseInt((String) session.getAttribute("statistics_id"));
			}

			commandMap.put("member_id", member_id);
			commandMap.put("statistics_id", statistics_id);
			System.out.println("sdf"+statistics_id);

			log.debug("인터셉터 테스트");
			// qaService.insertQAForm(commandMap.getMap(), request);

			flag = qaService.insertQAForm(commandMap.getMap(), request);

			System.out.println("df" + flag);
			// mv.addObject("insertBnsForm", insertBnsForm);
			// mv.addObject("IDX", commandMap.get("IDX"));
		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}

	@RequestMapping(value = "/qa/qaForm.mwav")
	public ModelAndView insertQAForm(CommandMap commandMap,
			HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView("/CustomerService/CS-MasterPage");

		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("member_id");
		commandMap.put("member_id", m_id);
		System.out.println("순서");
		log.debug("인터셉터 테스트");

		// 아직 까지는 한벌로
		boolean flag = qaService.insertQAForm(commandMap.getMap(), request);

		System.out.println("df" + flag);

		request.setAttribute("check", flag);
		// mv.addObject("check", flag);
		// mv.addObject("IDX", commandMap.get("IDX"));

		return mv;
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
		// System.out.println("값" + selectOneQAView.get("QnA_id_2"));

		System.out.println("sdf" + selectOneQAView.get("uqStatus"));

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

	@RequestMapping(value = "/qa/uaSatisfactionUpdateAjax.mwav")
	public @ResponseBody boolean updateQnAUaForm(CommandMap commandMap,
			HttpServletRequest request) throws Exception {

		// HttpSession session = request.getSession();

		/*
		 * int uaSatisfaction = 0; uaSatisfaction = (int)
		 * request.getAttribute("uaSatisfaction");
		 */
		/*
		 * System.out.println("uaSatisfaction = "+uaSatisfaction);
		 * 
		 * uaSatisfaction = qaService .uaSatisfactionUpdateAjax(uaSatisfaction);
		 */

		boolean flag = qaService.uaSatisfactionUpdateAjax(commandMap.getMap());

		// mv.addObject("insertBnsForm", insertBnsForm);
		// mv.addObject("IDX", commandMap.get("IDX"));

		return flag;

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
		String m_id = String.valueOf(session.getAttribute("member_id"));
		String m_email = (String) commandMap.get("uqUserEmail");
		commandMap.put("member_id", m_id);
		String pageNum = (String) commandMap.get("pageNum");
		Paging paging = new Paging();
		if (pageNum == null) {
			pageNum = "1";
		}
		// totalcount 도 조정이 필요하다. (회원 비회원에 따라)
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

		String uqUserEmail = null;
		uqUserEmail = qaService.selectOneQALogin(commandMap.getMap());
		// String uqUserPw = null;
		if (uqUserEmail == null) {
			// 0은 아이디 또는 pw가 틀린 것
			System.out.println("loginCheck =" + loginCheck);
			loginCheck = 0;
		} else {
			loginCheck = 1;
		}
		// 페이지에서 온 값

		request.setAttribute("loginCheck", loginCheck);
		request.setAttribute("uqUserEmail", uqUserEmail);

		return mv;
	}
	/*
	 * ========================================삭제================================
	 * ========
	 */

}