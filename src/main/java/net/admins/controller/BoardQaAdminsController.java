package net.admins.controller;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.admins.service.BoardQaAdminsService;
import net.admins.vo.Staff_VO;
import net.common.common.CommandMap;
import net.mwav.common.module.Common_Utils;
import net.mwav.common.module.Paging;
import net.mwav.common.module.PagingVO;

@Controller
public class BoardQaAdminsController {

	private static final Logger logger = LoggerFactory.getLogger(BoardQaAdminsController.class);

	Common_Utils cou = new Common_Utils();

	String mode;
	String depth_1 = "Admins";
	String depth_2 = "QnAMgr";
	String depth_3 = "";

	@Inject
	private BoardQaAdminsService BoardQaAdminsService;

	@RequestMapping(value = "/admin/boardQnA/qaForm.mwav")
	public ModelAndView insertQnAForm(CommandMap commandMap, HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView("/Admins/SiteMgr/QnAMgr/qaForm");

		logger.debug("인터셉터 테스트");
		BoardQaAdminsService.insertQnAForm(commandMap.getMap());

		String mm = "site";
		mv.addObject("mm", mm);
		mv.addObject("mode", "m_qnaForm");

		mv.addObject("depth_1", depth_1);
		mv.addObject("depth_2", depth_2);
		mv.addObject("depth_3", "QnAForm");

		return mv;
	}

	@RequestMapping(value = "/admin/boardQnA/qaView.mwav")
	public ModelAndView selectOneQnAView(CommandMap commandMap, HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/Admins/SiteMgr/QnAMgr/qaView");

		logger.debug("인터셉터 테스트");
		Map<String, Object> selectOneQnAView = BoardQaAdminsService.selectOneQnAView(commandMap.getMap());

		if (selectOneQnAView != null && !selectOneQnAView.isEmpty()) {
			String mm = "site";
			mv.addObject("mm", mm);
			mv.addObject("mode", "m_qnaView");

			mv.addObject("depth_1", depth_1);
			mv.addObject("depth_2", depth_2);
			mv.addObject("depth_3", "QnAView");

			mv.addObject("selectOneQnAView", selectOneQnAView);
		}

		return mv;
	}

	@RequestMapping(value = "/admin/boardQnA/qnaList.mwav")
	public ModelAndView selectListQnAList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/Admins/SiteMgr/QnAMgr/qaList");

		String pageNum = (String) commandMap.get("pageNum");
		Paging paging = new Paging();
		if (pageNum == null || pageNum == "") {
			pageNum = "1";
		}
		int totalRow = BoardQaAdminsService.selectOneGetQnATotalCount();
		List<Map<String, Object>> selectListQnAList;
		PagingVO pagingVO = paging.setPagingInfo(totalRow, 5, pageNum);
		commandMap.put("startRow", paging.getStartRow(pageNum));// 시작 열
		commandMap.put("endRow", paging.getEndRow(pageNum));// 끝 열
		if (totalRow > 0) {
			selectListQnAList = BoardQaAdminsService.selectListQnAList(commandMap.getMap());
		} else {
			selectListQnAList = Collections.emptyList();
		}
		String mm = "site";
		mv.addObject("mm", mm);
		mv.addObject("mode", "m_qnaList");

		mv.addObject("depth_1", depth_1);
		mv.addObject("depth_2", depth_2);
		mv.addObject("depth_3", "QnAList");

		mv.addObject("selectListQnAList", selectListQnAList);
		mv.addObject("pagingVO", pagingVO);
		mv.addObject("totalRow", totalRow);
		return mv;
	}

	@RequestMapping(value = "/admin/boardQnA/qaFrontList.mwav")
	public ModelAndView selectListBnsFrontList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/Admins/SiteMgr/QnAMgr/qaFrontList");

		cou.selectCommandMapList(commandMap);// 키 출력

		List<Map<String, Object>> selectListQnAFrontList = BoardQaAdminsService.selectListQnAFrontList(commandMap.getMap());

		if (selectListQnAFrontList != null && !selectListQnAFrontList.isEmpty()) {

			mode = "SFbnsList";
			request.setAttribute("mode", mode);
			mv.addObject("breadcrumb", "IT Trends");
			mv.addObject("page_header", "IT Trends");

			mv.addObject("selectListQnAFrontList", selectListQnAFrontList);
		}

		return mv;
	}

	@RequestMapping(value = "/admin/boardQnA/qnaDelete.mwav")
	public ModelAndView deleteQnADelete(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/Admins/SiteMgr/QnAMgr/qaList");

		BoardQaAdminsService.deleteQnADelete(commandMap.getMap());

		mv.addObject("depth_1", depth_1);
		mv.addObject("depth_2", depth_2);
		mv.addObject("depth_3", "QnADelete");

		return mv;
	}

	/**
	 * 답변달기
	 */
	@RequestMapping(value = "/admin/boardQnA/uaFormAjax.mwav")
	@ResponseBody
	public boolean insertQnAUaForm(CommandMap commandMap, HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession();
		Staff_VO selectStfLogin = (Staff_VO) session.getAttribute("staff");

		if (selectStfLogin != null) {
			commandMap.put("uaResponser", 'S');
			int staff_id = selectStfLogin.getStaff_id();

			commandMap.put("uaResponser_id", staff_id);

			String realIp = cou.getClientIP(request);
			commandMap.put("uaIpAddress", realIp);
		}

		commandMap.put("xmlPath", request.getRealPath("/xConfig/mail.xml.config"));
		commandMap.put("staff", selectStfLogin);

		boolean flag = BoardQaAdminsService.insertQnAUaForm(commandMap.getMap());

		return flag;
	}

	/**
	 * 답변달기
	 */
	@RequestMapping(value = "/admin/boardQnA/uaFormUpdateAjax.mwav")
	public @ResponseBody boolean updateQnAUaForm(CommandMap commandMap, HttpServletRequest request) throws Exception {
		boolean flag = BoardQaAdminsService.updateQnAUaForm(commandMap.getMap());

		return flag;
	}
}