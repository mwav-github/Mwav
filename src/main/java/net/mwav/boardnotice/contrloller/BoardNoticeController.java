package net.mwav.boardnotice.contrloller;


import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.common.common.CommandMap;
import net.common.common.Common_Util;
import net.common.common.PagingVO;
import net.common.common.Paging_2;
import net.mwav.boardnotice.service.BoardNoticeService;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardNoticeController {
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
	 * 1. BnForm : mode = SBnForm /CommonApps/BoardNews/BnForm.jsp 2. BnList
	 * : mode = SBnList /CommonApps/BoardNews/BnList.jsp 3. BnView : mode =
	 * SBnView /CommonApps/BoardNews/BnView.jsp 4. FrontNewsList : mode =
	 * SFBnList /CommonApps/BoardNews/FrontNewsList.jsp 5. BnUpdate : mode =
	 * SBnUpdate /CommonApps/BoardNews/BnForm.jsp
	 */
	@Resource(name = "boardNoticeService")
	private BoardNoticeService boardNoticeService;

	/*========================================등록========================================*/
	// 1번 BnForm : Form 입력만 가능 (뒤로가기, list)
	@RequestMapping(value = "/board/BnForm.do")
	public ModelAndView insertBnForm(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/Company/CompanyMasterPage_1");

		System.out.println("순서");
		log.debug("인터셉터 테스트");
		boardNoticeService.insertBnForm(commandMap.getMap());

		mode = "SBnForm";
		request.setAttribute("mode", mode);

		// mv.addObject("insertBnForm", insertBnForm);
		// mv.addObject("IDX", commandMap.get("IDX"));

		return mv;
	}

	/*========================================보기========================================*/
	// 2번 BnView : 수정/삭제가능
	@RequestMapping(value = "/board/BnView.do")
	public ModelAndView selectOneBnView(CommandMap commandMap,
			HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/Company/CompanyMasterPage_1");

		//Common_Util.selectListCommandMap(commandMap); // 키 출력
		
		/*if (commandMap.isEmpty() == false) {
			System.out.println("들어옴");
			Iterator<Entry<String, Object>> iterator = commandMap.getMap()
					.entrySet().iterator();
			Entry<String, Object> entry = null;
			while (iterator.hasNext()) {
				entry = iterator.next();
				log.debug("key : " + entry.getKey() + ",\tvalue : "
						+ entry.getValue());
				System.out.println("key : " + entry.getKey() + ",\tvalue : "
						+ entry.getValue());
			}
		}*/

		log.debug("인터셉터 테스트");
		System.out.println("테스트");
		Map<String, Object> selectOneBnView = boardNoticeService
				.selectOneBnView(commandMap.getMap());

		if (selectOneBnView != null && !selectOneBnView.isEmpty()) {
			System.out.println("view 줄랭");

			mode = "SBnView";
			request.setAttribute("mode", mode);

			mv.addObject("selectOneBnView", selectOneBnView);
		}

		return mv;
	}

	/*========================================수정========================================*/
	// 3번 BnUpdate : 리스트 업데이트
	@RequestMapping(value = "/board/BnUpdate.do")
	public ModelAndView updateBnform(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/Company/CompanyMasterPage_1");

		mode = "SBnUpdate";
		request.setAttribute("mode", mode);

		// 위의 view랑 동일하게 사용

		boardNoticeService.updateBnform(commandMap.getMap());
		return mv;
	}

	/*
	 * // 7번 BnUpdatePro : 리스트 업데이트
	 * 
	 * @RequestMapping(value = "/board/BnUpdatePro.do") public ModelAndView
	 * updateBnform(CommandMap commandMap) throws Exception { ModelAndView mv =
	 * new ModelAndView("/Company/CompanyMasterPage_1");
	 * 
	 * boardService.updateBnform(commandMap.getMap()); return mv; }
	 */

	/*========================================리스트(SelectOne, SelectList 순)========================================*/
	// 4번 FrontNewsList : 메인페이지 앞단 5개씩 출력, 작성일 기준
	@RequestMapping(value = "/board/BnFrontList.do")
	public ModelAndView selectListBnFrontList(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView(
				"/CommonApps/BoardNews/FrontNewsList");
		/*
		 * mode = "SFBnList"; session.setAttribute("mode", mode); String
		 * sessiontest = (String) session.getAttribute(mode);
		 * 
		 * System.out.println("sessiontest=" + sessiontest);
		 */

		// * action-servlet.xml에서 위에 .jsp 설정해줘서 위의 CommonApps 부터 되는거
		cou.selectListCommandMap(commandMap); // 키 출력

		List<Map<String, Object>> selectListBnFrontList = boardNoticeService
				.selectListBnFrontList(commandMap.getMap());

		if (selectListBnFrontList != null && !selectListBnFrontList.isEmpty()) {

			mode = "SFBnList";
			request.setAttribute("mode", mode);

			mv.addObject("selectListBnFrontList", selectListBnFrontList);
		}

		return mv;
	}

	// 5번 BnList : 리스트
	@RequestMapping(value = "/board/BnList.do")
	public ModelAndView selectListBnList(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/Company/CompanyMasterPage_1");

		String pageNum = (String) commandMap.get("pageNum");
		Paging_2 paging = new Paging_2();
		if (pageNum == null) {
			pageNum = "1";
		}
		int totalCount = boardNoticeService.selectOneGetTotalCount();

		// Paging pv = new Paging(pageNum, 10 , 10, totalCount);
		List<Map<String, Object>> selectListBnList;
		PagingVO pagingVO = paging.pagevalue(totalCount, 5);
		commandMap.put("startRow", paging.getStartRow(pageNum));
		commandMap.put("endRow", paging.getEndRow(pageNum));
		if (totalCount > 0) {
			selectListBnList = boardNoticeService.selectListBnList(commandMap.getMap());
			// selectboardList =
			// boardService.selectBnList(commandMap.getMap());

		} else {
			selectListBnList = Collections.emptyList();
		}
		System.out.println("찍히낭");
		mode = "SBnList";
		request.setAttribute("mode", mode);

		mv.addObject("selectListBnList", selectListBnList);
		mv.addObject("pagingVO", pagingVO);
		mv.addObject("totalCount", totalCount);
		// mv.addObject("paging", pv.print());
		return mv;
	}

	/*========================================삭제========================================*/
	// 6번 BnDelete
	@RequestMapping(value = "/board/BnDelete.do")
	public ModelAndView deleteBnDelete(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/Company/CompanyMasterPage_1");

		boardNoticeService.deleteBnDelete(commandMap.getMap());

		return mv;
	}

}
