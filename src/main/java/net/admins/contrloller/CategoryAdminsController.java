package net.admins.contrloller;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import net.admins.service.CategoryAdminsService;
import net.admins.service.GoodsAdminsService;
import net.common.common.CommandMap;
import net.mwav.common.module.Common_Utils;
import net.mwav.common.module.FileUtils;
import net.mwav.common.module.ImageUtill;
import net.mwav.common.module.Paging;
import net.mwav.common.module.PagingVO;

@Controller
public class CategoryAdminsController {
	Logger log = Logger.getLogger(this.getClass());
	// HttpServletRequest request = null;
	// 자바에서 세션사용을 위해서는 아래와 같이 필요
	// 세션 관련 설정은 prehandle 에서 추후 지정(들어오는 url에 따라서)
	// HttpSession session = request.getSession();

	Common_Utils cou = new Common_Utils();

	String mode;

	// - Controller > Service > ServiceImpl > DAO > SQL(XML) > Controller > JSP

	
	@Resource(name = "categoryAdminsService")
	private CategoryAdminsService categoryAdminsService;
	
	//카테고리 관계를 위해서
	@Resource(name = "goodsAdminsService")
	private GoodsAdminsService goodsAdminsService;

	@Resource(name = "fileUtils")
	private FileUtils fileUtils;
	

	Common_Utils cu = new Common_Utils();
	
	/*
	 * ========================================등록================================
	 * ========
	 */
	
	
	// 1번 insertCategoryForm : Form 입력만 가능 (뒤로가기, list)
	@RequestMapping(value = "/admins/goods/categoryForm.do")
	public ModelAndView insertCategoryForm(CommandMap commandMap,
			HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/Admins/Goods/GdsCaInsert");


		session = request.getSession();
		
		int staff_id = (int) session.getAttribute("staff_id");
		System.out.println("staff_id=" + staff_id);
		commandMap.put("staff_id", staff_id);
		
		
		String ip = cu.getClientIP(request);
		System.out.println("ip 주소 = "+ip);
		
		//String gcEngName = (String) commandMap.get("gcEngName");
		//System.out.println("gcEngName = "+gcEngName);
		
		commandMap.put("gcIpAddress", ip);
		categoryAdminsService.insertCategoryForm(commandMap.getMap());		



		String mm = "category";
		mv.addObject("mm", mm);
				
		return mv;
	}
	
	
	@RequestMapping(value = "/admins/goods/categoryRelationForm.do")
	public ModelAndView insertCategoryRelationForm(CommandMap commandMap,
			HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/Admins/Goods/GdsCaInsert");

		
		String ip = cu.getClientIP(request);
		System.out.println("ip 주소 = "+ip);
		
		commandMap.put("gcrIpAddress", ip);
		
		categoryAdminsService.insertCategoryRelationForm(commandMap.getMap());		

		String mm = "category";
		mv.addObject("mm", mm);

		return mv;
	}
	
	/*
	 * ========================================보기================================
	 * ========
	 */	
	
	@RequestMapping(value = "/admins/goods/categoryList.do")
	public ModelAndView selectListCategory(CommandMap commandMap,
			HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/Admins/Goods/GdsCaRelation");

			
		List<Map<String, Object>> selectListCategory = categoryAdminsService.selectListCategory(commandMap.getMap());		

		List<Map<String, Object>> selectCategoryGoodsList =  goodsAdminsService.selectCategoryGoodsList();
		
		mv.addObject("selectListCategory", selectListCategory);
		mv.addObject("selectCategoryGoodsList", selectCategoryGoodsList);
		String mm = "category";
		mv.addObject("mm", mm);

		return mv;
	}

	/*
	 * ========================================수정================================
	 * ========
	 */

}