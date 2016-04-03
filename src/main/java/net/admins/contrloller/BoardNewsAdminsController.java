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
import org.springframework.web.servlet.ModelAndView;

import net.common.common.CommandMap;
import net.admins.service.BoardNewsAdminsService;
import net.mwav.common.module.Common_Utils;
import net.mwav.common.module.Paging;
import net.mwav.common.module.PagingVO;

@Controller
public class BoardNewsAdminsController {
	Logger log = Logger.getLogger(this.getClass());
	// HttpServletRequest request = null;
	// 자바에서 세션사용을 위해서는 아래와 같이 필요
	// 세션 관련 설정은 prehandle 에서 추후 지정(들어오는 url에 따라서)
	// HttpSession session = request.getSession();

	Common_Utils cou = new Common_Utils();

	String mode;
	String depth_1 = "Admins";
	String depth_2 = "NewsMr";
	String depth_3 = "";

	// - Controller > Service > ServiceImpl > DAO > SQL(XML) > Controller > JSP

	// 페이지별 세션지정 -> GET문
	/*
	 * 1. bnsForm : mode = SbnsForm /CommonApps/BoardNews/bnsForm.jsp 2. bnsList
	 * : mode = SbnsList /CommonApps/BoardNews/bnsList.jsp 3. bnsView : mode =
	 * SbnsView /CommonApps/BoardNews/bnsView.jsp 4. FrontNewsList : mode =
	 * SFbnsList /CommonApps/BoardNews/FrontNewsList.jsp 5. bnsUpdate : mode =
	 * SbnsUpdate /CommonApps/BoardNews/bnsForm.jsp
	 */
	@Resource(name = "boardNewsAdminsService")
	private BoardNewsAdminsService boardNewsAdminsService;

	// ///////////////////////////////////BoardNews/////////////////////////////////////

	/*
	 * ========================================등록================================
	 * ========
	 * 
	 * 
	
	 */
	// 1번 bnsForm : Form 입력만 가능 (뒤로가기, list)
	@RequestMapping(value = "/admin/boardNews/nsmForm.do")
	//http://egloos.zum.com/nadostar/v/210497
	public ModelAndView insertNsmForm(CommandMap commandMap,
			HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView("/Admins/SiteMgr/NewsMgr/NsmForm");
		
		log.debug("인터셉터 테스트");
		boardNewsAdminsService.insertNsmForm(commandMap.getMap());

		String mm = "site";
		mv.addObject("mm", mm);
		mv.addObject("mode", "m_nsmForm");
		
		mv.addObject("depth_1", depth_1);
     	mv.addObject("depth_2", depth_2);
		mv.addObject("depth_3", "NsmForm");

		// mv.addObject("insertBnsForm", insertBnsForm);
		// mv.addObject("IDX", commandMap.get("IDX"));

		return mv;
	}


	// 1번 bnsView : 수정/삭제가능
	@RequestMapping(value = "/admin/boardNews/nsmView.do")
	public ModelAndView selectOneNsmView(CommandMap commandMap,
			HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/Admins/SiteMgr/NewsMgr/NsmView");



		log.debug("인터셉터 테스트");
		System.out.println("테스트");
		Map<String, Object> selectOneNsmView = boardNewsAdminsService
				.selectOneNsmView(commandMap.getMap());

		if (selectOneNsmView != null && !selectOneNsmView.isEmpty()) {
			System.out.println("view 줄랭");

			String mm = "site";
			mv.addObject("mm", mm);
			mv.addObject("mode", "m_nsmView");
						
			mv.addObject("depth_1", depth_1);
	     	mv.addObject("depth_2", depth_2);
			mv.addObject("depth_3", "NsmView");
			

			mv.addObject("selectOneNsmView", selectOneNsmView);
		}

		return mv;
	}

	/*
	 * ========================================수정================================
	 * ========
	 */
	
	// 1번 bnsUpdate : 리스트 업데이트
	@RequestMapping(value = "/admin/boardNews/nsmUpdate.do")
	public ModelAndView updateNsmForm(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/Admins/SiteMgr/NewsMgr/NsmForm");

		
		// 위의 view랑 동일하게 사용

		Map<String, Object> updateNsmForm = boardNewsAdminsService
				.updateNsmForm(commandMap.getMap());
		if (updateNsmForm != null && !updateNsmForm.isEmpty()) {
			System.out.println("view 줄랭");
			String mm = "site";
			mv.addObject("mm", mm);
			mv.addObject("mode", "m_nsmUpdate");
			
			mv.addObject("updateNsmForm", updateNsmForm);
		}
		return mv;	}
	
	// 1번 bnsUpdate : 리스트 업데이트
	@RequestMapping(value = "/admin/boardNews/nsmUpdatePro.do")
	public ModelAndView updateProNsmForm(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/Admins/SiteMgr/NewsMgr/NsmList");

		
		// 위의 view랑 동일하게 사용

		boardNewsAdminsService.updateProNsmForm(commandMap.getMap());
		
		String mm = "site";
		mv.addObject("mm", mm);
		mv.addObject("mode", "m_ntmList");
		return mv;
	}

	/*
	 * // 7번 bnsUpdatePro : 리스트 업데이트
	 * 
	 * @RequestMapping(value = "/board/bnsUpdatePro.do") public ModelAndView
	 * updatebnsform(CommandMap commandMap) throws Exception { ModelAndView mv =
	 * new ModelAndView("/Company/CompanyMasterPage_1");
	 * 
	 * boardService.updatebnsform(commandMap.getMap()); return mv; }
	 */

	/*
	 * ========================================리스트(SelectOne, SelectList
	 * 순)========================================
	 */
	// 1번 FrontNewsList : 메인페이지 앞단 5개씩 출력, 작성일 기준
	@RequestMapping(value = "/admin/boardNews/nsmFrontList.do")
	public ModelAndView selectListNsmFrontList(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView(
				"/Admins/SiteMgr/NewsMgr/NsmFrontList");
		/*
		 * mode = "SFbnsList"; session.setAttribute("mode", mode); String
		 * sessiontest = (String) session.getAttribute(mode);
		 * 
		 * System.out.println("sessiontest=" + sessiontest);
		 */

		// * action-servlet.xml에서 위에 .jsp 설정해줘서 위의 CommonApps 부터 되는거
		cou.selectListCommandMap(commandMap); // 키 출력

		List<Map<String, Object>> selectListNsmFrontList = boardNewsAdminsService
				.selectListNsmFrontList(commandMap.getMap());

		if (selectListNsmFrontList != null && !selectListNsmFrontList.isEmpty()) {

			mode = "m_nsmFrontList";
			request.setAttribute("mode", mode);

			mv.addObject("selectListNsmFrontList", selectListNsmFrontList);
		}

		return mv;
	}

	// 2번 bnsList : 리스트
	@RequestMapping(value = "/admin/boardNews/nsmList.do")
	public ModelAndView selectListNsmList(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/Admins/SiteMgr/NewsMgr/NsmList");

		String pageNum = (String) commandMap.get("pageNum");
		System.out.println("pageNum="+pageNum);
		Paging paging = new Paging();
		if (pageNum == null || pageNum == "") {
			pageNum = "1";
		}
		System.out.println("pageNum2="+pageNum);
		int totalRow = boardNewsAdminsService.selectOneGetNsmTotalCount();
		System.out.println("totalRow=" + totalRow);

		// Paging pv = new Paging(pageNum, 10 , 10, totalCount);
		List<Map<String, Object>> selectListNsmList;
		PagingVO pagingVO = paging.setPagingInfo(totalRow, 5, pageNum); // 총 숫자,
																		// 한페이지에
																		// 노출 수
		commandMap.put("startRow", paging.getStartRow(pageNum)); // 시작 열
		commandMap.put("endRow", paging.getEndRow(pageNum)); // 끝 열
		if (totalRow > 0) {
			selectListNsmList = boardNewsAdminsService.selectListNsmList(commandMap
					.getMap());
			// selectboardList =
			// boardService.selectbnsList(commandMap.getMap());

		} else {
			selectListNsmList = Collections.emptyList();
		}
		System.out.println("찍히낭");
		String mm = "site";
		mv.addObject("mm", mm);
		mv.addObject("mode", "m_nsmList");

		
		mv.addObject("depth_1", depth_1);
     	mv.addObject("depth_2", depth_2);
		mv.addObject("depth_3", "NsmList");
		
		mv.addObject("selectListNsmList", selectListNsmList);
		mv.addObject("pagingVO", pagingVO);
		mv.addObject("totalRow", totalRow);
		// mv.addObject("paging", pv.print());
		return mv;
	}

	/*
	 * ========================================삭제================================
	 * ========
	 */
	// 1번 bnsDelete
	@RequestMapping(value = "/admin/boardNews/nsmDelete.do")
	public ModelAndView deleteNsmDelete(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/Admins/SiteMgr/NewsMgr/NsmDelete");

		boardNewsAdminsService.deleteNsmDelete(commandMap.getMap());
		
		mv.addObject("depth_1", depth_1);
     	mv.addObject("depth_2", depth_2);
		mv.addObject("depth_3", "NsmDelete");


		return mv;
	}

}