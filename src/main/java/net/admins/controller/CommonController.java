package net.admins.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.admins.service.CommonService;
import net.common.common.CommandMap;
import net.common.common.LeftFrame_Fucntion;
import net.common.common.LeftFrame_VO;
import net.mwav.common.module.Common_Utils;
import net.mwav.framework.FileLib;

import org.apache.commons.io.FileUtils;

@Controller
public class CommonController {
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
	@Resource(name = "CommonService")
	private CommonService CommonService;

	/* ======================Staff====================== */

	/*
	 * ========================================등록================================
	 * ========
	 */
	// 1번 StfForm : Form 입력만 가능 (뒤로가기, list)
	@RequestMapping(value = "/admins/Default.mwav")
	public ModelAndView adminDefault(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/Admins/AdminsIndex");

		// mode = "SbnsForm";
		// request.setAttribute("mode", mode);

		// mv.addObject("insertBnsForm", insertBnsForm);
		// mv.addObject("IDX", commandMap.get("IDX"));

		return mv;
	}

	@RequestMapping(value = "/admins/LeftMenu.mwav")
	public ModelAndView getLeftMenu(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/Admins/AdminsLeftMenu");

		/*
		 * 현재 전달 프로세스가 ! 예)
		 * 
		 * 문제 제기 : get문이 아닌 header에다가 값 저장 후 left 구분값을 가져오고 싶다. 그러나 한페이지에서 두번의 비즈니스 로직을
		 * 호출하는 경우 세션이 아닌 이상 값 전달이 안된다.
		 * 
		 * StaffList 인 경우 > StaffController > mm 지정 > staffList에서 left 메뉴 호출
		 * 
		 * - 그러나 여기 한 페이지에서 /admins/stfList.mwav 와 /admins/LeftMenu.mwav 를 호출 - 즉 저장된
		 * mm값이 /admins/LeftMenu.mwav 로 넘어가지 않는다. - jstl 에서 param 이용 하여 전달한다. - 비즈니스
		 * 로직에서 페이지 보여주는 경우 get문으로 mm값을 전달하지 않기 위하여 - 추후 권한 과도 연계
		 */

		/* Service 쪽 안간다. */
		String url = "";
		String mm = null;
		mm = request.getParameter("mm");

		if (mm != null) {

			System.out.println("mm이 controller 까지 = " + mm);
			List<LeftFrame_VO> vo = null;
			LeftFrame_Fucntion voF = new LeftFrame_Fucntion();
			System.out.println("mm=" + mm);

			vo = voF.getMbrList(mm);
			System.out.println("mm 나가기전" + vo);

			request.setAttribute("mm", mm);
			request.setAttribute("url", url);
			request.setAttribute("vo", vo);
		} else {
			System.out.println("이쪽으로 온다.");
			request.setAttribute("mm", null);
		}

		// mode = "SbnsForm";
		// request.setAttribute("mode", mode);

		// mv.addObject("insertBnsForm", insertBnsForm);
		// mv.addObject("IDX", commandMap.get("IDX"));

		return mv;
	}

	@RequestMapping(value = "/common/fileUpLoader.mwav")
	@ResponseBody
	public Map<String, Object> insertGdsUpLoader(CommandMap commandMap, HttpServletRequest request, HttpSession session)
			throws Exception {
		// ModelAndView mv = new ModelAndView("/Admins/Goods/GdsUpLoader");

		// http://stackoverflow.com/questions/19922358/how-to-upload-an-image-to-webapp-resources-images-directory-using-spring-mvc
		// 서버 루트로 파일저장
		// 그냥 하면 해당 c드라이브 루트로 잡는다. 서버루트가아닌

		String uploadRootPath = session.getServletContext().getRealPath("\\");
		// 실제 디플로이되는 폴더의 root path를 따온다
		// 이클립스 기본 폴더에서 변경하는방법

		// 설정안하면
		// D:\luna_company\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps
		// https://docs.google.com/document/d/1fYoWD_0-3sGxHjHNHKgGNLmONVTQ9DmaLwO-MSXVCHU/edit
		// 1.4.7

		System.out.println("uploadRootPath : " + uploadRootPath);
		/*
		 * int staff_id = 0; staff_id = (int) session.getAttribute("staff_id");
		 */ String goods_id = null;
		goods_id = (String) commandMap.get("goods_id");
		// staff_id 로그인 !! 후가 아닌 입력시 시점
		System.out.println("goods_id=" + goods_id);

		/*
		 * goods_id = String.valueOf(commandMap.get("goods_id"));
		 * System.out.println("goods_id =" + goods_id);
		 */

		// System.out.println("staff_id=" + staff_id);

		// commandMap.put("staff_id", staff_id);
		commandMap.put("uploadRootPath", uploadRootPath);

		Map<String, Object> insertGdsUpLoader = CommonService.insertGdsUpLoader(commandMap.getMap(), request);

		return insertGdsUpLoader;

	}

	/**
	 * @author 박정은
	 * @since
	 * @version 1.0
	 * @see
	 */
	@RequestMapping(value = "/PartsOfContent/SiteFooter/FrontFooter.mwav")
	public ModelAndView getFrontFooter(ModelAndView mv, HttpServletRequest request) throws Exception {
		mv.setViewName("/PartsOfContent/SiteFooter/FrontFooter");
		mv.addObject("generalConfig", CommonService.getFrontFooter(request, "footer"));
		return mv;
	}

	/**
		 * 메서드에 대한 설명
		 * <pre>
		 * {@code
		 * // 예제코드 작성
		 *  <a href="/common/downloadFile.mwav?parent=/CompanyItem/ITProducts/OfficeSuite&child=OfficeSuiteSetupFile.zip" 
		 *      target="_blank" onclick="ga('send', 'event', 'OfficeSuite', 'click', 'Install');">
		 * }
		 * </pre>
		 * @param parent : 다운로드 파일 경로 
	     * @param child  : 다운로드 파일명 (확장자 포함)
		 * @return return 값에 대한 설명(필수)
		 * @throws Exception 발생하는 예외에 대한 설명(필수) 
	 * @see 해당 메서드와 연관된 메서드 net.mwav.framework.FileLib
	 *      참조 URL : 
	 *      https://happy-hs.tistory.com/23
	 *      https://backback.tistory.com/226
	 *      https://fruitdev.tistory.com/169 (rootpath)
	 * @since 작성 버전
	 * @version 현재 버전
	*/
	@RequestMapping(value = "/common/downloadFile.mwav")
	public void downloadFile(CommandMap commandMap, HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws Exception {
		String parent = request.getParameter("parent"); //"/CompanyItem/ITProducts/OfficeSuite";
		String child =  request.getParameter("child"); //"OfficeSuiteSetupFile.zip";
		FileLib fileLib = FileLib.getInstance();

		//String uploadRootPath = session.getServletContext().getRealPath("\\");
		//System.out.println("root1"+uploadRootPath);
		String rootPath = request.getSession().getServletContext().getRealPath("/") ;
		//System.out.println("root2"+rootPath);
		parent = rootPath + parent + "/";
		//System.out.println("path="+parent+"-"+child);
		
		//byte fileByte[] = FileUtils.readFileToByteArray(new File("C:\\MwavDev\\Mwav(github)\\Mwav\\src\\main\\webapp\\CompanyItem\\ITProducts\\OfficeSuite\\" + child));
		byte fileByte[] = fileLib.dowonload(parent, child);
		//System.out.println("fileByte" + fileByte);
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition",
				"attachment; fileName=\"" + URLEncoder.encode(child, "UTF-8") + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}
}