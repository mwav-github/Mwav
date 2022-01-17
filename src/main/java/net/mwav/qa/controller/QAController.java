package net.mwav.qa.controller;

import net.common.common.CommandMap;
import net.mwav.common.module.Common_Utils;
import net.mwav.common.module.Paging;
import net.mwav.common.module.PagingVO;
import net.mwav.member.vo.Member_tbl_VO;
import net.mwav.qa.service.QAService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Collections;
import java.util.List;
import java.util.Map;

@Controller
public class QAController {

	private static final Logger logger = LoggerFactory.getLogger(QAController.class);

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
	@Inject
	private QAService qaService;

	@Inject
	Member_tbl_VO member_tbl_VO;

	/*
	 * ========================================등록================================
	 * ========
	 */

	// 1번 bnsForm : Form 입력만 가능 (뒤로가기, list)

	@RequestMapping(value = "/qa/qaFormAjax.mwav")
	public @ResponseBody boolean insertQAFormaAjax(CommandMap commandMap, HttpServletRequest request) throws Exception {
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

			// 정리 필요.
			int uqInvoker_id;
			String uqInvoker_id_string = (String) commandMap.get("uqInvoker_id");
			if (Common_Utils.isEmpty(uqInvoker_id_string) == true) {
				// null인경우
				uqInvoker_id = 0;
				commandMap.put("uqInvoker_id", uqInvoker_id);
			}

			commandMap.put("member_id", member_id);
			commandMap.put("statistics_id", statistics_id);

			//템플릿 경로
			commandMap.put("xmlPath", request.getRealPath("/xConfig/mail.xml.config"));

			flag = qaService.insertQAForm(commandMap.getMap(), request);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}

	@RequestMapping(value = "/qa/qaForm.mwav")
	public ModelAndView insertQAForm(CommandMap commandMap, HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView("/CustomerService/CS-MasterPage");

		HttpSession session = request.getSession();
		int member_id = 0;
		int statistics_id = 0;
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

		String referer = request.getHeader("Referer");
		//mwav url 제외할지 추후 고민 
		commandMap.put("uqRelatedLink", referer);

		// 정리 필요.
		int uqInvoker_id;
		String uqInvoker_id_string = (String) commandMap.get("uqInvoker_id");
		if (Common_Utils.isEmpty(uqInvoker_id_string) == true) {
			// null인경우
			uqInvoker_id = 0;
			commandMap.put("uqInvoker_id", uqInvoker_id);
		}

		logger.info("인터셉터 테스트");

		//템플릿 경로
		commandMap.put("xmlPath", request.getRealPath("/xConfig/mail.xml.config"));

		// 아직 까지는 한벌로
		boolean flag = qaService.insertQAForm(commandMap.getMap(), request);
		request.setAttribute("check", flag);
		request.setAttribute("mode", "qaCompleted");

		// mv.addObject("check", flag);
		// mv.addObject("IDX", commandMap.get("IDX"));

		return mv;
	}

	/*
	 * ========================================보기================================
	 * ========
	 */
	@RequestMapping(value = "/qa/qaView.mwav")
	public ModelAndView selectOneNsmView(CommandMap commandMap, HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/CustomerService/CS-MasterPage");

		Map<String, Object> selectOneQAView = qaService.selectOneQAView(commandMap.getMap());

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
	@ResponseBody
	public boolean updateQnAUaForm(CommandMap commandMap, HttpServletRequest request) throws Exception {
		boolean flag = qaService.uaSatisfactionUpdateAjax(commandMap.getMap());

		return flag;

	}

	/*
	 * ========================================수정================================
	 * ========
	 */
	// 조인해서 가져와야 할듯.
	@RequestMapping(value = "/qa/qaFrontList.mwav")
	public ModelAndView selectListBnsFrontList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/CommonApps/BoardQnA/FrontQAList");

		cou.selectCommandMapList(commandMap); // 키 출력

		List<Map<String, Object>> selectListQAFrontList = qaService.selectListQAFrontList(commandMap.getMap());

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
	public ModelAndView selectListQAList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/CustomerService/CS-MasterPage");

		HttpSession session = request.getSession();

		try {
			// 회원로그인시
			Member_tbl_VO member = (Member_tbl_VO) session.getAttribute("member");
			String m_email = null;
			String m_id = null;

			if (Common_Utils.isEmpty(member)) {
				// 비회원인경우

				m_email = (String) commandMap.get("uqUserEmail");
			} else {
				// 회원인경우
				int member_id = member.getMember_id();
				m_id = Integer.toString(member_id);
				commandMap.put("member_id", m_id);
			}

			String pageNum = (String) commandMap.get("pageNum");
			Paging paging = new Paging();
			if (pageNum == null) {
				pageNum = "1";
			}
			// totalcount 도 조정이 필요하다. (회원 비회원에 따라)
			int totalRow = qaService.selectOneGetTotalCount(m_id, m_email);
			logger.debug("totalRow=" + totalRow);

			// Paging pv = new Paging(pageNum, 10 , 10, totalCount);
			List<Map<String, Object>> selectListQAList;
			PagingVO pagingVO = paging.setPagingInfo(totalRow, 5, pageNum); // 총
																			// 숫자,
																			// 한페이지에
																			// 노출
																			// 수
			commandMap.put("startRow", paging.getStartRow(pageNum)); // 시작 열
			commandMap.put("endRow", paging.getEndRow(pageNum)); // 끝 열
			if (totalRow > 0) {
				selectListQAList = qaService.selectListQAList(commandMap.getMap());
				// selectboardList =
				// boardService.selectbnsList(commandMap.getMap());

			} else {
				selectListQAList = Collections.emptyList();
			}
			String mm = "site";
			mv.addObject("mm", mm);
			mv.addObject("mode", "qaList");
			mv.addObject("NO", "qaList");

			mv.addObject("breadcrumb", "IT Trends");
			mv.addObject("page_header", null);

			mv.addObject("selectListQAList", selectListQAList);
			mv.addObject("pagingVO", pagingVO);
			mv.addObject("totalRow", totalRow);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	@RequestMapping(value = "/qa/qaLogin.mwav")
	public ModelAndView selectListQALogin(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/CustomerService/QnA/QnA");

		int loginCheck = 0; // 초기값

		String uqUserEmail = null;
		uqUserEmail = qaService.selectOneQALogin(commandMap.getMap());
		// String uqUserPw = null;
		if (uqUserEmail == null) {
			// 0은 아이디 또는 pw가 틀린 것
			logger.debug("loginCheck =" + loginCheck);
			loginCheck = 0;
		} else {
			loginCheck = 1;
		}
		// 페이지에서 온 값

		request.setAttribute("loginCheck", loginCheck);
		request.setAttribute("uqUserEmail", uqUserEmail);

		return mv;
	}

}