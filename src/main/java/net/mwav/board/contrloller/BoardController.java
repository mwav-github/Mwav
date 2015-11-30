package net.mwav.board.contrloller;

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
import net.common.common.Paging;
import net.common.common.PagingVO;
import net.common.common.Paging_2;
import net.mwav.board.service.BoardService;

@Controller
public class BoardController {
	Logger log = Logger.getLogger(this.getClass());
	// HttpServletRequest request = null;
	// 자바에서 세션사용을 위해서는 아래와 같이 필요
	// 세션 관련 설정은 prehandle 에서 추후 지정(들어오는 url에 따라서)
	// HttpSession session = request.getSession();

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

	// 1번 FrontNewsList : 메인페이지 앞단 5개씩 출력, 작성일 기준
	@RequestMapping(value = "/board/bnsFrontList.do")
	public ModelAndView selectFrontList(CommandMap commandMap,
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
		System.out.println("순서");
		log.debug("인터셉터 테스트");
		if (commandMap.isEmpty() == false) {
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
		}

		List<Map<String, Object>> boardFrontList = boardService
				.selectFrontList(commandMap.getMap());

		if (boardFrontList != null && !boardFrontList.isEmpty()) {

			mode = "SFbnsList";
			request.setAttribute("mode", mode);

			mv.addObject("boardFrontList", boardFrontList);
		}

		return mv;
	}

	// 2번 bnsForm : From 입력만 가능 (뒤로가기, list)
	@RequestMapping(value = "/board/bnsForm.do")
	public ModelAndView insertbnsForm(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/Company/CompanyMasterPage_1");

		System.out.println("순서");
		log.debug("인터셉터 테스트");
		List<Map<String, Object>> insertbnsForm = boardService
				.insertbnsForm(commandMap.getMap());

		if (insertbnsForm != null && !insertbnsForm.isEmpty()) {

			mode = "SbnsForm";
			request.setAttribute("mode", mode);

			mv.addObject("insertbnsForm", insertbnsForm);
			// mv.addObject("IDX", commandMap.get("IDX"));
		}

		return mv;
	}

	// 3번 bnsView : 수정/삭제가능
	@RequestMapping(value = "/board/bnsView.do")
	public ModelAndView selectbnsView(CommandMap commandMap,
			HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/Company/CompanyMasterPage_1");

		if (commandMap.isEmpty() == false) {
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
		}

		log.debug("인터셉터 테스트");
		System.out.println("테스트");
		Map<String, Object> selectboardView = boardService
				.selectbnsView(commandMap.getMap());

		if (selectboardView != null && !selectboardView.isEmpty()) {
			System.out.println("view 줄랭");

			mode = "SbnsView";
			request.setAttribute("mode", mode);

			mv.addObject("selectboardView", selectboardView);
		}

		return mv;
	}

	// 4번 bnsDelete
	@RequestMapping(value = "/board/bnsDelete.do")
	public ModelAndView deleteBoard(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/Company/CompanyMasterPage_1");

		boardService.deleteBoard(commandMap.getMap());

		return mv;
	}

	// 5번 bnsList : 리스트
	@RequestMapping(value = "/board/bnsList.do")
	public ModelAndView selectbnsList(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/Company/CompanyMasterPage_1");
	
		String pageNum = (String) commandMap.get("pageNum");
		Paging_2 paging = new Paging_2();
		if (pageNum == null) {
			pageNum = "1";
		}
		int totalCount = boardService.gettotalCount();

		// Paging pv = new Paging(pageNum, 10 , 10, totalCount);
		List<Map<String, Object>> selectboardList;
		PagingVO pagingVO = paging.pagevalue(totalCount, 5);
		commandMap.put("startRow", paging.getStartRow(pageNum));
		commandMap.put("endRow", paging.getEndRow(pageNum));
		if (totalCount > 0) {
			selectboardList = boardService.selectbnsList(commandMap.getMap());
			// selectboardList =
			// boardService.selectbnsList(commandMap.getMap());

		} else {
			selectboardList = Collections.emptyList();
		}
		System.out.println("찍히낭");
		mode = "SbnsList";
		request.setAttribute("mode", mode);

		mv.addObject("selectboardList", selectboardList);
		mv.addObject("pagingVO", pagingVO);
		mv.addObject("totalCount", totalCount);
		// mv.addObject("paging", pv.print());
		return mv;
	}

	// 7번 bnsUpdate : 리스트 업데이트
	@RequestMapping(value = "/board/bnsUpdate.do")
	public ModelAndView openupdatebnsform(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/Company/CompanyMasterPage_1");

		mode = "SbnsUpdate";
		request.setAttribute("mode", mode);

		// 위의 view랑 동일하게 사용

		Map<String, Object> selectboardUpdate = boardService
				.selectbnsView(commandMap.getMap());
		mv.addObject("selectboardUpdate", selectboardUpdate);
		return mv;
	}

	// 7번 bnsUpdatePro : 리스트 업데이트
	@RequestMapping(value = "/board/bnsUpdatePro.do")
	public ModelAndView updatebnsform(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/Company/CompanyMasterPage_1");

		boardService.updatebnsform(commandMap.getMap());
		return mv;
	}
}
