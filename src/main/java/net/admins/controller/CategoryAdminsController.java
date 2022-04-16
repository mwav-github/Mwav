package net.admins.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import net.admins.service.CategoryAdminsService;
import net.admins.service.GoodsAdminsService;
import net.common.common.CommandMap;
import net.mwav.common.module.Common_Utils;

@Controller
public class CategoryAdminsController {

	Common_Utils cou = new Common_Utils();

	String mode;

	@Inject
	private CategoryAdminsService categoryAdminsService;

	@Inject
	private GoodsAdminsService goodsAdminsService;

	Common_Utils cu = new Common_Utils();

	/**
	 * 등록
	 * 1번 insertCategoryForm : Form 입력만 가능 (뒤로가기, list)
	 */
	@RequestMapping(value = "/admins/goods/categoryForm.mwav")
	public ModelAndView insertCategoryForm(CommandMap commandMap, HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/Admins/Goods/GdsCaInsert");

		session = request.getSession();

		int staff_id = (int) session.getAttribute("staff_id");
		commandMap.put("staff_id", staff_id);

		String ip = cu.getClientIP(request);
		commandMap.put("gcIpAddress", ip);
		categoryAdminsService.insertCategoryForm(commandMap.getMap());

		String mm = "caset";
		mv.addObject("mm", mm);

		return mv;
	}

	@RequestMapping(value = "/admins/goods/categoryRelationForm.mwav")
	public ModelAndView insertCategoryRelationForm(CommandMap commandMap, HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/Admins/Goods/GdsCaInsert");

		String ip = cu.getClientIP(request);

		commandMap.put("gcrIpAddress", ip);

		categoryAdminsService.insertCategoryRelationForm(commandMap.getMap());

		String mm = "caset";
		mv.addObject("mm", mm);

		return mv;
	}

	/**
	 * 보기
	 */
	@RequestMapping(value = "/admins/goods/categoryList.mwav")
	public ModelAndView selectListCategory(CommandMap commandMap, HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/Admins/Goods/GdsCaRelation");

		List<Map<String, Object>> selectListCategory = categoryAdminsService.selectListCategory(commandMap.getMap());

		List<Map<String, Object>> selectCategoryGoodsList = goodsAdminsService.selectCategoryGoodsList();

		mv.addObject("selectListCategory", selectListCategory);
		mv.addObject("selectCategoryGoodsList", selectCategoryGoodsList);
		String mm = "caset";
		mv.addObject("mm", mm);

		return mv;
	}

}