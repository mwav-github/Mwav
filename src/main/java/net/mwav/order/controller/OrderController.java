package net.mwav.order.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.mwav.order.vo.OrderCartVO;
import net.common.common.CommandMap;
import net.mwav.order.service.OrderService;
import net.mwav.common.module.Common_Utils;
import net.mwav.common.module.Paging;
import net.mwav.common.module.PagingVO;

@Controller
public class OrderController {
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
	@Resource(name = "orderService")
	private OrderService orderService;

	// ///////////////////////////////////BoardNews/////////////////////////////////////

	/*
	 * ========================================등록================================
	 * ========
	 * 
	 * 
	
	 */
	// 1번 bnsForm : Form 입력만 가능 (뒤로가기, list)
	@RequestMapping(value = "/shop/order/orderForm.do", params="type=frontCart")
	//@RequestMapping(value = "/shop/order/orderForm.do")
	//http://egloos.zum.com/nadostar/v/210497
	
	//vo 사용 http://annotations.tistory.com/61
	
	public @ResponseBody OrderCartVO insertBnsForm(CommandMap commandMap,
			HttpServletRequest request) throws Exception {

		//ModelAndView mv = new ModelAndView("/Company/CompanyMasterPage_1");

		System.out.println("순서");
		log.debug("인터셉터 테스트");


		// mv.addObject("insertBnsForm", insertBnsForm);
		// mv.addObject("IDX", commandMap.get("IDX"));

		
		HttpSession session = request.getSession();
		String lId = (String)session.getAttribute("member_id");
		if(lId == null)
			lId = session.getId(); //임의로 
		
		System.out.println("비회원 세션 id "+ lId);

		int goods_id = Integer.parseInt(request.getParameter("goods_id"));
		System.out.println("OrderCartPutAction goods_id="+goods_id);
		
		System.out.println("OrderCartPutAction ocAmount="+request.getParameter("ocAmount"));
		System.out.println("OrderCartPutAction gcr_id="+request.getParameter("gcr_id"));
		System.out.println("OrderCartPutAction type="+request.getParameter("type"));
		
		Common_Utils cu = new Common_Utils();
		
		
		OrderCartVO vo = new OrderCartVO(
				lId,
				new Timestamp(System.currentTimeMillis()),
				Integer.parseInt(request.getParameter("goods_id")),
				Integer.parseInt(request.getParameter("ocAmount")),
				Integer.parseInt(request.getParameter("gcr_id")),
				cu.getClientIP(request)
				);
		/*ArrayList<OrderCartVO> list = new ArrayList<OrderCartVO>();
		list.add(vo)*/
		
		boolean flag = orderService.insertOrderForm(vo);
		
		
	
		request.setAttribute("flag", flag); 
		request.setAttribute("goods_id", goods_id);
		// 재고가 없을 경우 장바구니에 담겨지지 않게 체크하기 위함, 재고는 후에 구현
		
		
		return vo;
	}

	/*
	 * ========================================보기================================
	 * ========
	 */


	/*
	 * ========================================수정================================
	 * ========
	 */
	

	/*
	 * ========================================리스트(SelectOne, SelectList
	 * 순)========================================
	 */

	/*
	 * ========================================삭제================================
	 * ========
	 */
	
	
	
	

	

}