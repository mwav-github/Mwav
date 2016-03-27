package net.admin.contrloller;

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
import org.springframework.web.servlet.ModelAndView;

import net.admin.service.CommonService;
import net.common.common.CommandMap;
import net.common.common.LeftFrame_Fucntion;
import net.common.common.LeftFrame_VO;
import net.mwav.common.module.Common_Util;
import net.mwav.common.module.Paging;
import net.mwav.common.module.PagingVO;

@Controller
public class CommonController {
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
	 * 1. bnsForm : mode = SbnsForm /CommonApps/BoardNews/bnsForm.jsp 2. bnsList
	 * : mode = SbnsList /CommonApps/BoardNews/bnsList.jsp 3. bnsView : mode =
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
	@RequestMapping(value = "/admins/Default.do")
	public ModelAndView adminDefault(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/Admins/AdminsMasterPage");

		// mode = "SbnsForm";
		// request.setAttribute("mode", mode);

		// mv.addObject("insertBnsForm", insertBnsForm);
		// mv.addObject("IDX", commandMap.get("IDX"));

		return mv;
	}

	@RequestMapping(value = "/admins/LeftMenu.do")
	public ModelAndView getLeftMenu(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/Admins/AdminsLeftMenu");

		/*
		 * 현재 전달 프로세스가 ! 
		 * 예)
		 *  
		 *  문제 제기 : get문이 아닌 header에다가 값 저장 후 left 구분값을 가져오고 싶다.
		 *           그러나 한페이지에서 두번의 비즈니스 로직을 호출하는 경우 세션이 아닌 이상 값 전달이 안된다. 
		 *  
		 * StaffList 인 경우 > StaffController > mm 지정 
		 * > staffList에서 left 메뉴 호출 
		 * 
		 * - 그러나 여기 한 페이지에서 /admins/stfList.do 와 /admins/LeftMenu.do 를 호출
		 * - 즉 저장된 mm값이 /admins/LeftMenu.do 로 넘어가지 않는다.
		 * - jstl 에서 param 이용 하여 전달한다. 
		 * - 비즈니스 로직에서 페이지 보여주는 경우 get문으로 mm값을 전달하지 않기 위하여 
		 * - 추후 권한 과도 연계
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

}