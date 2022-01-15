
package net.mwav.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.maven.model.Model;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.social.ExpiredAuthorizationException;
import org.springframework.social.connect.Connection;
import org.springframework.social.connect.ConnectionFactoryLocator;
import org.springframework.social.connect.UsersConnectionRepository;
import org.springframework.social.connect.web.ProviderSignInUtils;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.facebook.api.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.model.OAuth2AccessToken;

import net.mwav.member.auth.naver.NaverUrlBuilder;
import net.mwav.member.service.MemberService;
import net.mwav.member.service.SignService;
import net.mwav.member.vo.Member_tbl_VO;

@Controller
public class SignController {

	private static final Logger logger = LoggerFactory.getLogger(SignController.class);

	private final ProviderSignInUtils providerSignInUtils;

	private Facebook facebook;

	@Inject
	Member_tbl_VO member_tbl_VO;

	@Inject
	private MemberService memberService;

	@Inject
	NaverUrlBuilder naverUrlBuilder;

	@Inject
	SignService signService;

	@Inject
	public SignController(ConnectionFactoryLocator connectionFactoryLocator, UsersConnectionRepository connectionRepository) {
		this.providerSignInUtils = new ProviderSignInUtils(connectionFactoryLocator, connectionRepository);
	}

	@RequestMapping(value = "/signin", method = { RequestMethod.GET, RequestMethod.POST })
	public void signin() {
		System.out.println("출력3");
	}

	@RequestMapping("/google/expired")
	public void simulateExpiredToken() { // 만료된 토큰 관리
		throw new ExpiredAuthorizationException("google");
	}

	@RequestMapping(value = "/signup.mwav", method = { RequestMethod.GET, RequestMethod.POST })
	public String signupForm2(WebRequest req, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Connection<?> connection = providerSignInUtils.getConnectionFromSession(req);

		int loginCheck = 0;
		Map<String, Object> map = new HashMap<String, Object>();
		HttpSession session = request.getSession();

		String social = connection.getKey().getProviderId();
		String smMember_id = null;
		String First_Name = null;
		String Last_Name = null;
		String Email = null;
		String Gender = null;
		String Link = null;
		String Picture = null;

		if (social.equals("facebook")) {
			facebook = (Facebook) connection.getApi();
			String[] fields = { "id", "email", "first_name", "last_name", "gender", "birthday", "link" };
			/*
			 * System.out.println("이건뭘까" + facebook.userOperations().getUserProfile());
			 */
			User user = facebook.fetchObject("me", User.class, fields);

			// (#12) bio field is deprecated for versions v2.8 and higher
			// fetchUserProfile
			smMember_id = connection.getKey().getProviderUserId();
			First_Name = user.getFirstName();
			Last_Name = user.getLastName();
			Email = user.getEmail();
			Gender = user.getGender();
			Link = user.getLink();
		} else {

			smMember_id = connection.getKey().getProviderUserId();
			First_Name = connection.fetchUserProfile().getFirstName();
			Last_Name = connection.fetchUserProfile().getLastName();
			Email = connection.fetchUserProfile().getEmail();
			if (Last_Name == null) {
				Last_Name = null;
			}
			Gender = null;
			Link = connection.getProfileUrl();
			if (Link == null) {
				Link = null;
			}
			Picture = connection.getImageUrl();
			if (Picture == null) {
				Picture = null;
			}
		}
		logger.debug("smMember_id = " + smMember_id);
		logger.debug("First_Name = " + First_Name);
		logger.debug("Last_Name = " + Last_Name);
		logger.debug("Email = " + Email);
		logger.debug("Gender = " + Gender);
		logger.debug("Link = " + Link);
		logger.debug("Picture = " + Picture);

		/*
		 * ID가 없으면 (Insert), 있으면 (로그인)
		 */
		System.out.println("smMember_id" + smMember_id);
		boolean check;
		int member_id = 0;
		String m_id = null;
		check = memberService.selectOneSnsMbrLoginIdCheck(smMember_id);

		logger.info("check = " + check);
		if (check == false) { // 기존에 등록 아이디가 존재하지 않는 경우

			m_id = memberService.selectOneMemberPkCheck();
			member_id = Integer.parseInt(m_id);
			System.out.println("멤버아이디=" + member_id);
			// 메번로그인할때마다 생성하면 애매하니까

			if (First_Name == null) {
				First_Name = "sns_temp";
			}

			if (Last_Name == null) {
				Last_Name = "sns_temp";
			}
			if (Email == null) {
				Email = "sns_temp@temp.com";
			}
			map.put("member_id", member_id);

			// 로그인한 SNS의 값이 동일하므로 난수 발생으로 대응 필요하며, 순서대로 채번 필요.
			map.put("mbrLoginId", social + "_temp");
			// 현재는 SNS 패스워드의 모든 값이 동일하다.
			map.put("mbrLoginPw", "sns_temp1@");
			map.put("mbrTempLoginPw", null);
			map.put("mbrFirstName", First_Name);
			map.put("mbrLastName", Last_Name);
			map.put("mbrMiddleName", null);
			map.put("mbrEmail", Email);
			map.put("mbrCellPhone", "01000000000");
			map.put("mbrAddrFlag", 0);
			map.put("mbrZipcode", "");
			map.put("mbrAddress", null);

			// 회원가입.
			memberService.insertMbrForm(map);

			map.put("smMember_id", smMember_id);
			map.put("First_Name", First_Name);
			map.put("Last_Name", Last_Name);
			map.put("Email", Email);
			map.put("Gender", 3);
			map.put("Link", Link);
			map.put("Picture", Picture);
			map.put("member_id", member_id);
			// sns가입 (*당연히 회원가입이되어야 이게 가능 순서가 당연하지 이게 저기를 외래키로 가리키는데)
			memberService.insertSnsForm(map);
			member_tbl_VO.setMember_id(member_id);
			session.setAttribute("member", member_tbl_VO);
			if (request.getSession().getAttribute("autoLoginChk") != null) {
				memberService.updateAutoLogin((String) request.getSession().getAttribute("autoLoginChk"), response, member_tbl_VO.getMember_id());
				request.getSession().removeAttribute("autoLoginChk");
			}
			logger.info("insertSnsForm success!!!!!!");
		} else {
			// 업데이트 해야하는 요소가 있다면 사실해줘야 한다.
			// 기존 등록된 내용이 있는 경우
			// member_id를 기준으로 불러온다.
			// String m_id = memberService.selectOneMemberPkCheck();
			try {
				m_id = memberService.selectOneSmMemberPkCheck(smMember_id);
				member_id = Integer.parseInt(m_id);
			} catch (NullPointerException e) {
				e.printStackTrace();
			}

			member_tbl_VO.setMember_id(member_id);
			session.setAttribute("member", member_tbl_VO);
			System.out.println("자동로그인값" + request.getSession().getAttribute("autoLoginChk"));
			if (request.getSession().getAttribute("autoLoginChk") != null) {
				memberService.updateAutoLogin((String) request.getSession().getAttribute("autoLoginChk"), response, member_tbl_VO.getMember_id());
				request.getSession().removeAttribute("autoLoginChk");
			}
		}

		// System.out.println("mbrLoginId___" + mbrLoginId);

		loginCheck = 1;
		// session.setAttribute("member_id", member_id);
		request.setAttribute("loginCheck", loginCheck);
		request.getSession().setAttribute("loginCheck", null);
		return "/Index";
	}

	/**
	 * 
	 * @method name : naverCallBack
	 * @author : (정) 남동희 (부)
	 * @since : 2019. 7. 13.
	 * @version : v1.1
	 * @see :
	 * @description : 네이버 로그인 후 CALLBACK 처리
	 * @history : ---------------------------------------- Modification
	 *          Information(개정이력) ---------------------------------------- 수정일 수정자
	 *          수정내용 -------- -------- ---------------- 2019.7. 13. 남동희 최초 생성
	 * @param : String code - 네이버 로그인 서버에서 return하는 token 발급용 code<br>
	 *          String state - 네이버 로그인 서버로 send 했던 state(난수), session의 state와 비교 검증할
	 *          때 사용
	 * @return : 메인화면으로 Forward
	 * @throws :
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/naver/signin.mwav")
	public String naverCallBack(@RequestParam String code, @RequestParam String state, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
			OAuth2AccessToken token = naverUrlBuilder.getAccessToken(session, code, state);

			Map<String, Object> userInfo = new ObjectMapper().readValue(naverUrlBuilder.getUserProfile(token), Map.class);

			if ("00".equals(userInfo.get("resultcode"))) {
				Map<String, Object> result = signService.signService((Map<String, Object>) userInfo.get("response"));

				switch (result.get("result").toString()) {
				// 로그인, 신규 가입이 성공한 경우
				case "1":
				case "11":
					// mail exception
				case "91":
					// 왜 굳이 INT형을?
					member_tbl_VO.setMember_id(Integer.parseInt(result.get("memberId").toString()));
					session.setAttribute("member", member_tbl_VO);
					if (request.getSession().getAttribute("autoLoginChk") != null) {
						memberService.updateAutoLogin((String) request.getSession().getAttribute("autoLoginChk"), response, member_tbl_VO.getMember_id());
						request.getSession().removeAttribute("autoLoginChk");
					}
					break;

				// 로그인, 신규 가입 시 에러가 발생한 경우
				default:
					break;
				}
			}

			// 뭔 짓거리를 한 건지 모르지만 일단 남겨둠
			request.setAttribute("loginCheck", 1);
			request.getSession().setAttribute("loginCheck", null);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return "/Index";
	}
}
