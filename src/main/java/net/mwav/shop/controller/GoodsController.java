package net.mwav.shop.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import net.common.common.CommandMap;
import net.mwav.common.module.Common_Utils;
import net.mwav.shop.service.GoodsService;

@Controller
public class GoodsController {

	Common_Utils cou = new Common_Utils();
	String mode;

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
	public ModelAndView selectListGdsView(CommandMap commandMap, HttpServletRequest request, HttpServletResponse reponse, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/Shop/GdsView/CellView");

		Map<String, Object> selectOneGdsView = goodsService.selectOneGdsView(commandMap.getMap());

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
	public ModelAndView selectListGdsList(CommandMap commandMap, HttpServletRequest request, HttpServletResponse reponse, HttpSession session) throws Exception {
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