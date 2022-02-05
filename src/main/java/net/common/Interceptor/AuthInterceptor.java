package net.common.Interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import net.admins.vo.Staff_VO;
import net.mwav.member.vo.Member_tbl_VO;

/**
 * 권한 확인 후 인증되지 않은 사용자를 로그인 창으로 redirect
 * @author 김주성
 *
 */
public class AuthInterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);

	private List<String> urls;

	public void setUrls(List<String> urls) {
		this.urls = urls;
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		HttpSession session = request.getSession();
		Member_tbl_VO member = (Member_tbl_VO) session.getAttribute("member");
		Staff_VO staff = (Staff_VO) session.getAttribute("staff");
		String uri = request.getRequestURI();
		String url = uri.substring(0, Math.min(7, uri.length()));
		String staffId = null;
		String memberId = null;

		if (member != null) {
			memberId = String.valueOf(member.getMember_id());
		}

		if (staff != null) {
			staffId = String.valueOf(staff.getStaff_id());
		}

		logger.debug("====================================== START ======================================");
		logger.debug("uri : " + uri);
		logger.debug("staffId : " + staffId);
		logger.debug("memberId : " + memberId);
		logger.debug("====================================== END ======================================");

		if (uri.equals("/Admins/CompanyMgr/Staff/StfLogin.mwav")) {
			return true;
		}

		boolean isAdmin = "/Admins".equals(url) || "/admins".equals(url) || "/admin/".equals(url);

		// 관리자 uri 접근 및 미인증된 경우
		if (isAdmin && "null".equals(staffId)) {
			response.sendRedirect("/Admins/CompanyMgr/Staff/StfLogin.mwav");
			return false;
		}

		// 관리자 uri 접근 및 인증된 경우
		if (isAdmin && !"null".equals(staffId)) {
			response.sendRedirect("/admins/Default.mwav");
			return false;
		}

		// 특정 url에 접근하는 경우 및 미인증된 경우
		if (urls.contains(url) && "null".equals(memberId)) {
			response.sendRedirect("/MasterPage.mwav?mode=SMbrLogin&returnUrl=" + uri);
			return false;
		}

		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

	}

}