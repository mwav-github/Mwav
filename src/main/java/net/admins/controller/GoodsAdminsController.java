package net.admins.controller;

import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import net.admins.service.GoodsAdminsService;
import net.common.common.CommandMap;
import net.mwav.common.module.Common_Utils;
import net.mwav.common.module.Constants;
import net.mwav.common.module.FileLib;
import net.mwav.common.module.FileUtils;
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
	 * 1. bnsForm : mode = SbnsForm /CommonApps/BoardNews/bnsForm.jsp 2. bnsList :
	 * mode = SbnsList /CommonApps/BoardNews/bnsList.jsp 3. bnsView : mode =
	 * SbnsView /CommonApps/BoardNews/bnsView.jsp 4. FrontNewsList : mode =
	 * SFbnsList /CommonApps/BoardNews/FrontNewsList.jsp 5. bnsUpdate : mode =
	 * SbnsUpdate /CommonApps/BoardNews/bnsForm.jsp
	 */
	@Resource(name = "goodsAdminsService")
	private GoodsAdminsService goodsAdminsService;

	@Resource(name = "fileUtils")
	private FileUtils fileUtils;

	@Resource(name = "constants")
	private Constants c;

	/**
	 * @method name : insertGdsForm
	 * @author : (정) 정재현
	 * @since : 2020. 1. 4.
	 * @version : v1.0
	 * @see : #method
	 * @description : staff 상품등록,
	 *              http://localhost:8080/Admins/Goods/GoodsRegForm.mwav?mm=cGds에서
	 *              '상품등록'버튼을 누를시 동작
	 * @history : ---------------------------------------- Modification
	 *          Information(개정이력) ---------------------------------------- 수정일 수정자
	 *          수정내용 -------- -------- ---------------- 2020. 1. 4. 정재현
	 * @param :
	 * @return :
	 * @throws :
	 */
	@RequestMapping(value = "/admins/goods/goodsRegist.mwav")
	public boolean insertGdsForm(CommandMap commandMap, HttpServletRequest request, HttpSession session)
			throws Exception {
		// ModelAndView mv = new ModelAndView("/Admins/Goods/GdsCellList");

		// 상품DB등록
		Map<String, Object> map = goodsAdminsService.insertGdsForm(commandMap.getMap());

		// 임시파일을 이용해서 이미지 저장
		goodsAdminsService.saveImage(map.get("goods_id").toString());

		return true;
	}

	@RequestMapping(value = "/admins/goods/goodsUpdate.mwav")
	public boolean goodsUpdate(CommandMap commandMap, HttpServletRequest request) throws Exception {
		goodsAdminsService.updateProGdsForm(commandMap.getMap());
		goodsAdminsService.saveImage(commandMap.getMap().get("goods_id").toString());
		return true;
	}	

	@RequestMapping(value = "/admins/goods/goodsList.mwav")
	public ModelAndView selectListGdsList(CommandMap commandMap, HttpServletRequest request,
			HttpServletResponse reponse, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/Admins/Goods/GoodsList");

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
			selectListGdsList = goodsAdminsService.selectListGdsList(commandMap.getMap());
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

	@RequestMapping(value = "/admins/goods/goodsView.mwav")
	public ModelAndView selectOneGdsView(CommandMap commandMap, HttpServletRequest request, HttpSession session)
			throws Exception {
		ModelAndView mv = new ModelAndView("/Admins/Goods/GoodsView");
		Map<String, Object> selectOneGdsView = goodsAdminsService.selectOneGdsView(commandMap.getMap());

		List<Map<String, Object>> selectListGdsList = goodsAdminsService.selectListGdsList(commandMap.getMap());

		if (selectOneGdsView != null && !selectOneGdsView.isEmpty()) {
			String mm = "cGds";
			mv.addObject("mm", mm);

			mv.addObject("selectOneGdsView", selectOneGdsView);
			mv.addObject("selectListGdsList", selectListGdsList);
		}

		List<Map<String, Object>> goodsFiles = goodsAdminsService.selectListGdsFilesList(commandMap.getMap());
		mv.addObject("goodsFiles", goodsFiles);
		return mv;
	}

	@RequestMapping(value = "/admin/goods/gdsUpdate.mwav")
	public ModelAndView updateGdsForm(CommandMap commandMap, HttpServletRequest request, HttpSession session)
			throws Exception {
		ModelAndView mv = new ModelAndView("/Admins/Goods/GoodsRegForm");

		Map<String, Object> updateGdsForm = goodsAdminsService.updateGdsForm(commandMap.getMap());
		if (updateGdsForm != null && !updateGdsForm.isEmpty()) {
			String mm = "cGds";

			mv.addObject("mm", mm);

			String goods_id = String.valueOf(updateGdsForm.get("goods_id"));

			String uploadRootPath = session.getServletContext().getRealPath("\\");
			System.out.println("루트경로" + uploadRootPath);

			// 파일 루트 경로 표현시 / 이 아닌, \\ 로 표기해야한다.
			String path = uploadRootPath + "\\xUpload\\GdsData\\GC" + goods_id + "\\";
			mv.addObject("updateGdsForm", updateGdsForm);
			mv.addObject("isM", true);

			/*
			 * http://www.tutorialspoint.com/java/util/arrays_aslist.htm > aslist란
			 * 
			 * http://seemoon.tistory.com/entry/JAVA-Array-%EB%B3%B5%EC%82%AC > aslist 출력방법
			 * 
			 * 중요 아래와 같이 출력하면 경로가 아래와 같이 잡힌다. file:///F:/Mwav/dev/git/mwav/mwav/src
			 * /main/webapp/xUpload/GdsData/ GC10045/m_S1_20160522133939_Basic.png 문제는 ! >
			 * 이럴 경우 html 상 value 에는 서버 /로읽어온다 즉 차이가 발생한다.
			 */

			try {
				List<Map<String, Object>> fileList = fileUtils.getDirFileList(path);

				// String filePosition = null;
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
			 * for(int i=0; i < fileList.length; i++){ System.out.println(fileList[i]) ; }
			 */

		}
		return mv;
	}

	@RequestMapping(value = "/admin/goods/goodsUpdateForm.mwav")
	public ModelAndView updateGoodsForm(CommandMap commandMap, HttpServletRequest request, HttpSession session)
			throws Exception {
		ModelAndView mv = new ModelAndView("/Admins/Goods/GoodsRegForm");

		Map<String, Object> updateGdsForm = goodsAdminsService.updateGdsForm(commandMap.getMap());
		if (updateGdsForm != null && !updateGdsForm.isEmpty()) {
			String mm = "cGds";
			mv.addObject("mm", mm);
			mv.addObject("updateGdsForm", updateGdsForm);
			mv.addObject("isM", true);
		}

		// 파일(이미지)
		List<Map<String, Object>> goodsFiles = goodsAdminsService.selectListGdsFilesList(commandMap.getMap());
		mv.addObject("goodsFiles", goodsFiles);

		return mv;
	}

	@RequestMapping(value = "/admins/goods/gdsDelete.mwav")
	public ModelAndView deleteGdsDelete(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/Admins/Goods/GdsCellForm");

		goodsAdminsService.deleteGdsDelete(commandMap.getMap());

		return mv;
	}

	/*
	 * 
	 */
	@RequestMapping(value = "/admins/goods/tmpUpload.mwav", method = RequestMethod.POST)
	@ResponseBody
	public boolean tempUpload(MultipartHttpServletRequest multipartRequest) throws Exception {
		// String filePath = "/xUpload/GoodsData/TempImages";
		FileLib fileLib = FileLib.getInstance();
		String imgLocation = multipartRequest.getParameter("imgLocation");

		Iterator<String> iterator = multipartRequest.getFileNames();
		while (iterator.hasNext()) {
			MultipartFile multipartFile = multipartRequest.getFile(iterator.next());
			String originalFileName = multipartFile.getOriginalFilename();

			String extension = FilenameUtils.getExtension(originalFileName);
			String tempFilename = goodsAdminsService.mkTempImgFileName(imgLocation);
			String tempFileFullname = tempFilename + c.dot + extension;

			if (goodsAdminsService.deletePreTempFile(tempFilename))
				System.out.println("goodsAdminsService.deletePreTempFile success");

			byte[] contents = multipartFile.getBytes();
			fileLib.upload(contents, c.goods.tmpImgFilePath, tempFileFullname);
		}

		return true;
	}
}