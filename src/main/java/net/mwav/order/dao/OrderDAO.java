package net.mwav.order.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import org.springframework.stereotype.Repository;

import net.common.dao.AbstractDAO;
import net.mwav.order.vo.OrderCartVO;

@Repository
@SuppressWarnings("unchecked")
public class OrderDAO extends AbstractDAO {

	public int insertOrderForm(OrderCartVO vo) {
		int flag = 0;

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

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ForderCart_id", orderCart_id);
		map.put("Fgoods_id", goods_id);

		map = (Map<String, Object>) selectOne("order.selectisOrderCart", map);
		int isflag = (int) (long) map.get("count");
		if (isflag >= 1) { // 기등록내역이 있는 경우 상품과, ordercart_id update{
			int b_ocAmount = (int) map.get("ocAmount");

			Date ocChoiceDt = (Date) map.get("ocChoiceDt");
			// SimpleDateFormat dateFormat = new
			// SimpleDateFormat("yyyyMMddHHmmssSSS");

			vo.setOcChoiceDt(ocChoiceDt);

			int n_ocAmount = vo.getOcAmount();
			System.out.println("n_ocAmount=" + n_ocAmount);
			int ocAmount = b_ocAmount + n_ocAmount;

			vo.setOcAmount(ocAmount);

			update("order.updateOrderCart", vo);
			flag = 0; // 기등록
			System.out.println("기등록 성공" + flag);

		} else if (isflag == 0) {// 기등록이 없는 경우 insert{

			int imsiflag = (int) insert("order.insertOrderForm", vo);
			System.out.println("sdf" + imsiflag);

			if (imsiflag == 1) {
				flag = 1; // 신규등록시 성공
				System.out.println("성공" + flag);
			} else {
				flag = 2; // 신규등록시 실패
				System.out.println("실패" + flag);
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
		return (int) selectOne("order.selectOneOrderTotalCount");
	}

	public List<Map<String, Object>> selectListOrderCartList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("order.selectListOrderCartList", map);

	}

	public int updateOrderCart(Map<String, Object> map) {
		String goods_id = (String) map.get("goods_id");
		System.out.println("진짜 goods_id" + goods_id);

		String orderCart_id = (String) map.get("orderCart_id");
		System.out.println("진짜 orderCart_id" + orderCart_id);

		String datetime = (String) map.get("ocChoiceDt");
		System.out.println("datetime===" + datetime);
		/*
		 * SimpleDateFormat dateFormat = new
		 * SimpleDateFormat("yyyyMMddHHmmssSSS"); System.out.println("현재 시간 : "
		 * + dateFormat.format(calendar.getTime()));
		 */
		int check = (int) update("order.updateOrderCart", map);
		/*
		 * List<String> list = null; if(check == 1){ //성공 list =
		 * selectList("order.selectOcAmount", map); }else{ //실패 }
		 */
		return check;
	}

	/*
	 * ========================================삭제================================
	 * ========
	 */
	public int deleteOrderCartDelete(Map<String, Object> map) {
		// TODO Auto-generated method stub

		String goods_id = (String) map.get("goods_id");
		System.out.println("진짜 goods_id" + goods_id);

		String orderCart_id = (String) map.get("orderCart_id");
		System.out.println("진짜 orderCart_id" + orderCart_id);

		String datetime = (String) map.get("ocChoiceDt");
		System.out.println("진짜 orderCart_id" + datetime);
		int check = (int) update("order.deleteOrderCartDelete", map);

		if (check == 1) {
			System.out.println("삭제성공");
		} else if (check == 0) {
			System.out.println("삭제실패");
		} else {
			System.out.println("엥머지?");
		}
		return check;
	}

	public List<Map<String, Object>> selectOrderCartCalculate(Map<String, Object> map) {
		// TODO Auto-generated method stub

		return (List<Map<String, Object>>) selectList("order.selectOrderCartCalculate", map);
	}

	public List<Map<String, Object>> selectListOrderCartChecked(Map<String, Object> map, Vector<String> goods_id, Vector<String> ocChoiceDt) {
		// TODO Auto-generated method stub

		Map<String, Object> selectListOrderCart = null;
		List<Map<String, Object>> selectListOrderCartChecked = new ArrayList<Map<String, Object>>();
		// List<OrderCartVO> articleList = null;

		//selectListOrderCart = selectList("order.selectOrderCartCalculate", map);

		//System.out.println("사이즈" + selectListOrderCart.size());
		//System.out.println("사이즈1" + goods_id.size());
		for (int i = 0; i < goods_id.size(); i++) {
			/* pk 두개 잡은 이유지 그 두개가 일치하나 볼라고 */
			// System.out.println(ocChoiceDt.size());
			// System.out.println(goods_id.size());
			/*System.out.println("11" + ocChoiceDt.elementAt(i));
			System.out.println("12"
					+ String.valueOf(selectListOrderCart.get(i).get(
							"ocChoiceDt")));
			
			System.out.println("21" + goods_id.elementAt(i));
			System.out
					.println("22"
							+ String.valueOf(selectListOrderCart.get(i).get(
									"goods_id")));*/
			map.put("ocChoiceDt", ocChoiceDt.elementAt(i));
			map.put("goods_id", goods_id.elementAt(i));

			selectListOrderCart = (Map<String, Object>) selectOne("order.selectOrderCartCalculate2", map);

			if (ocChoiceDt.elementAt(i).equals(String.valueOf(selectListOrderCart.get("ocChoiceDt"))) && goods_id.elementAt(i).equals(String.valueOf(selectListOrderCart.get("goods_id")))) {
				map = new HashMap<String, Object>();

				map.put("goods_id", selectListOrderCart.get("goods_id"));
				map.put("orderCart_id", selectListOrderCart.get("orderCart_id"));
				map.put("ocChoiceDt", selectListOrderCart.get("ocChoiceDt"));
				map.put("ocAmount", selectListOrderCart.get("ocAmount"));
				map.put("gcr_id", selectListOrderCart.get("gcr_id"));
				map.put("ocIpaddress", selectListOrderCart.get("ocIpaddress"));
				map.put("statistics_id", selectListOrderCart.get("statistics_id"));

				map.put("gManufacturer", selectListOrderCart.get("gManufacturer"));
				map.put("gName", selectListOrderCart.get("gName"));
				map.put("gMemberPrice", selectListOrderCart.get("gMemberPrice"));
				map.put("gConsumerPrice", selectListOrderCart.get("gConsumerPrice"));
				map.put("gDeliveryCost", selectListOrderCart.get("gDeliveryCost"));

				selectListOrderCartChecked.add(map);
			}

			/*if (ocChoiceDt.elementAt(i)
					.equals(String.valueOf(selectListOrderCart.get(i).get(
							"ocChoiceDt")))
					&& goods_id.elementAt(i).equals(
							String.valueOf(selectListOrderCart.get(i).get(
									"goods_id")))) {
				// 맨날 끌고 댕긴값인 good_id 와 ocChoiceDt 의 값이 일치하는 경우 (둘다 &&조건)
				System.out.println("gogo");
				map = new HashMap<String, Object>();
				//중요 여기서 객체 생성없이 한다면 위의 하나의 map 객체로 된다
				// 1. 하나의 map 객체 ->> 값이 10002 /10006 나와도 하나 즉 최종 마지막 값으로 덮어씌운다
				// 2. 위와 같이 map 객체 여기서 생성시 맞을때 마다 map 객체 생성 즉 두번이면 두개 생성되서 넣으니!! 
				
				//선택하는 기준과 // db상 (
			
				map.put("goods_id", selectListOrderCart.get(i).get("goods_id"));
				map.put("orderCart_id",
						selectListOrderCart.get(i).get("orderCart_id"));
				map.put("ocChoiceDt",
						selectListOrderCart.get(i).get("ocChoiceDt"));
				map.put("ocAmount", selectListOrderCart.get(i).get("ocAmount"));
				map.put("gcr_id", selectListOrderCart.get(i).get("gcr_id"));
				map.put("ocIpaddress",
						selectListOrderCart.get(i).get("ocIpaddress"));
				map.put("statistics_id",
						selectListOrderCart.get(i).get("statistics_id"));
			
				map.put("gManufacturer",
						selectListOrderCart.get(i).get("gManufacturer"));
				map.put("gName", selectListOrderCart.get(i).get("gName"));
				map.put("gMemberPrice",
						selectListOrderCart.get(i).get("gMemberPrice"));
				map.put("gConsumerPrice",
						selectListOrderCart.get(i).get("gConsumerPrice"));
				map.put("gDeliveryCost",
						selectListOrderCart.get(i).get("gDeliveryCost"));
			
				selectListOrderCartChecked.add(map);
			}*/
		}
		return selectListOrderCartChecked;
	}
}
