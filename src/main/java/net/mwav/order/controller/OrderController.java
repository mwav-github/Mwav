package net.mwav.order.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Vector;
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

import net.mwav.member.service.MemberService;
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

	//회원정보 부분도 이용하는 부분이 있어서 호출 
	@Resource(name = "memberService")
	private MemberService memberService;
	
	
	/*
	 * 참고 session.getId() 에서 session 은 HttpSession 객체입니다. 개발자가 구현한 로그인,로그아웃
	 * 세션개념과 별개로 servlet 엔진에서 처리되는 것이지요. 다시말해 사용자가 로그인을 하지 않더라도 일단 어떤 Servlet
	 * 엔진에서 제공되는 JSP를 최초로 호출함과 동시에 해당 브라우저에 유일한 세션이 생성되게 됩니다. 사용자의 재호출이 없으면
	 * 브라우저가 열려있어도 timeout으로 HttpSession은 소멸되게 되고 그 후에 어떤 jsp나 서블릿이 호출되게 되면 새로운
	 * session이 생성되어 부여되는 셈이지요. 따라서 session.getId() 값이 다르게 나오는것이 맞습니다.
	 * 
	 * 즉 위에서 회원이면 lID에는 로그인 아이디 비회원이면 sessio.id를 부여한다.
	 */

	/*
	 * ========================================등록================================
	 * ========
	 */
	// 1번 bnsForm : Form 입력만 가능 (뒤로가기, list)
	@RequestMapping(value = "/shop/order/orderForm.mwav", params = "type=frontCart")
	// @RequestMapping(value = "/shop/order/orderForm.mwav")
	// http://egloos.zum.com/nadostar/v/210497
	// vo 사용 http://annotations.tistory.com/61
	public @ResponseBody Map<String, Object> insertOrderForm(CommandMap commandMap,
			HttpServletRequest request) throws Exception {

		// ModelAndView mv = new ModelAndView("/Company/CompanyMasterPage_1");
		Map<String, Object> map = new HashMap<String, Object>(); 
		
		System.out.println("순서");
		log.debug("인터셉터 테스트");

		// mv.addObject("insertBnsForm", insertBnsForm);
		// mv.addObject("IDX", commandMap.get("IDX"));

		HttpSession session = request.getSession();
		String lId = (String) session.getAttribute("member_id");
		if (lId == null)
			lId = session.getId(); // 임의로

		String orderCart_id = lId;
		session.setAttribute("orderCart_id", lId);

		System.out.println("비회원 세션 id " + lId);

		int goods_id = Integer.parseInt(request.getParameter("goods_id"));
		System.out.println("OrderCartPutAction goods_id=" + goods_id);

		System.out.println("OrderCartPutAction ocAmount="
				+ request.getParameter("ocAmount"));
		System.out.println("OrderCartPutAction ocChoiceDt="
				+ request.getParameter("ocChoiceDt"));
		System.out.println("OrderCartPutAction gcr_id="
				+ request.getParameter("gcr_id"));
		System.out.println("OrderCartPutAction type="
				+ request.getParameter("type"));

		Common_Utils cu = new Common_Utils();

		// 캘린더 인스턴스 취득
		Calendar calendar = Calendar.getInstance();
		// 날짜 취득
		Date date = calendar.getTime();
		// 날짜 형식을 yyyyMMddHHmmss로 날짜 취득
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String dateTime = dateFormat.format(date);

		Date ocChoiceDt = dateFormat.parse(dateTime);

		OrderCartVO vo = new OrderCartVO(lId, ocChoiceDt,
				Integer.parseInt(request.getParameter("goods_id")),
				Integer.parseInt(request.getParameter("ocAmount")),
				Integer.parseInt(request.getParameter("gcr_id")),
				cu.getClientIP(request));
		/*
		 * ArrayList<OrderCartVO> list = new ArrayList<OrderCartVO>();
		 * list.add(vo)
		 */

		map = orderService.selectOrderCartCalculate(commandMap.getMap());
		
		int flag = 0;
		flag = orderService.insertOrderForm(vo);
		
		//flag = 0 기등록 / 1 신규등록 성공 / 2 신규등록 실패

		System.out.println("dfs"+flag);
		//request.setAttribute("flag", flag);
		//request.setAttribute("goods_id", goods_id);
		// 재고가 없을 경우 장바구니에 담겨지지 않게 체크하기 위함, 재고는 후에 구현

		map.put("flag", flag);
		map.put("goods_id", goods_id);
		map.put("orderCart_id", orderCart_id);
		
		return map;
	}

	/*
	 * ========================================보기================================
	 * ========
	 */

	
	@RequestMapping(value = "/shop/order/orderPayView.mwav")
	public ModelAndView selectOrderPayView(CommandMap commandMap,
			HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView("/Shop/OrderProcess/OrderPayView");
		
		HttpSession session = request.getSession();
		String lId = (String) session.getAttribute("orderCart_id");
		if (lId == null)
			lId = session.getId(); // 임의로
		
		commandMap.put("orderCart_id", lId);
		
		List<Map<String, Object>> selectListOrderCartChecked = null;
		
		//하나인경우 에러떨어진다. 배열아닌 즉 하나만 선택했을때 일반스트링으로 받을수있도록 처리 
		String[] listNum = (String[]) commandMap.get("listNum");
		
		/* 하나의 파라미터가 여러 값을 가질 때 request.getParameterValues() 메소드 
		 * 
		 * http://blog.naver.com/PostView.nhn?blogId=k_builder&logNo=40187888376
		 * 
		 * listNum은 orderCart.jsp에서 앞에 checkbox 부분
		 * */
		
		/* orderCart.jsp 에서 가져오는 것  */
		Vector<String> goods_id = new Vector<String>();
		Vector<String> ocChoiceDt = new Vector<String>();
		System.out.println("if문 들어가기 직전");
		if(listNum != null) {  //장바구니에서 선택된 것이 있다.
			System.out.println("if문 들어옴");
			for(int i = 0; i<listNum.length;i++) {
				System.out.println("for문 들어옴");
				System.out.println("listNum : "+listNum[i]);
				goods_id.add((String) commandMap.get("goods_idCount"+listNum[i]));
				System.out.println(goods_id);
				ocChoiceDt.add((String) commandMap.get("ocChoiceDtCount"+listNum[i]));	
				System.out.println(ocChoiceDt);
			}	/* good_id status.count값으로 세팅되어있는 것이다.
			      http://kbill.tistory.com/entry/JSTL-core-cforEach-%EC%82%AC%EC%9A%A9%EB%B2%95%EA%B3%BC-varStatus-%EC%83%81%ED%83%9C%EA%B0%92
			       참고)
			       status.count 는 1부터 들어가있다.
			 */
			
			selectListOrderCartChecked = orderService.selectListOrderCartChecked(commandMap.getMap(), goods_id, ocChoiceDt);
			
			for(int i=0;i<selectListOrderCartChecked.size();i++){ 
				Map<String, Object> excelMap = selectListOrderCartChecked.get(i);
				System.out.println("=============" + excelMap.get("goods_id")); 
				}
		System.out.println("고고");	
		mv.addObject("selectListOrderCartChecked", selectListOrderCartChecked);	
		}
		
		return mv;
	}
	
	/*
	 * ========================================수정================================
	 * ========
	 */
	@RequestMapping(value = "/shop/order/orderCartUpdate.mwav")
	public @ResponseBody Map<String, Object> updateOrderCartUpdate(CommandMap commandMap,
			HttpServletRequest request) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>(); 
		
		HttpSession session = request.getSession();
		String orderCart_id = (String) session.getAttribute("orderCart_id");
		if (orderCart_id == null)
			orderCart_id = session.getId(); // 임의로

		commandMap.put("orderCart_id", orderCart_id);
		String ocAmount = null;
		// String ocAmount = request.getParameter("ocAmount");

		String ocChoiceDt_ = (String) commandMap.get("ocChoiceDt");
		System.out.println("ocChoiceDt==" + ocChoiceDt_);
		// SimpleDateFormat dateFormat = new
		// SimpleDateFormat("yyyyMMddHHmmssSSS");
		// Date ocChoiceDt = dateFormat.parse(ocChoiceDt_);
		// >>datetime===3C1809555EFFB4DC59584EDFD0967CD2 이렇게됨

		commandMap.put("ocChoiceDt", ocChoiceDt_);

		if (ocAmount == null || ocAmount.trim().equals("")) {
			ocAmount = "0";
		}
		String goods_id = null;
		int check = orderService.updateOrderCart(commandMap.getMap());
		if (check == 1) {
			// 성공
			ocAmount = (String) commandMap.get("ocAmount");
			System.out.println("ocAmount =" + ocAmount);
			
			map.put("ocAmount", ocAmount);
			
			goods_id = (String) commandMap.get("goods_id");
			map.put("goods_id", goods_id);
			
			map = orderService.selectOrderCartCalculate(commandMap.getMap());
		} else {
			// 실패
		}

		return map;
	}

	/*
	 * ========================================리스트(SelectOne, SelectList
	 * 순)========================================
	 */

	@RequestMapping(value = "/shop/order/orderList.mwav")
	public ModelAndView selectListBnsList(CommandMap commandMap,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/Shop/OrderProcess/OrderForm");

		HttpSession session = request.getSession();
		Map<String, Object> map = new HashMap<String, Object>(); 
		
		String orderCart_id = (String) session.getAttribute("orderCart_id");
		if (orderCart_id == null)
			orderCart_id = session.getId(); // 임의로

		String goods_id = request.getParameter("goods_id");
		System.out.println("goods_id+" + goods_id);
		if (goods_id == null || goods_id.trim().equals("")) {
			goods_id = "0";
		}

		System.out.println("orderCart_id" + orderCart_id);

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

		// vo에 채우기

		if (totalRow > 0) {
			selectListOrderCartList = orderService
					.selectListOrderCartList(commandMap.getMap());
			
			map = orderService.selectOrderCartCalculate(commandMap.getMap());
			// selectboardList =
			// boardService.selectbnsList(commandMap.getMap());

		} else {
			selectListOrderCartList = Collections.emptyList();
		}
		
		mv.addObject("selectListOrderCartList", selectListOrderCartList);
		mv.addObject("pagingVO", pagingVO);
		mv.addObject("totalRow", totalRow);
		mv.addObject("map", map);
		// mv.addObject("paging", pv.print());
		return mv;
	}

	/*
	 * ========================================삭제================================
	 * ========
	 */
	@RequestMapping(value = "/shop/order/OrderCartDelete.mwav")
	public @ResponseBody Map<String, Object> deleteOrderCartDelete(CommandMap commandMap,
			HttpServletRequest request) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>(); 
		int check = 0;

		check = orderService.deleteOrderCartDelete(commandMap
				.getMap());
		System.out.println("check=sdfdf"+check);
		
		String goods_id = (String) commandMap.get("goods_id");
		
		map = orderService.selectOrderCartCalculate(commandMap.getMap());

	
		map.put("check", check);
		map.put("goods_id", goods_id);
		
		return map;
	}

}