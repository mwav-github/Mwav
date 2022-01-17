package net.mwav.shop.controller;

import net.common.common.CommandMap;
import net.mwav.common.module.Common_Utils;
import net.mwav.shop.service.GoodsService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
public class GoodsController {
	private static final Logger logger = LoggerFactory.getLogger(GoodsController.class);
	// HttpServlsetRequest request = null;
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
	@Inject
	private GoodsService goodsService;

	/*
	 * ========================================등록================================
	 * ========
	 */

	/*
	 * ========================================보기================================
	 * ========
	 */
	@RequestMapping(value = "/shop/goods/gdsView.mwav")
	public ModelAndView selectListGdsView(CommandMap commandMap,
			HttpServletRequest request, HttpServletResponse reponse,
			HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/Shop/GdsView/CellView");
		
			
		Map<String, Object> selectOneGdsView = goodsService
				.selectOneGdsView(commandMap.getMap());

		

		if (selectOneGdsView != null && !selectOneGdsView.isEmpty()) {
			String mm = "cGds";
			mv.addObject("mm", mm);

			mv.addObject("selectOneGdsView", selectOneGdsView);

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

	@RequestMapping(value = "/shop/goods/gdsList.mwav")
	public ModelAndView selectListGdsList(CommandMap commandMap,
			HttpServletRequest request, HttpServletResponse reponse,
			HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/Shop/GdsList/CellList");

		// 앞에 보여주는 거니 페이징 불필요.
		List<Map<String, Object>> selectListGdsList;

		selectListGdsList = goodsService.selectListGdsList(commandMap.getMap());

		mv.addObject("selectListGdsList", selectListGdsList);

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
	 * 
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