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
import net.mwav.board.service.BoardService;
import net.mwav.common.module.Common_Util;
import net.mwav.common.module.Paging;
import net.mwav.common.module.PagingVO;

@Controller
public class BoardController {
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
	 * 1. bnsForm : mode = SbnsForm /CommonApps/BoardNews/bnsForm.jsp 2. bnsList
	 * : mode = SbnsList /CommonApps/BoardNews/bnsList.jsp 3. bnsView : mode =
	 * SbnsView /CommonApps/BoardNews/bnsView.jsp 4. FrontNewsList : mode =
	 * SFbnsList /CommonApps/BoardNews/FrontNewsList.jsp 5. bnsUpdate : mode =
	 * SbnsUpdate /CommonApps/BoardNews/bnsForm.jsp
	 */
	@Resource(name = "boardService")
	private BoardService boardService;
	
	
	/* ======================BoardNews====================== */
	
	

	/*========================================등록========================================*/
	// 1번 bnsForm : Form 입력만 가능 (뒤로가기, list)
	@RequestMapping(value = "/board/bnsForm.do")
	public ModelAndView insertBnsForm(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/Company/CompanyMasterPage_1");

		System.out.println("순서");
		log.debug("인터셉터 테스트");
		boardService.insertBnsForm(commandMap.getMap());

		mode = "SbnsForm";
		request.setAttribute("mode", mode);

		// mv.addObject("insertBnsForm", insertBnsForm);
		// mv.addObject("IDX", commandMap.get("IDX"));

		return mv;
	}

	/*========================================보기========================================*/
	// 1번 bnsView : 수정/삭제가능
	@RequestMapping(value = "/board/bnsView.do")
	public ModelAndView selectOneBnsView(CommandMap commandMap,
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
		Map<String, Object> selectOneBnsView = boardService
				.selectOneBnsView(commandMap.getMap());

		if (selectOneBnsView != null && !selectOneBnsView.isEmpty()) {
			System.out.println("view 줄랭");

			mode = "SbnsView";
			request.setAttribute("mode", mode);

			mv.addObject("selectOneBnsView", selectOneBnsView);
		}

		return mv;
	}

	/*========================================수정========================================*/
	// 1번 bnsUpdate : 리스트 업데이트
	@RequestMapping(value = "/board/bnsUpdate.do")
	public ModelAndView updateBnsform(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/Company/CompanyMasterPage_1");

		mode = "SbnsUpdate";
		request.setAttribute("mode", mode);

		// 위의 view랑 동일하게 사용

		boardService.updateBnsform(commandMap.getMap());
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

	/*========================================리스트(SelectOne, SelectList 순)========================================*/
	// 1번 FrontNewsList : 메인페이지 앞단 5개씩 출력, 작성일 기준
	@RequestMapping(value = "/board/bnsFrontList.do")
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
		cou.selectListCommandMap(commandMap); // 키 출력

		List<Map<String, Object>> selectListBnsFrontList = boardService
				.selectListBnsFrontList(commandMap.getMap());

		if (selectListBnsFrontList != null && !selectListBnsFrontList.isEmpty()) {

			mode = "SFbnsList";
			request.setAttribute("mode", mode);

			mv.addObject("selectListBnsFrontList", selectListBnsFrontList);
		}

		return mv;
	}

	// 2번 bnsList : 리스트
	@RequestMapping(value = "/board/bnsList.do")
	public ModelAndView selectListBnsList(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/Company/CompanyMasterPage_1");

		String pageNum = (String) commandMap.get("pageNum");
		Paging paging = new Paging();
		if (pageNum == null) {
			pageNum = "1";
		}
		int totalRow = boardService.selectOneGetTotalCount();
        System.out.println("totalRow="+totalRow);
		
		// Paging pv = new Paging(pageNum, 10 , 10, totalCount);
		List<Map<String, Object>> selectListBnsList;
		PagingVO pagingVO = paging.setPagingInfo(totalRow, 5, pageNum);  // 총 숫자, 한페이지에 노출 수 
		commandMap.put("startRow", paging.getStartRow(pageNum)); // 시작 열
		commandMap.put("endRow", paging.getEndRow(pageNum));  // 끝 열
		if (totalRow > 0) {
			selectListBnsList = boardService.selectListBnsList(commandMap.getMap());
			// selectboardList =
			// boardService.selectbnsList(commandMap.getMap());

		} else {
			selectListBnsList = Collections.emptyList();
		}
		System.out.println("찍히낭");
		mode = "SbnsList";
		request.setAttribute("mode", mode);

		mv.addObject("selectListBnsList", selectListBnsList);
		mv.addObject("pagingVO", pagingVO);
		mv.addObject("totalRow", totalRow);
		// mv.addObject("paging", pv.print());
		return mv;
	}

	/*========================================삭제========================================*/
	// 1번 bnsDelete
	@RequestMapping(value = "/board/bnsDelete.do")
	public ModelAndView deleteBnsDelete(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/Company/CompanyMasterPage_1");

		boardService.deleteBnsDelete(commandMap.getMap());

		return mv;
	}

}