package net.mwav.order.service;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import net.common.common.CommandMap;
import net.mwav.order.vo.OrderCartVO;

public interface OrderService {

/////////////////////////////////////BoardNews/////////////////////////////////////

	/*
	 * ========================================등록================================
	 * ========
	 */

	int insertOrderForm(OrderCartVO vo) throws Exception;

	int selectOneOrderTotalCount();

	List<Map<String, Object>> selectListOrderCartList(Map<String, Object> map);

	int updateOrderCart(Map<String, Object> map);

	int deleteOrderCartDelete(Map<String, Object> map);
	
	Map<String, Object> selectOrderCartCalculate(Map<String, Object> map);

	List<Map<String, Object>> selectListOrderCartChecked(Map<String, Object> map, Vector<String> goods_id, Vector<String> ocChoiceDt);

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
