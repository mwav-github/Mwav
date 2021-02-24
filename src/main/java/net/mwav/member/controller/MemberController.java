package net.mwav.member.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.common.common.CommandMap;
import net.common.common.Status;
import net.mwav.common.module.Common_Utils;
import net.mwav.common.module.EmailSender;
import net.mwav.common.module.VerifyRecaptcha;
import net.mwav.login.service.LoginService;
import net.mwav.login.vo.LoginVO;
import net.mwav.member.service.MemberService;
import net.mwav.member.vo.Member_tbl_VO;

/**
 * 프로세스 1) 비밀번호 찾기 : mbrTempLoginPwUpdate -> mbrTempLoginPwSeek -> //
 */
@Controller
public class MemberController {

	Logger log = Logger.getLogger(this.getClass());
	String mode;
	HttpServletRequest request;

	@Autowired
	EmailSender emailSender;

	@Autowired
	Member_tbl_VO member_tbl_VO;
	
	@Autowired
	LoginVO loginVO;

	@Resource(name = "memberService")
	private MemberService memberService;
	
	@Resource(name = "loginService")
	private LoginService loginService;

	Common_Utils cu = new Common_Utils();

	/*
	 * 1. MbrLogin : mode = SMbrLogin /CommonApps/Member/MbrLogin.jsp 2.
	 * TermsOfUse : mode = STermsOfUse /CommonApps/Member/TermsOfUse.jsp 3.
	 * bnsView : mode = SbnsView /CommonApps/BoardNews/bnsView.jsp 4.
	 * FrontNewsList : mode = SFbnsList /CommonApps/BoardNews/FrontNewsList.jsp
	 * 5. bnsUpdate : mode = SbnsUpdate /CommonApps/BoardNews/bnsForm.jsp
	 */

	@RequestMapping(value = "/login.mwav", method = RequestMethod.GET)
	public String login(Model model) {

		return "redirect:/MasterPage.mwav?mode=SMbrLogin";
	}

	/**
	 * @date 2016.04.27
	 * @author Kim YJ
	 * @param commandMap
	 * @param request
	 * @param session
	 *            - 해당 컨트롤러 사용여부, 파라미터 사용여부 체크 확인 필요
	 */

	@RequestMapping(value = "/memberDefault.mwav")
	public ModelAndView defaultMember(CommandMap commandMap, HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/MasterPage_1");

		// String mode = (String) request.getAttribute("mode");

		/*
		 * String spath = request.getServletPath(); String url =
		 * request.getRequestURL().toString(); String strCurrentUrl =
		 * request.getScheme() + "://" + request.getServerName() + ":" +
		 * request.getServerPort() + request.getContextPath();
		 * 
		 * String getContextPath = request.getContextPath().toString(); // 들어오는
		 * url에 따라서 분기 실시 위의 url은 /* 형태로 // prehandle 인터셉터로 처리하면 될듯 ~! 확인 요망 if
		 * (mode != null) { if (mode == "SMbrLogin") ; {
		 * 
		 * } }
		 */

		return mv;
	}

	/**
	 * @date 2016.04.27
	 * @author Kim YJ
	 * @param b_mbrLoginPw - js에서 pw값을 수정후 보내면 이에 대한 확인부분이 미흡하다
	 * @param mbrCellPhone - 각각의 값이 문자, 조합, 불필요한 칸 나눔이 포함되어 있다
	 * @param mbrAddress   - 기능 사용 안됨(API를 만들어서 주소를 호출해야됨! 중요!!), 로직 불합리
	 * @throws Exception - Exception 발생시 무엇에 대한 에러인지 처리 미흡, 에러 페이지로 redirect??
	 * @see 컨트롤러 부분과 서비스로직 분리
	 */
	@RequestMapping(value = "/member/mbrForm.mwav")
	public String insertMbrForm(CommandMap commandMap, Model model) throws Exception {

		Map<String, Object> result = memberService.insertMbrForm(commandMap.getMap());
		if (result.get("result").toString().equals("1") || result.get("result").toString().equals("91"))
			return "redirect:/MasterPage_1.mwav?mode=SDMbrInput";
		return "redirect:/MasterPage_1.mwav?mode=SMbrInput";
	}

	/*
	 * ========================================보기================================
	 * ========
	 */

	// 2번 MbrView : 수정/삭제가능 (view만사용.)
	@RequestMapping(value = "/member/mbrView.mwav")
	public ModelAndView selectMbrView(CommandMap commandMap, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();

		Member_tbl_VO Member = (Member_tbl_VO) session.getAttribute("member");
		commandMap.put("member_id", Member.getMember_id());
		ModelAndView mv = new ModelAndView("/CommonApps/Member/MbrView");
		Map<String, Object> selectMbrView = memberService.selectMbrView(commandMap.getMap());

		if (selectMbrView != null && !selectMbrView.isEmpty()) {
			System.out.println("view 줄랭");
			mv.addObject("mode", "SDMyPage");
			mv.addObject("selectMbrView", selectMbrView);
			mv.addObject("breadcrumb", "MemberShip");
			// mv.addObject("page_header", "IT Trends");
			mv.addObject("page_header", null);
		}
		return mv;
	}
	
	@RequestMapping(value = "/login/pwUpdateLater.mwav")
	@ResponseBody
	public int pwUpdateLater(CommandMap commandMap, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();

		Member_tbl_VO Member = (Member_tbl_VO) session.getAttribute("member");
		commandMap.put("member_id", Member.getMember_id());
		
		int updateYN = loginService.pwUpdateLater(Member);
		
		System.out.println("updateYN: " + updateYN);
		
		return updateYN;
	}

	/*
	 * ========================================수정================================
	 * ========
	 */

	/*
	 * board 와 같이 하나의 form 에 등록 수정을 같이 사용하면, update 할때 최초 select 후 update 즉
	 * update> updatePro 가 필요없다 그러나 아래와 같이 하려면, 별도 controller을 해줘야하며 어짜피 쿼리는
	 * 동일하므로 view 이용하면된다. ~! 즉 controller에서만 작업 후 이후 꺼는 view 이용
	 */
	@RequestMapping(value = "/member/mbrUpdate.mwav")
	public ModelAndView updateMbrform(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/CustomerService/CS-MasterPage");

		mode = "SmbrUpdate";

		HttpSession session = request.getSession();
		Member_tbl_VO Member = (Member_tbl_VO) session.getAttribute("member");
		commandMap.put("member_id", Member.getMember_id());
		// 위의 view랑 동일하게 사용

		Map<String, Object> updateMbrForm = memberService.updateMbrForm(commandMap.getMap());
		if (updateMbrForm != null && !updateMbrForm.isEmpty()) {
			System.out.println("view 줄랭");
			System.out.println("mode 출력" + mode);
			mv.addObject("mode", mode);
			mv.addObject("updateMbrForm", updateMbrForm);
		}
		return mv;
	}

	@RequestMapping(value = "/member/mbrUpdatePro.mwav")
	public ModelAndView updateProMbrform(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/CustomerService/CS-MasterPage");

		mode = "SDMyPage";
		// mv.addObject("mode", "SDMyPage");
		// request.setAttribute("mode", "SDMyPage");
		mv.addObject("mode", "SmbrUpdatePro");

		// 위의 view랑 동일하게 사용
		HttpSession session = request.getSession();
		Member_tbl_VO Member = (Member_tbl_VO) session.getAttribute("member");
		commandMap.put("member_id", Member.getMember_id());

		String mbrAddress = null;

		String mbrAddress_1 = null;
		mbrAddress_1 = (String) commandMap.get("mbrAddress_1");
		System.out.println("mbrAddress_1=" + mbrAddress_1);

		String mbrAddress_2 = null;
		mbrAddress_2 = (String) commandMap.get("mbrAddress_2");

		if (mbrAddress_1 == null && mbrAddress_2 == null) {
			commandMap.put("mbrAddress", null);
			System.out.println("null이당");

		} else {
			mbrAddress = mbrAddress_1 + mbrAddress_2;
			commandMap.put("mbrAddress", mbrAddress);
			System.out.println("mbrAddress=" + mbrAddress);

		}

		memberService.updateProMbrform(commandMap.getMap());

		return mv;
	}

	// 4번 추후 패스워드 찾기 순서 mbrTempLoginPwUpdate -> mbrTempLoginPwSeek ->
	// mbrLoginPwUpdate
	@RequestMapping(value = "/member/mbrLoginPwUpdate.mwav")
	public @ResponseBody boolean updateMbrLoginPwTmp(CommandMap commandMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
		// ModelAndView mv = new ModelAndView("/MasterPage");

		// String cc = (String) commandMap.get("mbrLoginPw");

		// 임시패스워드
		String cc = (String) commandMap.get("imsi_mbrLoginPw");

		// 변경예정비밀번호
		String cc2 = (String) commandMap.get("mbrLoginPw");

		System.out.println("출력+" + cc);

		boolean updateMbrLoginPw = memberService.updateMbrLoginPwTmp(commandMap.getMap());

		// mv.addObject("updateMbrLoginPw", updateMbrLoginPw); // updatePw
		// mv.addObject("mode", "SMbrLogin");
		return updateMbrLoginPw;
	}
	
	/**
	 * @author 박정은
	 * @param commandMap
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/login/mbrLoginPwUpdate.mwav")
	public @ResponseBody Status updateMbrLoginPw(Member_tbl_VO member_tbl_VO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 변경예정비밀번호
		return loginService.updateMbrLoginPw(request, member_tbl_VO);
		//return updateMbrLoginPw;
	}

	// 7번 추후 패스워드 찾기 1단계 맞으면 imsi 패스워드 넣으니
	/*
	 * 변경 내역 16.02.17 updateMbrTempLoginPw 시 기 mbrLoginPw는 null 로 변경해야 할 필요성 느끼고
	 * 변경 처리 만약 중간에 창을 닫고 로그인 시도하면 안되므로~!
	 */
	@RequestMapping(value = "/member/mbrTempLoginPwUpdate.mwav")
	public @ResponseBody String updateMbrTempLoginPw(CommandMap commandMap, HttpServletRequest request, HttpServletResponse response) throws Exception {

		boolean updateMbrTempLoginPw;

		System.out.println(commandMap.get("mbrLoginId"));
		System.out.println(commandMap.get("mbrEmail"));

		String mbrLoginPw = memberService.selectOneMbrLoginPWSeek(commandMap.getMap());

		/*
		 * response.setContentType("text/html;charset=UTF-8");
		 * 
		 * response.setHeader("Cache-Control", "no-cache"); PrintWriter out =
		 * response.getWriter();
		 */
		// id 중복 처리

		String result = null;
		System.out.println("mbrLoginPw= " + mbrLoginPw);
		if (mbrLoginPw == null) {
			// 정보가 없는 경우.
			result = "false";
		} else {
			// commandMap.put("mbrLoginPw", mbrLoginPw);
			updateMbrTempLoginPw = memberService.updateMbrTempLoginPw(commandMap.getMap());

			if (updateMbrTempLoginPw == true) {
				// 찾았다.
				emailSender.sendEmailAction(commandMap); // 메일발송
				result = (String) commandMap.get("mbrEmail");
			} else {
				// 없다.

			}
		}
		// out.println(result);

		return result;

	}

	/*
	 * ========================================리스트(SelectOne, SelectList순)========================================
	 */
	// 1번 추후
	@RequestMapping(value = "/member/mbrLoginIdCheck.mwav")
	@ResponseBody
	public boolean selectOneMbrLoginIdCheck(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String mbrLoginId = request.getParameter("mbrLoginId");
		return memberService.selectOneMbrLoginIdCheck(mbrLoginId);
	}

	// 2번 추후
	@RequestMapping(value = "/member/mbrLoginIdSeek.mwav")
	public void selectOneMbrLoginIdSeek(CommandMap commandMap, HttpServletRequest request, HttpServletResponse response) throws Exception {

		// commandmAP 출력 모듈
		cu.selectCommandMapList(commandMap);

		List<String> selectIdFinder = memberService.selectOneMbrLoginIdSeek(commandMap.getMap());

		response.setContentType("text/html;charset=UTF-8");

		response.setHeader("Cache-Control", "no-cache");
		PrintWriter out = response.getWriter();
		// id 중복 처리

		String result = null;
		System.out.println("selectIdFinder" + selectIdFinder);

		List<String> convertTxt = cu.convertStringToMark(selectIdFinder);
		System.out.println("convertTxt.size()" + convertTxt.size());
		if (convertTxt.size() == 0) {
			// 응답 메세지 1 : 이미 등록된 ID 입니다.
			// result =
			// "<font color=red><strong>존재하지 않는 ID 입니다.</strong>	</font>";
			result = "<div class='alert alert-danger text-center'><strong>존재하지 않는 ID 입니다.</strong></div>";
		} else {
			// 응답 메세지 2 : 사용할 수 있는 ID 입니다.

			// 값이 여러개인 경우

			if (convertTxt.size() >= 2) {

				result = "<div class='alert alert-success text-center'><strong>당신의 아이디는 아래 중 하나입니다.</strong><br>";
				for (int i = 0; i < convertTxt.size(); i++) {
					result = result + "<br><strong>" + convertTxt.get(i) + "</strong><br>";
				}
				result = result + "</div>";
			} else {
				result = "<div class='alert alert-success text-center'><strong>당신의 아이디는 " + convertTxt.get(0) + " 입니다.</strong></div>";
			}
		}
		out.println(result);
		// response.getWriter().print(result); 주석풀면 3번 나온다.
		// response.getWriter().print(result);
	}

	// 7번 추후
	@RequestMapping(value = "/member/mbrTempLoginPwSeek.mwav")
	public @ResponseBody boolean selectOneMbrTempLoginPwSeek(CommandMap commandMap, HttpServletRequest request) throws Exception {

		boolean selectOneMbrTempLoginPwSeek = memberService.selectOneMbrTempLoginPwSeek(commandMap.getMap());

		return selectOneMbrTempLoginPwSeek;

	}

	/*
	 * ========================================삭제================================
	 * ========
	 */

	// 4번 추후
	@RequestMapping(value = "/member/mbrDelete.mwav")
	public ModelAndView deleteMbrDelete(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/Index");

		HttpSession session = request.getSession();

		Member_tbl_VO Member = (Member_tbl_VO) session.getAttribute("member");
		commandMap.put("member_id", Member.getMember_id());
		commandMap.put("mbrLoginId", Member.getMbrLoginId());
		// String mbrLoginId = (String) session.getAttribute("mbrLoginId");
		// System.out.println("member_id=" + member_id);
		// System.out.println("mbrLoginId=" + mbrLoginId);
		// commandMap.put("member_id", member_id);
		// commandMap.put("mbrLoginId", mbrLoginId);
		boolean deleteMbrDelete = memberService.deleteMbrDelete(commandMap.getMap());

		mv.addObject("deleteMbrDelete", deleteMbrDelete);
		mv.addObject("breadcrumb", "MemberShip");
		// mv.addObject("page_header", "IT Trends");
		mv.addObject("page_header", null);
		session.invalidate();

		return mv;
	}

	// 8번 추후
	@RequestMapping(value = "/PostSeek/zcGunGuSeek.mwav")
	public @ResponseBody List<String> selectListZcGunGuSeek(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String zcSiDoName = request.getParameter("zcSiDoName");
		System.out.println("zcSiDoName" + zcSiDoName);

		List<String> selectListZcGunGuSeek = memberService.selectListZcGunGuSeek(zcSiDoName);

		return selectListZcGunGuSeek;
	}

	// consumes를 통해 POST방식으로 넘어온 요청에서 json 형태로 postData를 넘겨줌을 정의
	// 9번 추후
	@RequestMapping(value = "/PostSeek/zcAll.mwav")
	public @ResponseBody List<Map<String, Object>> selectListZcAll(CommandMap commandMap, HttpServletResponse response) throws Exception {

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
		Iterator<Entry<String, Object>> iterator = commandMap.getMap().entrySet().iterator();
		Entry<String, Object> entry = null;

		// String post_mode = (String) commandMap.get("post_mode");
		// System.out.println("post_mode_controller "+post_mode);

		while (iterator.hasNext()) {
			entry = iterator.next();
			log.debug("key : " + entry.getKey() + ",\tvalue : " + entry.getValue());
			System.out.println("key : " + entry.getKey() + ",\tvalue : " + entry.getValue());
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
	@RequestMapping(value = "/member/LogOut.mwav")
	public ModelAndView logout(HttpServletRequest request, HttpSession session, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView("/Index");
		Object obj = session.getAttribute("member");
		if (obj != null) {
			memberService.updateAutoLoginDel(request, session, response);
			session.removeAttribute("member");
			session.invalidate();
			log.info("세선제거 성공");
		} else {
			log.info("세션에 로그인 정보다 없어 로그아웃 하지 못하였습니다.");
		}

		mode = "SDMbrLogout";
		request.setAttribute("mode", mode);

		return mv;
	}

	// 로그인 폼 보여주고 리스트로 돌아감
	@RequestMapping(value = "/login/post")
	public String loginForm(HttpServletRequest request) {

		return "forward:" + request.getContextPath() + "/Index.mwav";
	}

	/*
	 * logincheck = 1 : 정상로그인 logincheck = 2 : 비밀번호 틀림 logincheck = 3 : 아이디 존재하지
	 * 않음 logincheck = 5 : DB 조회시 NULL (임시패스워드 발급 단계에서 중간하였을때 포함) logincheck = 6
	 * : 탈퇴하지 않음 logincheck = 7 : 탈퇴
	 */

	@RequestMapping(value = "/member/Login.mwav")
	public ModelAndView selectLogin(CommandMap commandMap, HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		// * action-servlet.xml에서 위에 .jsp 설정해줘서 위의 CommonApps 부터 되는거

		System.out.println("여기는?");
		Map<String, Object> memberLogin = null;
		memberLogin = memberService.selectLogin(commandMap.getMap());
		System.out.println("여기는  멤버로그인 찍기전");
		if (memberLogin != null)
			member_tbl_VO = new Member_tbl_VO((int) memberLogin.get("member_id"), (String) memberLogin.get("mbrLoginId"), (String) memberLogin.get("mbrLoginPw"), (String) memberLogin.get("mbrTempLoginPw"), (String) memberLogin.get("mbrFirstName"), (String) memberLogin.get("mbrMiddleName"),
					(String) memberLogin.get("mbrLastName"), (String) memberLogin.get("mbrEmail"), (String) memberLogin.get("mbrCellPhone"), (Boolean) memberLogin.get("mbrAddrFlag"), (String) memberLogin.get("mbrZipcode"), (String) memberLogin.get("mbrAddress"));
		System.out.println("여기는  return URL 찍기전");
		String returnUrl = null;
		String returnUrl_imsi = null;
		returnUrl_imsi = (String) commandMap.get("returnUrl");
		System.out.println("returnUrl_imsi" + returnUrl_imsi);
		if (returnUrl_imsi == null || returnUrl_imsi == "") {
			returnUrl = null;
		} else {
			returnUrl = returnUrl_imsi;
		}

		int loginCheck = 0; // 초기값
		int updatePW = 0;
		
		loginVO.setAlEntityType('M');
		loginVO.setAlEntityTarget_id(member_tbl_VO.getMember_id());

		// g-recaptcha-response POST parameter when the user submits the form on
		// your site
		// recaptcha-token 과는 별개이다.
		String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
		System.out.println("gRecaptchaResponse" + gRecaptchaResponse);
		boolean valid;
		// Verify CAPTCHA.
		valid = VerifyRecaptcha.verify(gRecaptchaResponse);
		if (!valid) {
			// RECAPTCHA 오류 (false)
			loginCheck = 6;
		}

		System.out.println("returnUrl" + returnUrl);

		// 암호화 복호화 할 필요는없지.
		if (memberLogin != null && loginCheck != 5) {
			loginCheck = (int) memberLogin.get("loginCheck");
			// 페이지에서 온 값
			System.out.println("loginCheck =" + loginCheck);
			String b_mbrLoginPw = null;
			b_mbrLoginPw = (String) commandMap.get("mbrLoginPw");
            System.out.println("페이지에서 온값 " + b_mbrLoginPw);
			
			// 디비 다녀와서 온 값
			String a_mbrLoginPw = (String) memberLogin.get("mbrLoginPw");
			System.out.println("디비다녀온값" + a_mbrLoginPw);

			String mbrLoginId = (String) memberLogin.get("mbrLoginId");

			if (loginCheck == 7) {
				loginCheck = 7;
				System.out.println("탈퇴한 회원입니다.");
			} else if (b_mbrLoginPw.equals(a_mbrLoginPw)) {
				// login 성공
				loginCheck = 1;
				// 세션 지정.
				session.setAttribute("member", member_tbl_VO);

				boolean isAutoLoginChk = true;
				isAutoLoginChk = cu.isEmpty(commandMap.get("autoLoginChk"));
				if (isAutoLoginChk == false && commandMap.get("autoLoginChk").equals("on")) {
					log.info("자동로그인시도");
					memberService.updateAutoLogin((String) commandMap.get("autoLoginChk"), response, member_tbl_VO.getMember_id());
				}
				
				loginService.deleteAuditLogin(loginVO);
				updatePW = loginService.getUpdatePwYN(member_tbl_VO);
				
				System.out.println("로그인성공");
			} else if (mbrLoginId != null && !(b_mbrLoginPw.equals(a_mbrLoginPw))) {
				// check 0 비밀번호가 틀렸을 때
				loginCheck = 2;
				System.out.println("비밀번호틀림");
				// 박정은
				LoginVO vo = new LoginVO();
				vo = loginService.getLoginFailCount(loginVO);
				
				loginVO.setAlFailCount(vo.getAlFailCount());
				loginVO.setAuditLogin_id(vo.getAuditLogin_id());
				loginVO.setAlIpAddress(cu.getClientIP(request));
				loginService.mergeAuditLogin(loginVO);
				
				if(vo.getAlFailCount() >= 5) {
					ModelAndView mv = new ModelAndView("/MasterPage");
					mv.addObject("memberLogin", memberLogin);
					mv.addObject("mode", "PWFail");
					request.setAttribute("returnUrl", returnUrl);
					request.setAttribute("loginCheck", loginCheck);
					return mv;
				}
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
		ModelAndView mv = new ModelAndView("/MasterPage");
		mv.addObject("memberLogin", memberLogin);
		mv.addObject("mode", "SMbrLogin");
		request.setAttribute("returnUrl", returnUrl);
		request.setAttribute("loginCheck", loginCheck);
		request.setAttribute("updatePW", updatePW);
		return mv;

	}

	/*
	 * // 7번 추후
	 * 
	 * @RequestMapping(value = "/member/PWFinder.mwav") public ModelAndView
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
	@RequestMapping(value = "/Post/GunguFinder1.mwav")
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

	@RequestMapping(value = "/member/snsForm.mwav")
	public ModelAndView insertSnsForm(CommandMap commandMap, HttpServletRequest request, HttpServletResponse response) throws Exception {

		// signController 로 진행
		ModelAndView mv = new ModelAndView("/Index");

		HttpSession session = request.getSession();
		int loginCheck = 0;

		String smMember_id = (String) commandMap.get("fsmMember_id");
		String First_Name = (String) commandMap.get("fFirst_Name");
		String Last_Name = (String) commandMap.get("fLast_Name");
		if (Last_Name == null)
			Last_Name = null;
		String Email = (String) commandMap.get("fEmail");
		String Gender = (String) commandMap.get("fGender");
		if (Gender == null)
			Gender = null;
		String Link = (String) commandMap.get("fLink");
		if (Link == null)
			Link = null;
		String Picture = (String) commandMap.get("fPicture");
		if (Picture == null)
			Picture = null;

		System.out.println("smMember_id = " + smMember_id);
		System.out.println("First_Name = " + First_Name);
		System.out.println("Last_Name = " + Last_Name);
		System.out.println("Email = " + Email);
		System.out.println("Gender = " + Gender);
		System.out.println("Link = " + Link);
		System.out.println("Picture = " + Picture);

		/* ID가 없으면 (Insert), 있으면 (로그인) */
		boolean check;
		check = memberService.selectOneSnsMbrLoginIdCheck(smMember_id);
		System.out.println("check = " + check);

		if (check == false) { // 신규등록

			if (Gender.equals("male")) {
				commandMap.put("Gender", 1);
			} else {
				commandMap.put("Gender", 0);
			}
			// snsMember_tbl - MAX(snsMember_id) + 1
			commandMap.put("snsMember_id", memberService.selectNextSnsPk());

			memberService.insertSnsForm(commandMap.getMap());
		} else {
			// 기존 있는 경우
		}

		// 추후 변경 예정
		String mbrLoginId = Last_Name + " " + First_Name;
		loginCheck = 1;
		member_tbl_VO.setMbrLoginId(mbrLoginId);
		member_tbl_VO.setMember_id((int) commandMap.get("member_id"));

		// System.out.println("타입검사"+member_tbl_VO);

		session.setAttribute("member", member_tbl_VO);
		request.setAttribute("loginCheck", loginCheck);

		return mv;
	}
}
