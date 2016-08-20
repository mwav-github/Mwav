package net.mwav.order.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.common.dao.AbstractDAO;
import net.mwav.order.vo.OrderCartVO;

import org.springframework.stereotype.Repository;

@Repository("orderDAO")
public class OrderDAO extends AbstractDAO {

	// Abstrat로 변경

	/*
	 * ========================================등록================================
	 * ========
	 */

	public boolean insertOrderForm(OrderCartVO vo) {
		// TODO Auto-generated method stub
		boolean flag = true;

		String orderCart_id = vo.getOrderCart_id();
		int goods_id = vo.getGoods_id();
		System.out.println("출력 order" + orderCart_id);
		/*
		 * Map<String, Object> imsimap = (Map<String, Object>) selectOne(
		 * "order.selectNextPk", orderCart_id); // map을 위에서 써버리면 그 다음 쿼리시 null 값
		 * 나온다. !! (가져오는값이라?) String order_pk =
		 * String.valueOf(imsimap.get("member_id"));
		 * vo.setOrderCart_id(order_pk);
		 */
		
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("ForderCart_id", orderCart_id);
		map.put("Fgoods_id", goods_id);
		

		map = (Map<String, Object>) selectOne("order.selectisOrderCart", map);
		int isflag = (int)(long) map.get("count");
		if (isflag >= 1) { // 기등록내역이 있는 경우 상품과, ordercart_id update{
			int b_ocAmount = (int) map.get("ocAmount");

			
			int n_ocAmount = vo.getOcAmount();
			
			int ocAmount = b_ocAmount + n_ocAmount;
			
			vo.setOcAmount(ocAmount);
			
			update("order.updateOrderCart", vo);
			
			
		} else if (isflag == 0) {// 기등록이 없는 경우 insert{

			int imsiflag = (int) insert("order.insertOrderForm", vo);
			if (imsiflag == 0) {
				System.out.println("실패");
				flag = false;
			} else {
				System.out.println("성공");
				flag = true;
			}
		}

		return flag;
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

	public int selectOneOrderTotalCount() {
		// TODO Auto-generated method stub
		return (int) selectOne("order.selectOneOrderTotalCount");
	}
	
	
	public List<Map<String, Object>> selectListOrderCartList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) selectList("order.selectListOrderCartList",
				map);

	}

	/*
	 * ========================================삭제================================
	 * ========
	 */

}
