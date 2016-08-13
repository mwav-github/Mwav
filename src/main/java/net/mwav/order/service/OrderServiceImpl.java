package net.mwav.order.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.annotation.Resource;

import net.common.common.CommandMap;
import net.mwav.order.dao.OrderDAO;
import net.mwav.order.vo.OrderCartVO;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("orderService")
public class OrderServiceImpl implements OrderService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "orderDAO")
	private OrderDAO orderDAO;

/////////////////////////////////////BoardNews/////////////////////////////////////

	/*
	 * ========================================등록================================
	 * ========
	 */

	@Override
	public boolean insertOrderForm(OrderCartVO vo) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = orderDAO.insertOrderForm(vo);
		return false;
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