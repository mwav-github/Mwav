package net.mwav.order.service;

import java.util.List;
import java.util.Map;

import net.common.common.CommandMap;
import net.mwav.order.vo.OrderCartVO;

public interface OrderService {

/////////////////////////////////////BoardNews/////////////////////////////////////

	/*
	 * ========================================등록================================
	 * ========
	 */

	boolean insertOrderForm(OrderCartVO vo) throws Exception;

	int selectOneOrderTotalCount();

	List<Map<String, Object>> selectListOrderCartList(Map<String, Object> map);

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
