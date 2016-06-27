package net.admins.contrloller;

import java.io.File;
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

import net.admins.service.GoodsAdminsService;
import net.common.common.CommandMap;
import net.mwav.common.module.Common_Utils;
import net.mwav.common.module.FileUtils;
import net.mwav.common.module.ImageUtill;
import net.mwav.common.module.Paging;
import net.mwav.common.module.PagingVO;

@Controller
public class GoodsAdminsController {
	Logger log = Logger.getLogger(this.getClass());
	// HttpServletRequest request = null;
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
	@Resource(name = "goodsAdminsService")
	private GoodsAdminsService goodsAdminsService;

	@Resource(name = "fileUtils")
	private FileUtils fileUtils;

	/* ======================Staff====================== */

	/*
	 * ========================================등록================================
	 * ========
	 */
	// 1번 StfForm : Form 입력만 가능 (뒤로가기, list)
	@RequestMapping(value = "/admins/goods/gdsForm.do")
	public ModelAndView insertGdsForm(CommandMap commandMap,
			HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/Admins/Goods/GdsCellList");

		Map<String, Object> map = goodsAdminsService.insertGdsForm(commandMap
				.getMap());

		// 이미지 전체 등록 goods_id 전달해줘야 한다. 고민
		// FileUtils fileutill = new FileUtils(); 이렇게 빈등록안하고 사용하면 null 값 오류 뜬다.
		String uploadRootPath = session.getServletContext().getRealPath("\\");
		System.out.println("루트경로" + uploadRootPath);

		map.put("uploadRootPath", uploadRootPath);

		fileUtils.totalFileProcess(map);

		String mm = "cGds";
		mv.addObject("mm", mm);
		mv.addObject("mode", "m_gdsForm");

		return mv;
	}

	/*
	 * ========================================수정================================
	 * ========
	 */

	// 1번 bnsView : 수정/삭제가능
	@RequestMapping(value = "/admins/goods/gdsView.do")
	public ModelAndView selectOneGdsView(CommandMap commandMap,
			HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/Admins/Goods/GdsCellView");

		log.debug("인터셉터 테스트");
		System.out.println("테스트");
		Map<String, Object> selectOneGdsView = goodsAdminsService
				.selectOneGdsView(commandMap.getMap());

		List<Map<String, Object>> selectListGdsList = goodsAdminsService
				.selectListGdsList(commandMap.getMap());

		if (selectOneGdsView != null && !selectOneGdsView.isEmpty()) {
			System.out.println("view 줄랭");

			String mm = "cGds";
			mv.addObject("mm", mm);

			mv.addObject("selectOneGdsView", selectOneGdsView);
			mv.addObject("selectListGdsList", selectListGdsList);
		}

		return mv;
	}

	/*
	 * ========================================수정================================
	 * ========
	 */

	// 1번 bnsUpdate : 리스트 업데이트
	@RequestMapping(value = "/admin/goods/gdsUpdate.do")
	public ModelAndView updateGdsForm(CommandMap commandMap,
			HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/Admins/Goods/GdsCellForm");

		// 위의 view랑 동일하게 사용

		Map<String, Object> updateGdsForm = goodsAdminsService
				.updateGdsForm(commandMap.getMap());
		if (updateGdsForm != null && !updateGdsForm.isEmpty()) {
			System.out.println("view 줄랭");
			String mm = "cGds";

			mv.addObject("mm", mm);

			String goods_id = String.valueOf(updateGdsForm.get("goods_id"));

			String uploadRootPath = session.getServletContext().getRealPath(
					"\\");
			System.out.println("루트경로" + uploadRootPath);

			// 파일 루트 경로 표현시 / 이 아닌, \\ 로 표기해야한다.
			String path = uploadRootPath + "\\xUpload\\GdsData\\GC" + goods_id
					+ "\\";
			// String path = "\\xUpload\\GdsData\\GC"+goods_id+"\\";
			System.out.println("경로 ==" + path);

			mv.addObject("updateGdsForm", updateGdsForm);

			/*
			 * http://www.tutorialspoint.com/java/util/arrays_aslist.htm >
			 * aslist란
			 * 
			 * http://seemoon.tistory.com/entry/JAVA-Array-%EB%B3%B5%EC%82%AC >
			 * aslist 출력방법
			 * 
			 * 중요 아래와 같이 출력하면 경로가 아래와 같이 잡힌다.
			 * file:///F:/Mwav/dev/git/mwav/mwav/src
			 * /main/webapp/xUpload/GdsData/
			 * GC10045/m_S1_20160522133939_Basic.png 문제는 ! > 이럴 경우 html 상 value
			 * 에는 서버 /로읽어온다 즉 차이가 발생한다.
			 */

			try {
				List<Map<String, Object>> fileList = fileUtils
						.getDirFileList(path);

				//String filePosition = null;
				// List<Map<String, Object>> fileList =
				// fileUtils.getDirFileList(path);

				System.out.println("fileList" + fileList);

				System.out.println("fileList 사이즈 : " + fileList.size());
				for (int i = 0; i < fileList.size(); i++) {
					Map<String, Object> excelMap = fileList.get(i);
					System.out.println("=============" + excelMap.get("fileName"));
					System.out.println("=============" + excelMap.get("fileNameExcept"));
					System.out.println("=============" + excelMap.get("fileSize"));
					System.out.println("=============" + excelMap.get("fileDate"));
					System.out.println("=============" + excelMap.get("filePosition"));
				}

				

				mv.addObject("goodsFileList", fileList);
			} catch (Exception e) {
				e.printStackTrace();
			}

			/*
			 * 예외 처리 필수 파일 없으면 null 이니까 좀더 상세 http://jungws55.tistory.com/227
			 * 
			 * File filepath = new File( path );
			 * 
			 * File[] fileList = filepath.listFiles();
			 * 
			 * for(int i=0; i < fileList.length; i++){
			 * System.out.println(fileList[i]) ; }
			 */

		}
		return mv;
	}

	// 1번 bnsUpdate : 리스트 업데이트
	@RequestMapping(value = "/admin/goods/gdsUpdatePro.do")
	public ModelAndView updateProGdsForm(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/Admins/Goods/GdsCellList");

		// 위의 view랑 동일하게 사용

		goodsAdminsService.updateProGdsForm(commandMap.getMap());

		String mm = "cGds";
		mv.addObject("mm", mm);

		return mv;
	}

	@RequestMapping(value = "/admins/goods/gdsList.do")
	public ModelAndView selectListGdsList(CommandMap commandMap,
			HttpServletRequest request, HttpServletResponse reponse,
			HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/Admins/Goods/GdsCellList");

		String pageNum = (String) commandMap.get("pageNum");
		Paging paging = new Paging();
		if (pageNum == null) {
			pageNum = "1";
		}
		System.out.println("pageNum=" + pageNum);
		int totalRow = goodsAdminsService.selectOneGetGdsTotalCount();
		System.out.println("totalRow=" + totalRow);

		// Paging pv = new Paging(pageNum, 10 , 10, totalCount);
		List<Map<String, Object>> selectListGdsList;
		PagingVO pagingVO = paging.setPagingInfo(totalRow, 5, pageNum); // 총 숫자,
																		// 한페이지에
																		// 노출 수
		commandMap.put("startRow", paging.getStartRow(pageNum)); // 시작 열
		commandMap.put("endRow", paging.getEndRow(pageNum)); // 끝 열
		if (totalRow > 0) {
			System.out.println("전체행의 갯수 1이상");
			selectListGdsList = goodsAdminsService.selectListGdsList(commandMap
					.getMap());
			// selectboardList =
			// boardService.selectbnsList(commandMap.getMap());

		} else {
			selectListGdsList = Collections.emptyList();
		}
		System.out.println("찍히낭");

		mv.addObject("selectListGdsList", selectListGdsList);
		mv.addObject("pagingVO", pagingVO);
		mv.addObject("totalRow", totalRow);

		String mm = "cGds";
		mv.addObject("mm", mm);
		mv.addObject("mode", "m_stfList");

		// mv.addObject("paging", pv.print());

		return mv;
	}
	
	@RequestMapping(value = "/admins/goods/gdsDelete.do")
	public ModelAndView deleteGdsDelete(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/Admins/Goods/GdsCellForm");

		goodsAdminsService.deleteGdsDelete(commandMap.getMap());

		return mv;
	}

}