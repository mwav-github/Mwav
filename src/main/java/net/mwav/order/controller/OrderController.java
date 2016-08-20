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


	@Resource(name = "orderService")
	private OrderService orderService;


	/* 
	 * 참고
	 * session.getId() 에서 session 은 HttpSession 객체입니다.
           개발자가 구현한 로그인,로그아웃 세션개념과 별개로 servlet 엔진에서 처리되는 것이지요.
            다시말해 사용자가 로그인을 하지 않더라도 일단  어떤 Servlet 엔진에서 제공되는 JSP를 최초로 호출함과 동시에 해당 브라우저에 유일한 세션이 생성되게 됩니다.
            사용자의 재호출이 없으면 브라우저가 열려있어도 timeout으로 HttpSession은 소멸되게 되고 그 후에 어떤 jsp나 서블릿이 호출되게 되면
            새로운 session이 생성되어 부여되는 셈이지요.
            따라서 session.getId() 값이 다르게 나오는것이 맞습니다.
            
            즉 위에서 회원이면 lID에는 로그인 아이디 비회원이면 sessio.id를 부여한다.
	 * */
	
	
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
		
		session.setAttribute("orderCart_id", lId);
		
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

	@RequestMapping(value = "/shop/order/orderList.do")
	public ModelAndView selectListBnsList(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/Shop/OrderProcess/OrderForm");

		HttpSession session = request.getSession();
		String orderCart_id = (String)session.getAttribute("orderCart_id");
		if(orderCart_id == null)
			orderCart_id = session.getId(); //임의로 
		
		
		System.out.println("orderCart_id"+orderCart_id);
		
        commandMap.put("orderCart_id", orderCart_id);
		
		String pageNum = (String) commandMap.get("pageNum");
		Paging paging = new Paging();
		if (pageNum == null) {
			pageNum = "1";
		}
		int totalRow = orderService.selectOneOrderTotalCount();
		System.out.println("totalRow=" + totalRow);

		// Paging pv = new Paging(pageNum, 10 , 10, totalCount);
		List<Map<String, Object>> selectListOrderCartList;
		PagingVO pagingVO = paging.setPagingInfo(totalRow, 5, pageNum); // 총 숫자,
																		// 한페이지에
																		// 노출 수
		commandMap.put("startRow", paging.getStartRow(pageNum)); // 시작 열
		commandMap.put("endRow", paging.getEndRow(pageNum)); // 끝 열
		
		//vo에 채우기 
		
		
		if (totalRow > 0) {
			selectListOrderCartList = orderService.selectListOrderCartList(commandMap
					.getMap());
			// selectboardList =
			// boardService.selectbnsList(commandMap.getMap());

		} else {
			selectListOrderCartList = Collections.emptyList();
		}
		

		mv.addObject("selectListOrderCartList", selectListOrderCartList);
		mv.addObject("pagingVO", pagingVO);
		mv.addObject("totalRow", totalRow);
		// mv.addObject("paging", pv.print());
		return mv;
	}
	/*
	 * ========================================삭제================================
	 * ========
	 */
	
	
	
	

	

}