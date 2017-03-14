package net.admins.contrloller;

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
import net.admins.service.BoardQaAdminsService;
import net.mwav.common.module.Common_Utils;
import net.mwav.common.module.Paging;
import net.mwav.common.module.PagingVO;

@Controller
public class BoardQaAdminsController {
	Logger log = Logger.getLogger(this.getClass());
	// HttpServletRequest request = null;
	// 자바에서 세션사용을 위해서는 아래와 같이 필요
	// 세션 관련 설정은 prehandle 에서 추후 지정(들어오는 url에 따라서)
	// HttpSession session = request.getSession();

	Common_Utils cou = new Common_Utils();

	String mode;
	String depth_1 = "Admins";
	String depth_2 = "QnAMgr";
	String depth_3 = "";

	@Resource(name = "boardQaAdminsService")
	private BoardQaAdminsService BoardQaAdminsService;

	// ///////////////////////////////////BoardNews/////////////////////////////////////
	@RequestMapping(value = "/admin/boardQnA/qaForm.mwav")
	// http://egloos.zum.com/nadostar/v/210497
	public ModelAndView insertQnAForm(CommandMap commandMap,
			HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView("/Admins/SiteMgr/QnAMgr/qaForm");

		log.debug("인터셉터 테스트");
		BoardQaAdminsService.insertQnAForm(commandMap.getMap());

		String mm = "site";
		mv.addObject("mm", mm);
		mv.addObject("mode", "m_qnaForm");

		mv.addObject("depth_1", depth_1);
		mv.addObject("depth_2", depth_2);
		mv.addObject("depth_3", "QnAForm");

		// mv.addObject("insertBnsForm", insertBnsForm);
		// mv.addObject("IDX", commandMap.get("IDX"));

		return mv;
	}

	@RequestMapping(value = "/admin/boardQnA/qaView.mwav")
	public ModelAndView selectOneQnAView(CommandMap commandMap,
			HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/Admins/SiteMgr/QnAMgr/qaView");

		log.debug("인터셉터 테스트");
		System.out.println("테스트");
		Map<String, Object> selectOneQnAView = BoardQaAdminsService
				.selectOneQnAView(commandMap.getMap());

		if (selectOneQnAView != null && !selectOneQnAView.isEmpty()) {
			System.out.println("view 줄랭");

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
	public ModelAndView selectListQnAList(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/Admins/SiteMgr/QnAMgr/qaList");

		String pageNum = (String) commandMap.get("pageNum");
		Paging paging = new Paging();
		if (pageNum == null || pageNum == "") {
			pageNum = "1";
		}
		int totalRow = BoardQaAdminsService.selectOneGetQnATotalCount();
		System.out.println("totalRow=" + totalRow);

		// Paging pv = new Paging(pageNum, 10 , 10, totalCount);
		List<Map<String, Object>> selectListQnAList;
		PagingVO pagingVO = paging.setPagingInfo(totalRow, 5, pageNum); // 총 숫자,
																		// 한페이지에
																		// 노출 수
		commandMap.put("startRow", paging.getStartRow(pageNum)); // 시작 열
		commandMap.put("endRow", paging.getEndRow(pageNum)); // 끝 열
		if (totalRow > 0) {
			selectListQnAList = BoardQaAdminsService
					.selectListQnAList(commandMap.getMap());
			// selectboardList =
			// boardService.selectbnsList(commandMap.getMap());

		} else {
			selectListQnAList = Collections.emptyList();
		}
		System.out.println("찍히낭");
		String mm = "site";
		mv.addObject("mm", mm);
		mv.addObject("mode", "m_qnaList");

		mv.addObject("depth_1", depth_1);
		mv.addObject("depth_2", depth_2);
		mv.addObject("depth_3", "QnAList");

		mv.addObject("selectListQnAList", selectListQnAList);
		mv.addObject("pagingVO", pagingVO);
		mv.addObject("totalRow", totalRow);
		// mv.addObject("paging", pv.print());
		return mv;
	}

	@RequestMapping(value = "/admin/boardQnA/qaFrontList.mwav")
	public ModelAndView selectListBnsFrontList(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/Admins/SiteMgr/QnAMgr/qaFrontList");

		cou.selectCommandMapList(commandMap); // 키 출력

		List<Map<String, Object>> selectListQnAFrontList = BoardQaAdminsService
				.selectListQnAFrontList(commandMap.getMap());

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
	public ModelAndView deleteQnADelete(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/Admins/SiteMgr/QnAMgr/qaList");

		BoardQaAdminsService.deleteQnADelete(commandMap.getMap());

		mv.addObject("depth_1", depth_1);
		mv.addObject("depth_2", depth_2);
		mv.addObject("depth_3", "QnADelete");

		return mv;
	}

	/*
	 * 답변달기
	 */
	@RequestMapping(value = "/admin/boardQnA/uaFormAjax.mwav")
	// http://egloos.zum.com/nadostar/v/210497
	public @ResponseBody boolean insertQnAUaForm(CommandMap commandMap,
			HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession();
		Map<String, Object> selectStfLogin = (Map<String, Object>) session.getAttribute("selectStfLogin");
		
		System.out.println("qna_id__"+commandMap.get("QnA_id"));
		
		if(selectStfLogin != null){
		commandMap.put("uaResponser", 'S');
		int staff_id = (Integer) selectStfLogin.get("staff_id");
	
		commandMap.put("uaResponser_id", staff_id);
		
		String realIp = cou.getClientIP(request);
		commandMap.put("uaIpAddress", realIp);
		}
		
		boolean flag = BoardQaAdminsService
				.insertQnAUaForm(commandMap.getMap());

		//System.out.println("df" + flag);
		// mv.addObject("insertBnsForm", insertBnsForm);
		// mv.addObject("IDX", commandMap.get("IDX"));

		return flag;

	}
	
	
	/*
	 * 답변달기
	 */
	@RequestMapping(value = "/admin/boardQnA/uaFormUpdateAjax.mwav")
	public @ResponseBody boolean updateQnAUaForm(CommandMap commandMap,
			HttpServletRequest request) throws Exception {

		//HttpSession session = request.getSession();
		
		
		boolean flag = BoardQaAdminsService
				.updateQnAUaForm(commandMap.getMap());

		System.out.println("df" + flag);
		// mv.addObject("insertBnsForm", insertBnsForm);
		// mv.addObject("IDX", commandMap.get("IDX"));

		return flag;

	}

}