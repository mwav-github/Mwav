package net.mwav.member.contrloller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.ByteArrayOutputStream;
import java.io.ObjectOutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.common.common.CommandMap;
import net.mwav.common.module.*;
import net.mwav.member.service.MemberService;

@Controller
// Anotation 으로 Conroller 호출
public class MemberController {
	Logger log = Logger.getLogger(this.getClass());
	String mode;
	HttpServletRequest request;

	@Autowired
	EmailSender emailSender;
	// HttpServletRequest request = null;
	// 자바에서 세션사용을 위해서는 아래와 같이 필요
	// HttpSession session = request.getSession();

	// - Controller > Service > ServiceImpl > DAO > SQL(XML) > JSP
	// 페이지별 세션지정
	/*
	 * 1. MbrLogin : mode = SMbrLogin /CommonApps/Member/MbrLogin.jsp 2.
	 * TermsOfUse : mode = STermsOfUse /CommonApps/Member/TermsOfUse.jsp 3.
	 * bnsView : mode = SbnsView /CommonApps/BoardNews/bnsView.jsp 4.
	 * FrontNewsList : mode = SFbnsList /CommonApps/BoardNews/FrontNewsList.jsp
	 * 5. bnsUpdate : mode = SbnsUpdate /CommonApps/BoardNews/bnsForm.jsp
	 */

	@Resource(name = "memberService")
	private MemberService memberService;

	// Anotation을 이용하여 사용할 Service Class 호출
	// Service단에서 memberService 로 정의된 Service항목을 자동 매핑 해준다.
	// 0번
	@RequestMapping(value = "/memberDefault.do")
	// ROOT/ /memberDefault.do 경로로 오는 URL은 모두 이 Controller에 매핑
	// RequestMapping을 이용한 URL mapping. / memberService 다음에 /memberDefault가 오면
	// 아래 메서드로 매핑된다.
	// 예) http://localhost/프로젝트명/ memberService /memberDefault
	// 또한 RequestMethod.POST 정의를 통해, POST방식으로 요청을 받게끔 정의한다. (GET 요청은 매핑 안시켜줌)
	public ModelAndView defaultMember(CommandMap commandMap,
			HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/MasterPage_1");

		log.isDebugEnabled();
		// log4js 확인 false 면 안되는거
		String mode = (String) request.getAttribute("mode");

		String spath = request.getServletPath();
		String url = request.getRequestURL().toString();
		System.out.println("디폴트로 접근시=" + url);
		// 필요에 따라서 사용
		String strCurrentUrl = request.getScheme() + "://"
				+ request.getServerName() + ":" + request.getServerPort()
				+ request.getContextPath();

		String getContextPath = request.getContextPath().toString();
		System.out.println("getContextPath=" + getContextPath);
		// 들어오는 url에 따라서 분기 실시 위의 url은 /* 형태로
		// prehandle 인터셉터로 처리하면 될듯 ~! 확인 요망
		if (mode != null) {
			if (mode == "SMbrLogin")
				;
			{

			}
		}

		return mv;
	}

	/*
	 * ========================================등록================================
	 * ========
	 */

	// 1번 mbrForm : Form 입력만 가능
	@RequestMapping(value = "/member/mbrForm.do")
	public ModelAndView insertMbrForm(CommandMap commandMap,
			HttpServletRequest request, HttpServletResponse response,
			String member_CellularP_1, String member_CellularP_2,
			String member_CellularP_3) throws Exception {

		ModelAndView mv = new ModelAndView("/MasterPage_1");
		// * action-servlet.xml에서 위에 .jsp 설정해줘서 위의 CommonApps 부터 되는거
		String b_mbrLoginPw = (String) commandMap.get("mbrLoginPw");
		System.out.println("b_mbrLoginPw" + b_mbrLoginPw);

		String mbrCellPhone = member_CellularP_1 + member_CellularP_2
				+ member_CellularP_3;
		commandMap.put("mbrCellPhone", mbrCellPhone);
		
		String mbrAddress_1 = (String) commandMap.get("mbrAddress_1");
		String mbrAddress_2 = (String) commandMap.get("mbrAddress_2");
		
		String mbrAddress = mbrAddress_1 + mbrAddress_2;
		System.out.println("mbrAddress="+mbrAddress);
		
		commandMap.put("mbrAddress", mbrAddress);
		memberService.insertMbrForm(commandMap.getMap());

		mv.addObject("mode", "SDMbrInput");
		// mv.addObject("IDX", commandMap.get("IDX"));
		return mv;
	}

	/*
	 * ========================================보기================================
	 * ========
	 */

	// 1번 MbrView : 수정/삭제가능
	@RequestMapping(value = "/member/mbrView.do")
	public ModelAndView selectMbrView(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		int member_id = (int) session.getAttribute("member_id");
		System.out.println("member_id=" + member_id);
		commandMap.put("member_id", member_id);
		ModelAndView mv = new ModelAndView("/CommonApps/Member/MbrView");
		Map<String, Object> selectMbrView = memberService
				.selectMbrView(commandMap.getMap());

		if (selectMbrView != null && !selectMbrView.isEmpty()) {
			System.out.println("view 줄랭");
			mv.addObject("mode", "SDMyPage");
			mv.addObject("selectMbrView", selectMbrView);
		}
		return mv;
	}

	/*
	 * ========================================수정================================
	 * ========
	 */
	@RequestMapping(value = "/member/mbrUpdate.do")
	public ModelAndView updateBnsform(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/CommonApps/Member/MbrShipForm");

		mode = "SmbrUpdate";
		request.setAttribute("mode", mode);

		// 위의 view랑 동일하게 사용

		Map<String, Object> updateMbrForm = memberService
				.updateMbrForm(commandMap.getMap());
		if (updateMbrForm != null && !updateMbrForm.isEmpty()) {
			System.out.println("view 줄랭");
			mv.addObject("mode", "SmbrUpdate");
			mv.addObject("updateMbrForm", updateMbrForm);
		}
		return mv;
	}

	@RequestMapping(value = "/member/mbrUpdatePro.do")
	public ModelAndView updateMbrformPro(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/CommonApps/Member/MbrShipForm");

		mode = "SmbrUpdatePro";
		request.setAttribute("mode", mode);

		// 위의 view랑 동일하게 사용

		memberService.updateMbrformPro(commandMap.getMap());

		return mv;
	}

	// 4번 추후 패스워드 찾기 순서 mbrTempLoginPwUpdate -> mbrTempLoginPwSeek ->
	// mbrLoginPwUpdate
	@RequestMapping(value = "/member/mbrLoginPwUpdate.do")
	public ModelAndView updateMbrLoginPw(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/MasterPage");

		// String cc = (String) commandMap.get("mbrLoginPw");
		String cc = (String) commandMap.get("imsi_mbrLoginPw");

		System.out.println("출력+" + cc);

		boolean updateMbrLoginPw = memberService.updateMbrLoginPw(commandMap
				.getMap());

		mv.addObject("updateMbrLoginPw", updateMbrLoginPw); // updatePw
		mv.addObject("mode", "SMbrLogin");
		return mv;
	}

	// 7번 추후 패스워드 찾기 1단계 맞으면 imsi 패스워드 넣으니
	@RequestMapping(value = "/member/mbrTempLoginPwUpdate.do")
	public @ResponseBody boolean updateMbrTempLoginPw(CommandMap commandMap,
			HttpServletRequest request) throws Exception {

		boolean updateMbrTempLoginPw = memberService
				.updateMbrTempLoginPw(commandMap.getMap());

		if (updateMbrTempLoginPw == true) {
			// 찾았다.
			emailSender.sendEmailAction(commandMap); // 메일발송
		} else {
			// 없다.

		}
		return updateMbrTempLoginPw;

	}

	/*
	 * ========================================리스트(SelectOne, SelectList
	 * 순)========================================
	 */
	// 1번 추후
	@RequestMapping(value = "/member/mbrLoginIdCheck.do")
	public void selectOneMbrLoginIdCheck(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String mbrLoginId = request.getParameter("mbrLoginId");

		boolean selectIdCheck = memberService
				.selectOneMbrLoginIdCheck(mbrLoginId);

		response.setContentType("text/html;charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		PrintWriter out = response.getWriter();
		// id 중복 처리

		String result = null;
		System.out.println("selectIdCheck" + selectIdCheck);
		if (selectIdCheck == true) {
			// 응답 메세지 1 : 이미 등록된 ID 입니다.
			result = "<font color=red><strong>이미 등록된 ID 입니다. 재 입력해주세요.</strong></font>";
		} else {
			// 응답 메세지 2 : 사용할 수 있는 ID 입니다.
			result = "<font color=green><strong>사용할 수 있는 ID 입니다.</strong></font>";
		}
		out.println(result);
		// response.getWriter().print(result); 주석풀면 3번 나온다.
		// response.getWriter().print(result);
	}

	// 2번 추후
	@RequestMapping(value = "/member/mbrLoginIdSeek.do")
	public void selectOneMbrLoginIdSeek(CommandMap commandMap,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		if (commandMap.isEmpty() == false) {
			System.out.println("들어옴");
			Iterator<Entry<String, Object>> iterator = commandMap.getMap()
					.entrySet().iterator();
			Entry<String, Object> entry = null;
			while (iterator.hasNext()) {
				entry = iterator.next();
				log.debug("key : " + entry.getKey() + ",\tvalue : "
						+ entry.getValue());
				System.out.println("key : " + entry.getKey() + ",\tvalue : "
						+ entry.getValue());
			}
		}

		String selectIdFinder = memberService
				.selectOneMbrLoginIdSeek(commandMap.getMap());

		response.setContentType("text/html;charset=UTF-8");

		response.setHeader("Cache-Control", "no-cache");
		PrintWriter out = response.getWriter();
		// id 중복 처리

		String result = null;
		System.out.println("selectIdFinder" + selectIdFinder);
		if (selectIdFinder == null) {
			// 응답 메세지 1 : 이미 등록된 ID 입니다.
			result = "<font color=red><strong>이미 등록된 ID 입니다.</strong></font>";
		} else {
			// 응답 메세지 2 : 사용할 수 있는 ID 입니다.
			result = "<font color=green><strong>당신의 아이디는 " + selectIdFinder
					+ "입니다.</strong></font>";
		}
		out.println(result);
		// response.getWriter().print(result); 주석풀면 3번 나온다.
		// response.getWriter().print(result);
	}

	// 7번 추후
	@RequestMapping(value = "/member/mbrTempLoginPwSeek.do")
	public @ResponseBody boolean selectOneMbrTempLoginPwSeek(
			CommandMap commandMap, HttpServletRequest request) throws Exception {

		boolean selectOneMbrTempLoginPwSeek = memberService
				.selectOneMbrTempLoginPwSeek(commandMap.getMap());

		return selectOneMbrTempLoginPwSeek;

	}

	/*
	 * ========================================삭제================================
	 * ========
	 */

	// 4번 추후
	@RequestMapping(value = "/member/mbrDelete.do")
	public ModelAndView deleteMbrDelete(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/Index");

		HttpSession session = request.getSession();
		int member_id = (int) session.getAttribute("member_id");
		String mbrLoginId = (String) session.getAttribute("mbrLoginId");
		System.out.println("member_id=" + member_id);
		System.out.println("mbrLoginId=" + mbrLoginId);
		commandMap.put("member_id", member_id);
		commandMap.put("mbrLoginId", mbrLoginId);
		boolean deleteMbrDelete = memberService.deleteMbrDelete(commandMap
				.getMap());

		mv.addObject("deleteMbrDelete", deleteMbrDelete);

		session.invalidate();

		return mv;
	}

	// 8번 추후
	@RequestMapping(value = "/PostSeek/zcGunGuSeek.do")
	public @ResponseBody List<String> selectListZcGunGuSeek(
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String zcSiDoName = request.getParameter("zcSiDoName");
		System.out.println("zcSiDoName" + zcSiDoName);
		List<String> selectListZcGunGuSeek = memberService
				.selectListZcGunGuSeek(zcSiDoName);

		return selectListZcGunGuSeek;
	}

	// consumes를 통해 POST방식으로 넘어온 요청에서 json 형태로 postData를 넘겨줌을 정의
	// 9번 추후
	@RequestMapping(value = "/PostSeek/zcAll.do")
	public @ResponseBody List<Map<String, Object>> selectListZcAll(
			CommandMap commandMap, HttpServletResponse response)
			throws Exception {

		// @RequestParam 어노테이션 : HTTP 요청 파라미터를 메서드의 파라미터로 전달받을 때 사용 그러나
		// commandMap에는 안되는듯 serial~ 부분이라
		// @ResponseBody 어노테이션을 이용하면 HTTP요청 몸체를 자바객체로전달받을수 있다.
		// @ResponseBody 어노테이션을 이요아면 자바객체를 HTTP응답 몸체로 전달 할 수 있다.

		// @ResponseBody : 해당 메서드의 Return 타입 설정. 여기서는 List<Map<String,Object>>
		// 형식으로 리턴해줌
		// 특정 DTO(VO) 형식으로 할 경우, 해당 타입으로 정의 (ex: @ResponseBody List<User>)
		// @RequestBody : 해당 메서드로 넘어오는 postData의 데이터 형태(json 구조) 선언
		// 만약 특정 DTO(VO)의 형태로 자동 매핑하여 받을 경우, 해당 타입으로 정의 (ex: @RequestBody User
		// user)

		System.out.println("들어옴");
		Iterator<Entry<String, Object>> iterator = commandMap.getMap()
				.entrySet().iterator();
		Entry<String, Object> entry = null;

		// String post_mode = (String) commandMap.get("post_mode");
		// System.out.println("post_mode_controller "+post_mode);

		while (iterator.hasNext()) {
			entry = iterator.next();
			log.debug("key : " + entry.getKey() + ",\tvalue : "
					+ entry.getValue());
			System.out.println("key : " + entry.getKey() + ",\tvalue : "
					+ entry.getValue());
		}

		List<Map<String, Object>> selectListZcAll = null;

		selectListZcAll = memberService.selectListZcAll(commandMap.getMap());

		System.out.println("selectListZcAll_1" + selectListZcAll);

		// Service에서 리턴된 값을 받는 부분. 주로 DB처리 후의 값을
		// Service단(jsonControllerService.selectDashboardList)에서 해줌
		// 특정 DTO(VO)로 받을 경우 해당 정의로 받아주면 됨
		// 예) List<User> uList = sampleService.selectList();
		// 조회 결과 return
		// return시에는 넘겨줄 json 구조로 데이터를 구성 한 후 리턴해준다.

		// @ResponseBody를 사용하고 해당 객체를 return해주기만 하면 ajax success함수의 data에
		// person객체가 Json객체로 변환 후 전송되어 파싱이 필요없습니다.
		for (int i = 0; i < selectListZcAll.size(); i++) {
			System.out.println("이름 : " + selectListZcAll.get(i));
			// System.out.println("주소 : " + selectpostList.get(i).get("시도명"));
		}
		// String postMode = "자료있음";
		// request.setAttribute("mode", postMode);
		// request.setAttribute("data", selectpostList);

		// 자바스크립트에서 [] 로 가니까 자바딴에서 list가 null 이면 null로 변환
		if (selectListZcAll.isEmpty()) {
			selectListZcAll = null;
			System.out.println("selectListZcAll_2" + selectListZcAll);
		}

		return selectListZcAll;
	}

	// 3번 추후 return 필요없을ㄷ스 고민
	@RequestMapping(value = "/member/LogOut.do")
	public ModelAndView logout(CommandMap commandMap, HttpServletRequest request)
			throws Exception {

		ModelAndView mv = new ModelAndView("/Index");
		// * action-servlet.xml에서 위에 .jsp 설정해줘서 위의 CommonApps 부터 되는거
		HttpSession session = request.getSession();
		session.invalidate();
		log.info("로그아웃");

		mode = "SDMbrLogout";
		request.setAttribute("mode", mode);

		return mv;
	}

	@RequestMapping(value = "/member/Login.do")
	public ModelAndView selectLogin(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/Index");

		HttpSession session = request.getSession();
		// * action-servlet.xml에서 위에 .jsp 설정해줘서 위의 CommonApps 부터 되는거

		System.out.println("여기는?");
		Map<String, Object> memberLogin = null;
		memberLogin = memberService.selectLogin(commandMap.getMap());

		int loginCheck = 0; // 초기값

		if (memberLogin != null && loginCheck != 5) {
			loginCheck = (int) memberLogin.get("logincheck");
			// 페이지에서 온 값
			System.out.println("loginCheck =" + loginCheck);
			String b_mbrLoginPw = null;
			b_mbrLoginPw = (String) commandMap.get("mbrLoginPw");
			System.out.println("페이지에서 온값 " + b_mbrLoginPw);

			// 디비 다녀와서 온 값
			String a_mbrLoginPw = (String) memberLogin.get("mbrLoginPw");
			System.out.println("디비다녀온값" + a_mbrLoginPw);

			String mbrLoginId = (String) memberLogin.get("mbrLoginId");
			int member_id = (int) memberLogin.get("member_id");

			if (loginCheck == 7) {
				loginCheck = 7;
				System.out.println("탈퇴한 회원입니다.");
			} else if (b_mbrLoginPw.equals(a_mbrLoginPw)) {
				// login 성공
				loginCheck = 1;
				session.setAttribute("mbrLoginId", mbrLoginId);
				session.setAttribute("member_id", member_id);
				System.out.println("로그인성공");
			} else if (mbrLoginId != null
					&& !(b_mbrLoginPw.equals(a_mbrLoginPw))) {
				// check 0 비밀번호가 틀렸을 때
				loginCheck = 2;
				System.out.println("비밀번호틀림");
			}
		} else if (memberLogin != null && loginCheck == 5) {
			loginCheck = 5; // 임시패스워드

		} else {
			loginCheck = 3;
			System.out.println("아이디 존재하지 않음.");
		}
		// Convert Map to byte array
		/*
		 * ByteArrayOutputStream byteOut = new ByteArrayOutputStream();
		 * ObjectOutputStream out = new ObjectOutputStream(byteOut);
		 * out.writeObject(memberLogin.get("mbrLoginPw"));
		 */

		// http://linuxism.tistory.com/1089

		mv.addObject("memberLogin", memberLogin);
		request.setAttribute("loginCheck", loginCheck);
		return mv;

	}

	/*
	 * // 7번 추후
	 * 
	 * @RequestMapping(value = "/member/PWFinder.do") public ModelAndView
	 * updatePW(CommandMap commandMap, HttpServletRequest request) throws
	 * Exception {
	 * 
	 * ModelAndView mv = new ModelAndView("/CompanyItem/CompanyItemMasterPage");
	 * 
	 * boolean selectPWFinder = memberService.selectPWFinder(commandMap
	 * .getMap());
	 * 
	 * mv.addObject("selectPWFinder", selectPWFinder);
	 * 
	 * if (selectPWFinder == true) { // 찾았다.
	 * femailSender.sendEmailAction(commandMap); // 메일발송 } else { // 없다.
	 * 
	 * } return mv;
	 * 
	 * }
	 */

	// 스프링 JSON 예제
	@RequestMapping(value = "/Post/GunguFinder1.do")
	public @ResponseBody Map<String, Object> getJsonByMap() {
		Map<String, Object> jsonObject = new HashMap<String, Object>();
		Map<String, Object> jsonSubObject = null;
		ArrayList<Map<String, Object>> jsonList = new ArrayList<Map<String, Object>>();

		// 1번째 데이터
		jsonSubObject = new HashMap<String, Object>();
		jsonSubObject.put("idx", 1);
		jsonSubObject.put("title", "제목입니다");
		jsonSubObject.put("create_date", new Date());
		jsonList.add(jsonSubObject);
		// 2번째 데이터
		jsonSubObject = new HashMap<String, Object>();
		jsonSubObject.put("idx", 2);
		jsonSubObject.put("title", "두번째제목입니다");
		jsonSubObject.put("create_date", new Date());
		jsonList.add(jsonSubObject);

		jsonObject.put("success", true);
		jsonObject.put("total_count", 10);
		jsonObject.put("result_list", jsonList);

		return jsonObject;
	}
}
