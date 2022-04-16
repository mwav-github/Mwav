package net.common.Interceptor;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import net.bizlogin.promoter.manage.dao.ManageDao;
import net.mwav.common.module.StateManageLib;

public class PglInterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = LoggerFactory.getLogger(PglInterceptor.class);

	@Inject
	private ManageDao manageDao;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String pglValue = request.getParameter("pgl");

		//queryString에 pgl paramater이 없거나 값이 없다면 pglInterceptor에서 빠져나옴 
		if (pglValue == null || pglValue.equals(""))
			return true;

		// pgl값이 있을 경우 세션과 쿠키에 저장하고 푸터에 표시함
		// 세션과 쿠키에는 방문자수는 1회만 저장하면 된다.
		if (request.getSession().getAttribute("pmtPK") != pglValue) {
			try {
				getPgl(request, response, pglValue);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		logger.debug("리퀘스트 밸루:" + request.getRequestURI());

		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}

	private Boolean getPgl(HttpServletRequest request, HttpServletResponse response, String pglValue) throws Exception {

		//쿠키와 세션에 pgl값 등록하고  promoterValue_tble의 VisitNbr 수늘려 줌
		Cookie pmtPK = StateManageLib.createCookie("pgl", pglValue, "/", 60 * 60 * 24 * 14); //쿠키 생성

		Map<String, Object> param = new HashMap<String, Object>();
		param.put("promoter_id", pglValue);
		Map<String, Object> promoter = manageDao.getPromoter(param);

		if (promoter != null) {
			response.addCookie(pmtPK); //쿠키에 pgp 등록등록
			request.getSession().setAttribute("pmtName", promoter.get("pmtFirstName"));
			request.getSession().setAttribute("pmtNick", promoter.get("pmtNickName"));
			request.getSession().setAttribute("pmtPK", promoter.get("promoter_id"));

			if (manageDao.increaseVisitCount(param) == 1) {
				logger.debug("VisitNbr업데이트 성공");
			} else {
				logger.debug("VisitNbr업데이트 실패");
			}

		} else {
			logger.debug(pglValue + " > 해당 pgl값의  프로모터를 찾지 못했습니다 시간:" + new Date());
		}
		return true;
	}
}
