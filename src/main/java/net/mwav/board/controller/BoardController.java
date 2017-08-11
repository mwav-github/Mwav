package net.mwav.board.controller;

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
import net.mwav.board.service.BoardService;
import net.mwav.common.module.Common_Utils;
import net.mwav.common.module.Paging;
import net.mwav.common.module.PagingVO;

@Controller
public class BoardController {
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
	@Resource(name = "boardService")
	private BoardService boardService;

	// ///////////////////////////////////BoardNews/////////////////////////////////////

	/*
	 * ========================================등록================================
	 * ========
	 * 
	 * 
	
	 */
	// 1번 bnsForm : Form 입력만 가능 (뒤로가기, list)
	@RequestMapping(value = "/board/bnsForm.mwav")
	//http://egloos.zum.com/nadostar/v/210497
	public ModelAndView insertBnsForm(CommandMap commandMap,
			HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView("/Company/CompanyMasterPage_1");
		
		/*if (staff_id == null){
			forward_url = "/Company/CompanyMasterPage_1";
		}else{
			forward_url = "/Admins/AdminsMasterPage";
		}
		ModelAndView mv = new ModelAndView(forward_url);*/

		System.out.println("순서");
		log.debug("인터셉터 테스트");
		boardService.insertBnsForm(commandMap.getMap());

		String mm = "site";
		mv.addObject("mm", mm);
		mv.addObject("mode", "m_bnsForm");
		mv.addObject("breadcrumb", "IT Trends");
		mv.addObject("page_header", "IT Trends");

		// mv.addObject("insertBnsForm", insertBnsForm);
		// mv.addObject("IDX", commandMap.get("IDX"));

		return mv;
	}

	/*
	 * ========================================보기================================
	 * ========
	 */
	// 1번 bnsView : 수정/삭제가능
	@RequestMapping(value = "/board/bnsView.mwav")
	public ModelAndView selectOneBnsView(CommandMap commandMap,
			HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/Company/CompanyMasterPage_1");

		// Common_Util.selectListCommandMap(commandMap); // 키 출력

		/*
		 * if (commandMap.isEmpty() == false) { System.out.println("들어옴");
		 * Iterator<Entry<String, Object>> iterator = commandMap.getMap()
		 * .entrySet().iterator(); Entry<String, Object> entry = null; while
		 * (iterator.hasNext()) { entry = iterator.next(); log.debug("key : " +
		 * entry.getKey() + ",\tvalue : " + entry.getValue());
		 * System.out.println("key : " + entry.getKey() + ",\tvalue : " +
		 * entry.getValue()); } }
		 */

		log.debug("인터셉터 테스트");
		Map<String, Object> selectOneBnsView = boardService
				.selectOneBnsView(commandMap.getMap());

		if (selectOneBnsView != null && !selectOneBnsView.isEmpty()) {
			
			String mm = "site";
			mv.addObject("mm", mm);
			mv.addObject("mode", "m_bnsView");
			mv.addObject("breadcrumb", "IT Trends");
			//mv.addObject("page_header", "IT Trends");
			mv.addObject("page_header", null);

            //meta태그 이미지 
			mv.addObject("meta_image", selectOneBnsView.get("bnRelatedLink"));
			mv.addObject("selectOneBnsView", selectOneBnsView);
		}

		return mv;
	}

	/*
	 * ========================================수정================================
	 * ========
	 */
	// 1번 bnsUpdate : 리스트 업데이트
	@RequestMapping(value = "/board/bnsUpdate.mwav")
	public ModelAndView updateBnsform(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/Company/CompanyMasterPage_1");

		mode = "SbnsUpdate";
		request.setAttribute("mode", mode);
		
		mv.addObject("breadcrumb", "IT Trends");
		mv.addObject("page_header", "IT Trends");


		// 위의 view랑 동일하게 사용

		boardService.updateBnsform(commandMap.getMap());
		return mv;
	}

	/*
	 * // 7번 bnsUpdatePro : 리스트 업데이트
	 * 
	 * @RequestMapping(value = "/board/bnsUpdatePro.mwav") public ModelAndView
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
	@RequestMapping(value = "/board/bnsFrontList.mwav")
	public ModelAndView selectListBnsFrontList(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView(
				"/CommonApps/BoardNews/FrontNewsList");
		/*
		 * mode = "SFbnsList"; session.setAttribute("mode", mode); String
		 * sessiontest = (String) session.getAttribute(mode);
		 * 
		 * System.out.println("sessiontest=" + sessiontest);
		 */

		// * action-servlet.xml에서 위에 .jsp 설정해줘서 위의 CommonApps 부터 되는거
		cou.selectCommandMapList(commandMap); // 키 출력

		List<Map<String, Object>> selectListBnsFrontList = boardService
				.selectListBnsFrontList(commandMap.getMap());

		if (selectListBnsFrontList != null && !selectListBnsFrontList.isEmpty()) {

			mode = "SFbnsList";
			request.setAttribute("mode", mode);
			mv.addObject("breadcrumb", "IT Trends");
			mv.addObject("page_header", "IT Trends");


			mv.addObject("selectListBnsFrontList", selectListBnsFrontList);
		}

		return mv;
	}

	// 2번 bnsList : 리스트
	@RequestMapping(value = "/board/bnsList.mwav")
	public ModelAndView selectListBnsList(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/Company/CompanyMasterPage_1");

		String pageNum = (String) commandMap.get("pageNum");
		Paging paging = new Paging();
		if (pageNum == null) {
			pageNum = "1";
		}
		int totalRow = boardService.selectOneGetTotalCount();
		System.out.println("totalRow=" + totalRow);

		// Paging pv = new Paging(pageNum, 10 , 10, totalCount);
		List<Map<String, Object>> selectListBnsList;
		PagingVO pagingVO = paging.setPagingInfo(totalRow, 5, pageNum); // 총 숫자,
																		// 한페이지에
																		// 노출 수
		commandMap.put("startRow", paging.getStartRow(pageNum)); // 시작 열
		commandMap.put("endRow", paging.getEndRow(pageNum)); // 끝 열
		if (totalRow > 0) {
			selectListBnsList = boardService.selectListBnsList(commandMap
					.getMap());
			// selectboardList =
			// boardService.selectbnsList(commandMap.getMap());

		} else {
			selectListBnsList = Collections.emptyList();
		}
		String mm = "site";
		mv.addObject("mm", mm);
		mv.addObject("mode", "m_bnsList");

		mv.addObject("breadcrumb", "IT Trends");
		//mv.addObject("page_header", "IT Trends");
		mv.addObject("page_header", null);
		
		mv.addObject("selectListBnsList", selectListBnsList);
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
	@RequestMapping(value = "/board/bnsDelete.mwav")
	public ModelAndView deleteBnsDelete(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/Company/CompanyMasterPage_1");

		boardService.deleteBnsDelete(commandMap.getMap());

		return mv;
	}
	
	
	

	// ///////////////////////////////////BoardNotices/////////////////////////////////////

	/*
	 * ========================================등록================================
	 * ========
	 */
	// 1번 BuForm : Form 입력만 가능 (뒤로가기, list)
	@RequestMapping(value = "/board/buForm.mwav")
	public ModelAndView insertBuForm(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/CustomerService/CS-MasterPage_1");

		System.out.println("순서");
		log.debug("인터셉터 테스트");
		boardService.insertBuForm(commandMap.getMap());

		String mm = "site";
		mv.addObject("mm", mm);
		mv.addObject("mode", "m_buForm");

		
		mv.addObject("breadcrumb", "IT Trends");
		mv.addObject("page_header", "IT Trends");

		// mv.addObject("insertBuForm", insertBuForm);
		// mv.addObject("IDX", commandMap.get("IDX"));

		return mv;
	}

	/*
	 * ========================================보기================================
	 * ========
	 */
	// 2번 BuView : 수정/삭제가능
	@RequestMapping(value = "/board/buView.mwav")
	public ModelAndView selectOneBuView(CommandMap commandMap,
			HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/CustomerService/CS-MasterPage");

		// Common_Util.selectListCommandMap(commandMap); // 키 출력

		/*
		 * if (commandMap.isEmpty() == false) { System.out.println("들어옴");
		 * Iterator<Entry<String, Object>> iterator = commandMap.getMap()
		 * .entrySet().iterator(); Entry<String, Object> entry = null; while
		 * (iterator.hasNext()) { entry = iterator.next(); log.debug("key : " +
		 * entry.getKey() + ",\tvalue : " + entry.getValue());
		 * System.out.println("key : " + entry.getKey() + ",\tvalue : " +
		 * entry.getValue()); } }
		 */

		log.debug("인터셉터 테스트");
		System.out.println("테스트");
		Map<String, Object> selectOneBuView = boardService
				.selectOneBuView(commandMap.getMap());

		if (selectOneBuView != null && !selectOneBuView.isEmpty()) {
			System.out.println("view 줄랭");

			String mm = "site";
			mv.addObject("mm", mm);
			mv.addObject("mode", "m_buView");
			
			mv.addObject("breadcrumb", "IT Trends");
			mv.addObject("page_header", "IT Trends");
			
			
            //meta태그 이미지 
			mv.addObject("meta_image", selectOneBuView.get("buRelatedLink"));
			mv.addObject("selectOneBuView", selectOneBuView);
		}
		System.out.println("view찍히낭 = " + mv);
		return mv;
	}

	/*
	 * ========================================수정================================
	 * ========
	 */
	// 3번 BuUpdate : 리스트 업데이트
	@RequestMapping(value = "/board/buUpdate.mwav")
	public ModelAndView updateBuform(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/CustomerService/CS-MasterPage_1");

		mode = "SbuUpdate";
		request.setAttribute("mode", mode);
		
		mv.addObject("breadcrumb", "IT Trends");
		mv.addObject("page_header", "IT Trends");


		// 위의 view랑 동일하게 사용

		boardService.updateBuform(commandMap.getMap());
		return mv;
	}

	/*
	 * // 7번 BuUpdatePro : 리스트 업데이트
	 * 
	 * @RequestMapping(value = "/board/BuUpdatePro.mwav") public ModelAndView
	 * updateBuform(CommandMap commandMap) throws Exception { ModelAndView mv =
	 * new ModelAndView("/Company/CompanyMasterPage_1");
	 * 
	 * boardService.updateBuform(commandMap.getMap()); return mv; }
	 */

	/*
	 * ========================================리스트(SelectOne, SelectList
	 * 순)========================================
	 */
	// 4번 FrontNewsList : 메인페이지 앞단 5개씩 출력, 작성일 기준
	@RequestMapping(value = "/board/buFrontList.mwav")
	public ModelAndView selectListBuFrontList(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView(
				"/CommonApps/BoardNotice/FrontNoticeList");
		/*
		 * mode = "SFBuList"; session.setAttribute("mode", mode); String
		 * sessiontest = (String) session.getAttribute(mode);
		 * 
		 * System.out.println("sessiontest=" + sessiontest);
		 */

		// * action-servlet.xml에서 위에 .jsp 설정해줘서 위의 CommonApps 부터 되는거
		cou.selectCommandMapList(commandMap); // 키 출력

		List<Map<String, Object>> selectListBuFrontList = boardService
				.selectListBuFrontList(commandMap.getMap());

		if (selectListBuFrontList != null && !selectListBuFrontList.isEmpty()) {

			mode = "SFbuList";
			request.setAttribute("mode", mode);
			
			mv.addObject("breadcrumb", "IT Trends");
			mv.addObject("page_header", "IT Trends");


			mv.addObject("selectListBuFrontList", selectListBuFrontList);
		}
		System.out.println("front찍히낭 = " + mv);
		return mv;
	}

	// 5번 BuList : 리스트
	@RequestMapping(value = "/board/buList.mwav")
	public ModelAndView selectListBuList(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		//ModelAndView mv = new ModelAndView("/CustomerService/CS-MasterPage");
		ModelAndView mv = new ModelAndView("/CommonApps/BoardNotice/buList");

		String pageNum = (String) commandMap.get("pageNum");
		Paging paging = new Paging();
		if (pageNum == null) {
			pageNum = "1";
		}
		int totalRow = boardService.selectNoticeOneGetTotalCount();
		System.out.println("totalRow=" + totalRow);

		// Paging pv = new Paging(pageNum, 10 , 10, totalCount);
		List<Map<String, Object>> selectListBuList;
		PagingVO pagingVO = paging.setPagingInfo(totalRow, 5, pageNum);
		commandMap.put("startRow", paging.getStartRow(pageNum));
		commandMap.put("endRow", paging.getEndRow(pageNum));
		if (totalRow > 0) {
			selectListBuList = boardService.selectListBuList(commandMap
					.getMap());
			// selectboardList =
			// boardService.selectBuList(commandMap.getMap());

		} else {
			selectListBuList = Collections.emptyList();
		}
		String mm = "site";
		mv.addObject("mm", mm);
		mv.addObject("mode", "m_buList");
		
		mv.addObject("breadcrumb", "IT Trends");
		mv.addObject("page_header", "IT Trends");
		


		System.out.println("!!!!!!!!!!selectListBuList = " + selectListBuList);
		mv.addObject("selectListBuList", selectListBuList);
		mv.addObject("pagingVO", pagingVO);
		mv.addObject("totalRow", totalRow);
		// mv.addObject("paging", pv.print());
		System.out.println("mv = " + mv);
		return mv;
	}

	/*
	 * ========================================삭제================================
	 * ========
	 */
	// 6번 BuDelete
	@RequestMapping(value = "/board/buDelete.mwav")
	public ModelAndView deleteBuDelete(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/CustomerService/CS-MasterPage");

		boardService.deleteBuDelete(commandMap.getMap());

		return mv;
	}

}