package net.mwav.board.contrloller;


import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.common.common.CommandMap;
import net.common.common.Common_Util;
import net.common.common.Paging;
import net.common.common.PagingVO;
import net.mwav.board.service.BoardNoticeServiceImpl;

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
	 * 1. BuForm : mode = SBuForm /CommonApps/BoardNews/BuForm.jsp 2. BuList
	 * : mode = SBuList /CommonApps/BoardNews/BuList.jsp 3. BuView : mode =
	 * SBuView /CommonApps/BoardNews/BuView.jsp 4. FrontNewsList : mode =
	 * SFBuList /CommonApps/BoardNews/FrontNewsList.jsp 5. BuUpdate : mode =
	 * SBuUpdate /CommonApps/BoardNews/BuForm.jsp
	 */
	@Resource(name = "boardNoticeService")
	private BoardNoticeServiceImpl boardNoticeService;

	/*========================================등록========================================*/
	// 1번 BuForm : Form 입력만 가능 (뒤로가기, list)
	@RequestMapping(value = "/boardNotice/buForm.do")
	public ModelAndView insertBuForm(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/CustomerService/CS-MasterPage_1");

		System.out.println("순서");
		log.debug("인터셉터 테스트");
		boardNoticeService.insertBuForm(commandMap.getMap());

		mode = "SbuForm";
		request.setAttribute("mode", mode);

		// mv.addObject("insertBuForm", insertBuForm);
		// mv.addObject("IDX", commandMap.get("IDX"));

		return mv;
	}

	/*========================================보기========================================*/
	// 2번 BuView : 수정/삭제가능
	@RequestMapping(value = "/boardNotice/buView.do")
	public ModelAndView selectOneBuView(CommandMap commandMap,
			HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/CustomerService/CS-MasterPage_1");

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
		Map<String, Object> selectOneBuView = boardNoticeService
				.selectOneBuView(commandMap.getMap());

		if (selectOneBuView != null && !selectOneBuView.isEmpty()) {
			System.out.println("view 줄랭");

			mode = "SbuView";
			request.setAttribute("mode", mode);

			mv.addObject("selectOneBuView", selectOneBuView);
		}
		System.out.println("view찍히낭 = "+ mv);
		return mv;
	}

	/*========================================수정========================================*/
	// 3번 BuUpdate : 리스트 업데이트
	@RequestMapping(value = "/boardNotice/buUpdate.do")
	public ModelAndView updateBuform(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/CustomerService/CS-MasterPage_1");

		mode = "SbuUpdate";
		request.setAttribute("mode", mode);

		// 위의 view랑 동일하게 사용

		boardNoticeService.updateBuform(commandMap.getMap());
		return mv;
	}

	/*
	 * // 7번 BuUpdatePro : 리스트 업데이트
	 * 
	 * @RequestMapping(value = "/board/BuUpdatePro.do") public ModelAndView
	 * updateBuform(CommandMap commandMap) throws Exception { ModelAndView mv =
	 * new ModelAndView("/Company/CompanyMasterPage_1");
	 * 
	 * boardService.updateBuform(commandMap.getMap()); return mv; }
	 */

	/*========================================리스트(SelectOne, SelectList 순)========================================*/
	// 4번 FrontNewsList : 메인페이지 앞단 5개씩 출력, 작성일 기준
	@RequestMapping(value = "/boardNotice/buFrontList.do")
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
		cou.selectListCommandMap(commandMap); // 키 출력

		List<Map<String, Object>> selectListBuFrontList = boardNoticeService
				.selectListBuFrontList(commandMap.getMap());

		if (selectListBuFrontList != null && !selectListBuFrontList.isEmpty()) {

			mode = "SFbuList";
			request.setAttribute("mode", mode);

			mv.addObject("selectListBuFrontList", selectListBuFrontList);
		}
		System.out.println("front찍히낭 = "+mv);
		return mv;
	}

	// 5번 BuList : 리스트
	@RequestMapping(value = "/boardNotice/buList.do")
	public ModelAndView selectListBuList(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/CustomerService/CS-MasterPage_1");

		String pageNum = (String) commandMap.get("pageNum");
		Paging paging = new Paging();
		if (pageNum == null) {
			pageNum = "1";
		}
		int totalRow = boardNoticeService.selectNoticeOneGetTotalCount();
		System.out.println("totalRow="+totalRow);
		
		// Paging pv = new Paging(pageNum, 10 , 10, totalCount);
		List<Map<String, Object>> selectListBuList;
		PagingVO pagingVO = paging.setPagingInfo(totalRow, 5, pageNum);
		commandMap.put("startRow", paging.getStartRow(pageNum));
		commandMap.put("endRow", paging.getEndRow(pageNum));
		if (totalRow > 0) {
			selectListBuList = boardNoticeService.selectListBuList(commandMap.getMap());
			// selectboardList =
			// boardService.selectBuList(commandMap.getMap());

		} else {
			selectListBuList = Collections.emptyList();
		}
		System.out.println("bnList 찍히낭");
		mode = "SbuList";
		request.setAttribute("mode", mode);

		System.out.println("!!!!!!!!!!selectListBuList = "+selectListBuList);
		mv.addObject("selectListBuList", selectListBuList);
		mv.addObject("pagingVO", pagingVO);
		mv.addObject("totalRow", totalRow);
		// mv.addObject("paging", pv.print());
		System.out.println("mv = "+mv);
		return mv;
	}

	/*========================================삭제========================================*/
	// 6번 BuDelete
	@RequestMapping(value = "/boardNotice/buDelete.do")
	public ModelAndView deleteBuDelete(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/CustomerService/CS-MasterPage_1");

		boardNoticeService.deleteBuDelete(commandMap.getMap());

		return mv;
	}
	
	

}
