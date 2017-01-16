package net.mwav.qa.controller;

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
import net.mwav.qa.service.QAService;
import net.mwav.shop.service.GoodsService;
import net.mwav.common.module.Common_Utils;
import net.mwav.common.module.Paging;
import net.mwav.common.module.PagingVO;

@Controller
public class QAController {
	Logger log = Logger.getLogger(this.getClass());
	// HttpServlsetRequest request = null;
	// 자바에서 세션사용을 위해서는 아래와 같이 필요
	// 세션 관련 설정은 prehandle 에서 추후 지정(들어오는 url에 따라서)
	// HttpSession session = request.getSession();
	Common_Utils cou = new Common_Utils();
	Paging paging = new Paging();
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
	@Resource(name = "qaService")
	private QAService qaService;

	/*
	 * ========================================등록================================
	 * ========
	 */

	// 1번 bnsForm : Form 입력만 가능 (뒤로가기, list)
	@RequestMapping(value = "/qa/qaForm.do")
	public @ResponseBody boolean insertQAForm(CommandMap commandMap,
			HttpServletRequest request) throws Exception {

		System.out.println("순서");
		log.debug("인터셉터 테스트");
		qaService.insertQAForm(commandMap.getMap(), request);

		boolean flag = qaService.insertQAForm(commandMap.getMap(), request);

		System.out.println("df"+flag);
		// mv.addObject("insertBnsForm", insertBnsForm);
		// mv.addObject("IDX", commandMap.get("IDX"));

		return flag;
	}

	/*
	 * ========================================보기================================
	 * ========
	 */
	@RequestMapping(value = "/qa/qaView.do")
	public ModelAndView selectOneNsmView(CommandMap commandMap,
			HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/CommonApps/BoardQnA/qaView");

		

		log.debug("인터셉터 테스트");
		System.out.println("테스트");
		Map<String, Object> selectOneQAView = qaService
				.selectOneQAView(commandMap.getMap());

		if (selectOneQAView != null && !selectOneQAView.isEmpty()) {
			System.out.println("view 줄랭");

			
			String mm = "site";
			mv.addObject("mm", mm);
			mv.addObject("mode", "m_nsmView");
						

			mv.addObject("pageNum", paging.getPageNum( (String) commandMap.get("pageNum")));
			

			mv.addObject("selectOneQAView", selectOneQAView);
		}

		return mv;
	}

	/*
	 * ========================================수정================================
	 * ========
	 */

	/*
	 * ========================================리스트(SelectOne, SelectList
	 * 순)========================================
	 */
	//조인해서 가져와야 할듯. 
	@RequestMapping(value = "/qa/qaFrontList.do")
	public ModelAndView selectListBnsFrontList(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView(
				"/CommonApps/BoardQnA/FrontQAList");
	
		cou.selectCommandMapList(commandMap); // 키 출력

		List<Map<String, Object>> selectListQAFrontList = qaService
				.selectListQAFrontList(commandMap.getMap());

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
		@RequestMapping(value = "/qa/qaList.do")
		public ModelAndView selectListQAList(CommandMap commandMap,
				HttpServletRequest request) throws Exception {
			ModelAndView mv = new ModelAndView("/Company/CompanyMasterPage_1");

			String pageNum = (String) commandMap.get("pageNum");
			Paging paging = new Paging();
			if (pageNum == null) {
				pageNum = "1";
			}
			int totalRow = qaService.selectOneGetTotalCount();
			System.out.println("totalRow=" + totalRow);

			// Paging pv = new Paging(pageNum, 10 , 10, totalCount);
			List<Map<String, Object>> selectListQAList;
			PagingVO pagingVO = paging.setPagingInfo(totalRow, 5, pageNum); // 총 숫자,
																			// 한페이지에
																			// 노출 수
			commandMap.put("startRow", paging.getStartRow(pageNum)); // 시작 열
			commandMap.put("endRow", paging.getEndRow(pageNum)); // 끝 열
			if (totalRow > 0) {
				selectListQAList = qaService.selectListQAList(commandMap
						.getMap());
				// selectboardList =
				// boardService.selectbnsList(commandMap.getMap());

			} else {
				selectListQAList = Collections.emptyList();
			}
			System.out.println("찍히낭");
			String mm = "site";
			mv.addObject("mm", mm);
			mv.addObject("mode", "m_bnsList");

			mv.addObject("breadcrumb", "IT Trends");
			//mv.addObject("page_header", "IT Trends");
			mv.addObject("page_header", null);
			
			mv.addObject("selectListQAList", selectListQAList);
			mv.addObject("pagingVO", pagingVO);
			mv.addObject("totalRow", totalRow);
			// mv.addObject("paging", pv.print());
			return mv;
		}
	/*
	 * ========================================삭제================================
	 * ========
	 */

	// ///////////////////////////////////BoardNotices/////////////////////////////////////

	/*
	 * ========================================등록================================
	 * ========
	 */

	/*
	 * ========================================보기================================
	 * ========
	 */

	/*
	 * ========================================수정================================
	 * ========
	 */

	/*
	 * ========================================리스트(SelectOne, SelectList
	 * 순)========================================
	 */

	/*
	 * ========================================삭제================================
	 * ========
	 */

}