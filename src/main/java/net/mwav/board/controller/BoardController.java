package net.mwav.board.controller;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.common.common.APINaverTrend;
import net.common.common.CommandMap;
import net.mwav.board.service.BoardService;
import net.mwav.common.module.Common_Utils;
import net.mwav.common.module.Paging;
import net.mwav.common.module.PagingVO;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class BoardController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "boardService")
	private BoardService boardService;

	@Autowired
	private APINaverTrend apiNaverTrend;

	private Common_Utils cou = new Common_Utils();
	private String mode = null;

	// - Controller > Service > ServiceImpl > DAO > SQL(XML) > Controller > JSP
	/*
	 * 1. bnsForm : mode = SbnsForm /CommonApps/BoardNews/bnsForm.jsp 2. bnsList
	 * : mode = SbnsList /CommonApps/BoardNews/bnsList.jsp 3. bnsView : mode =
	 * SbnsView /CommonApps/BoardNews/bnsView.jsp 4. FrontNewsList : mode =
	 * SFbnsList /CommonApps/BoardNews/FrontNewsList.jsp 5. bnsUpdate : mode =
	 * SbnsUpdate /CommonApps/BoardNews/bnsForm.jsp
	 */

	// 1번 bnsForm : Form 입력만 가능 (뒤로가기, list)
	@RequestMapping(value = "/board/bnsForm.mwav")
	public ModelAndView insertBnsForm(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		log.info("insertBnsForm()");
		ModelAndView mv = new ModelAndView("/Company/CompanyMasterPage_1");

		/*
		 * forward logic if (staff_id == null){ forward_url =
		 * "/Company/CompanyMasterPage_1"; }else{ forward_url =
		 * "/Admins/AdminsMasterPage"; } ModelAndView mv = new
		 * ModelAndView(forward_url);
		 */

		boardService.insertBnsForm(commandMap.getMap());

		mv.addObject("mm", "site");
		mv.addObject("mode", "m_bnsForm");
		mv.addObject("breadcrumb", "IT Trends");
		mv.addObject("page_header", "IT Trends");
		// mv.addObject("insertBnsForm", insertBnsForm);
		// mv.addObject("IDX", commandMap.get("IDX"));

		return mv;
	}

	// 1번 bnsView : 수정/삭제가능
	@RequestMapping(value = "/board/bnsView.mwav")
	public ModelAndView selectOneBnsView(CommandMap commandMap,
			HttpServletRequest request, HttpSession session) throws Exception {
		log.info("selectOneBnsView()");
		ModelAndView mv = new ModelAndView("/Company/CompanyMasterPage_1");

		// Common_Util.selectListCommandMap(commandMap); // 키 출력
		try {
			/*
			 * if (commandMap.isEmpty() == false) { System.out.println("들어옴");
			 * Iterator<Entry<String, Object>> iterator = commandMap.getMap()
			 * .entrySet().iterator(); Entry<String, Object> entry = null; while
			 * (iterator.hasNext()) { entry = iterator.next();
			 * log.debug("key : " + entry.getKey() + ",\tvalue : " +
			 * entry.getValue()); System.out.println("key : " + entry.getKey() +
			 * ",\tvalue : " + entry.getValue()); } }
			 */

			/*
			 * log.info("call filter.do"); String param = (String)
			 * request.getParameter("bNews_id");
			 * log.info("call filter.value"+param);
			 */

			Map<String, Object> selectOneBnsView = boardService.selectOneBnsView(commandMap.getMap());
			String bnKeyword = selectOneBnsView.get("bnKeyword").toString();
			String naverLabJsonString = null;
			if (Common_Utils.isEmpty(bnKeyword) == false) {
				naverLabJsonString = apiNaverTrend.requestNaverTrend(bnKeyword);

				//http://noritersand.tistory.com/240
				/* ObjectMapper mapper = new ObjectMapper();

		        List<HashMap<String, String>> list = new ArrayList<HashMap<String, String>>();
				list = mapper
						.readValue(
								dataJsonString,
								new TypeReference<ArrayList<HashMap<String, String>>>() {
								});*/

				//Common_Utils.selectMapList(list);
			} else { // bnKeyword is null
				naverLabJsonString = null;
			}

//			System.out.println(dataJsonString);
			if (selectOneBnsView != null && !selectOneBnsView.isEmpty()) {

				mv.addObject("mm", "site");
				mv.addObject("mode", "m_bnsView");
				mv.addObject("breadcrumb", "IT Trends");
				mv.addObject("page_header", null);
				// mv.addObject("page_header", "IT Trends");

				String meta_image = (String) selectOneBnsView.get("bnRelatedLink");
				// meta태그 이미지
				String title = (String) selectOneBnsView.get("bnTitle");
				String description = (String) selectOneBnsView.get("bnSubTitle");
				// meta태그 이미지
				mv.addObject("meta_image", meta_image);
				mv.addObject("title", title);
				mv.addObject("description", description);
				mv.addObject("selectOneBnsView", selectOneBnsView);
				
				mv.addObject("naverLabJsonString", naverLabJsonString);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	// 1번 bnsUpdate : 리스트 업데이트
	@RequestMapping(value = "/board/bnsUpdate.mwav")
	public ModelAndView updateBnsform(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		log.info("updateBnsform()");
		ModelAndView mv = new ModelAndView("/Company/CompanyMasterPage_1");
		request.setAttribute("mode", "SbnsUpdate");

		mv.addObject("breadcrumb", "IT Trends");
		mv.addObject("page_header", "IT Trends");

		boardService.updateBnsform(commandMap.getMap());
		return mv;
	}

	/*
	 * // 7번 bnsUpdatePro : 리스트 업데이트
	 * 
	 * @RequestMapping(value = "/board/bnsUpdatePro.mwav") public ModelAndView
	 * updatebnsform(CommandMap commandMap) throws Exception { ModelAndView mv =
	 * new ModelAndView("/Company/CompanyMasterPage_1");
	 * boardService.updatebnsform(commandMap.getMap()); return mv; }
	 */

	// 1번 FrontNewsList : 메인페이지 앞단 5개씩 출력, 작성일 기준
	@RequestMapping(value = "/board/bnsFrontList.mwav")
	public ModelAndView selectListBnsFrontList(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		log.info("selectListBnsFrontList()");
		ModelAndView mv = new ModelAndView(
				"/CommonApps/BoardNews/FrontNewsList");

		cou.selectCommandMapList(commandMap); // 키 출력
		List<Map<String, Object>> selectListBnsFrontList = boardService
				.selectListBnsFrontList(commandMap.getMap());

		if (selectListBnsFrontList != null && !selectListBnsFrontList.isEmpty()) {
			request.setAttribute("mode", "SFbnsList");
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
		log.info("selectListBnsList()");
		ModelAndView mv = new ModelAndView("/CommonApps/BoardNews/bnsList");

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

		} else {
			selectListBnsList = Collections.emptyList();
		}
		mv.addObject("mm", "site");
		mv.addObject("mode", "m_bnsList");
		mv.addObject("breadcrumb", "IT Trends");
		mv.addObject("page_header", null);
		// mv.addObject("page_header", "IT Trends");

		mv.addObject("selectListBnsList", selectListBnsList);
		mv.addObject("pagingVO", pagingVO);
		mv.addObject("totalRow", totalRow);
		// mv.addObject("paging", pv.print());
		return mv;
	}

	// 1번 bnsDelete
	@RequestMapping(value = "/board/bnsDelete.mwav")
	public ModelAndView deleteBnsDelete(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/Company/CompanyMasterPage_1");
		boardService.deleteBnsDelete(commandMap.getMap());
		return mv;
	}

	// Notice
	// 1번 BuForm : Form 입력만 가능 (뒤로가기, list)
	@RequestMapping(value = "/board/buForm.mwav")
	public ModelAndView insertBuForm(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		log.info("insertBuForm()");
		ModelAndView mv = new ModelAndView("/CustomerService/CS-MasterPage_1");

		boardService.insertBuForm(commandMap.getMap());

		mv.addObject("mm", "site");
		mv.addObject("mode", "m_buForm");
		mv.addObject("breadcrumb", "IT Trends");
		mv.addObject("page_header", "IT Trends");
		// mv.addObject("insertBuForm", insertBuForm);
		// mv.addObject("IDX", commandMap.get("IDX"));
		return mv;
	}

	// 2번 BuView : 수정/삭제가능
	@RequestMapping(value = "/board/buView.mwav")
	public ModelAndView selectOneBuView(CommandMap commandMap,
			HttpServletRequest request, HttpSession session) throws Exception {
		log.info("selectOneBuView()");
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
		Map<String, Object> selectOneBuView = boardService
				.selectOneBuView(commandMap.getMap());

		if (selectOneBuView != null && !selectOneBuView.isEmpty()) {

			mv.addObject("mm", "site");
			mv.addObject("mode", "m_buView");
			mv.addObject("breadcrumb", "Announcement");
			mv.addObject("page_header", "Announcement");

			String meta_image = (String) selectOneBuView.get("buRelatedLink");

			String title = (String) selectOneBuView.get("buTitle");
			String description = (String) selectOneBuView.get("buSubTitle");
			// meta태그 이미지
			mv.addObject("meta_image", meta_image);
			mv.addObject("title", title);
			mv.addObject("description", description);
			mv.addObject("selectOneBuView", selectOneBuView);
		}
		return mv;
	}

	// 3번 BuUpdate : 리스트 업데이트
	@RequestMapping(value = "/board/buUpdate.mwav")
	public ModelAndView updateBuform(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		log.info("updateBuform()");
		ModelAndView mv = new ModelAndView("/CustomerService/CS-MasterPage_1");

		request.setAttribute("mode", "SbuUpdate");

		mv.addObject("breadcrumb", "IT Trends");
		mv.addObject("page_header", "IT Trends");

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
	// 4번 FrontNewsList : 메인페이지 앞단 5개씩 출력, 작성일 기준
	@RequestMapping(value = "/board/buFrontList.mwav")
	public ModelAndView selectListBuFrontList(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		log.info("selectListBuFrontList()");
		ModelAndView mv = new ModelAndView(
				"/CommonApps/BoardNotice/FrontNoticeList");

		// * action-servlet.xml에서 위에 .jsp 설정해줘서 위의 CommonApps 부터 되는거
		cou.selectCommandMapList(commandMap); // 키 출력

		List<Map<String, Object>> selectListBuFrontList = boardService
				.selectListBuFrontList(commandMap.getMap());

		if (selectListBuFrontList != null && !selectListBuFrontList.isEmpty()) {
			request.setAttribute("mode", "SFbuList");
			mv.addObject("breadcrumb", "IT Trends");
			mv.addObject("page_header", "IT Trends");
			mv.addObject("selectListBuFrontList", selectListBuFrontList);
		}
		return mv;
	}

	// 5번 BuList : 리스트
	@RequestMapping(value = "/board/buList.mwav")
	public ModelAndView selectListBuList(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		log.info("selectListBuList()");
		ModelAndView mv = new ModelAndView("/CommonApps/BoardNotice/buList");

		String pageNum = (String) commandMap.get("pageNum");
		Paging paging = new Paging();
		if (pageNum == null) {
			pageNum = "1";
		}
		int totalRow = boardService.selectNoticeOneGetTotalCount();

		// Paging pv = new Paging(pageNum, 10 , 10, totalCount);
		List<Map<String, Object>> selectListBuList;
		PagingVO pagingVO = paging.setPagingInfo(totalRow, 5, pageNum);
		commandMap.put("startRow", paging.getStartRow(pageNum));
		commandMap.put("endRow", paging.getEndRow(pageNum));
		if (totalRow > 0) {
			selectListBuList = boardService.selectListBuList(commandMap
					.getMap());
		} else {
			selectListBuList = Collections.emptyList();
		}
		mv.addObject("mm", "site");
		mv.addObject("mode", "m_buList");
		mv.addObject("breadcrumb", "IT Trends");
		mv.addObject("page_header", "IT Trends");
		mv.addObject("selectListBuList", selectListBuList);
		mv.addObject("pagingVO", pagingVO);
		mv.addObject("totalRow", totalRow);
		// mv.addObject("paging", pv.print());
		return mv;
	}

	// 6번 BuDelete
	@RequestMapping(value = "/board/buDelete.mwav")
	public ModelAndView deleteBuDelete(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		log.info("deleteBuDelete()");
		ModelAndView mv = new ModelAndView("/CustomerService/CS-MasterPage");
		boardService.deleteBuDelete(commandMap.getMap());
		return mv;
	}

}