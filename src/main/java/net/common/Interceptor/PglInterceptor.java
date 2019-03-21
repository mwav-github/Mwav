package net.common.Interceptor;

import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import net.mwav.common.module.StateManageLib;
import net.promoter.service.PromoterService;
import net.promoter.vo.Promoter_VO;


public class PglInterceptor  extends HandlerInterceptorAdapter{

	@Autowired
	PromoterService promoterService;

	protected Log log = LogFactory.getLog(StatisticsInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		String pglValue =request.getParameter("pgl");
		
		//queryString에 pgl paramater이 없거나 값이 없다면 pglInterceptor에서 빠져나옴 
		if(pglValue == null || pglValue.equals(""))
			return true;
	
		// pgl값이 있을 경우 세션과 쿠키에 저장하고 푸터에 표시함 
		// 세션과 쿠키에는 방문자수는 1회만 저장하면 된다.
		if(request.getSession().getAttribute("pmtPK")!=pglValue ){  
			try {
				getPgl(request, response, pglValue);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} log.info("리퀘스트 밸루:"+  request.getRequestURI() );

		return true;
	}

	@Override
	public void postHandle(
			HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView)
			throws Exception {
	}

	private Boolean getPgl(HttpServletRequest request,HttpServletResponse response,String pglValue) throws Exception{
		
		//쿠키와 세션에 pgl값 등록하고  promoterValue_tble의 VisitNbr 수늘려 줌
		StateManageLib stateManageLib = StateManageLib.getInstance();
		Cookie pmtPK = stateManageLib.createCookie("pgl", pglValue, "/", 60 * 60 * 24 * 14); //쿠키 생성

	    Promoter_VO pgl = promoterService.selectOnePmtInfo(pglValue);
	    
	    if(pgl!=null){
	    	response.addCookie(pmtPK); //쿠키에 pgp 등록등록
	    	request.getSession().setAttribute("pmtName", pgl.getPmtName());
	    	request.getSession().setAttribute("pmtNick", pgl.getPmtNickName());
	    	request.getSession().setAttribute("pmtPK",pgl.getPromoter_id());
	    	
	    	if(promoterService.updatePmtVisitNbr(pglValue)==1)
	    		log.info("VisitNbr업데이트 성공");
	    	else  
	    		log.info("VisitNbr업데이트 실패");

	    } else{
	    	log.info(pglValue + " > 해당 pgl값의  프로모터를 찾지 못했습니다 시간:" +new Date());
	    }

	    return true;

	}
}



