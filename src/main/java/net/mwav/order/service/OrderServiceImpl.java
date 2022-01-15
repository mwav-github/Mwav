package net.mwav.order.service;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.mwav.order.dao.OrderDAO;
import net.mwav.order.vo.OrderCartVO;

@Service
public class OrderServiceImpl implements OrderService {

	@Inject
	private OrderDAO orderDAO;

	// ///////////////////////////////////BoardNews/////////////////////////////////////

	@Override
	public int insertOrderForm(OrderCartVO vo) throws Exception {
		int flag = orderDAO.insertOrderForm(vo);
		return flag;
	}

	@Override
	public int selectOneOrderTotalCount() {
		return orderDAO.selectOneOrderTotalCount();
	}

	@Override
	public List<Map<String, Object>> selectListOrderCartList(Map<String, Object> map) {
		return orderDAO.selectListOrderCartList(map);
	}

	@Override
	public int updateOrderCart(Map<String, Object> map) {
		return orderDAO.updateOrderCart(map);
	}

	public int deleteOrderCartDelete(Map<String, Object> map) {
		return orderDAO.deleteOrderCartDelete(map);
	}

	@Override
	public Map<String, Object> selectOrderCartCalculate(Map<String, Object> map) {

		List<Map<String, Object>> selectOrderCartCalculate = orderDAO.selectOrderCartCalculate(map);
		//Map<String, Object> excelMap = null;
		int totalMemberPrice = 0;
		int totalConsumerPrice = 0;
		int totalDeliveryCost = 0;
		int AllTotal_MemberPrice = 0;
		int AllTotal_ConsumerPrice = 0;

		for (int i = 0; i < selectOrderCartCalculate.size(); i++) {
			//excelMap = selectOrderCartCalculate.get(i);
			System.out.println("=============" + selectOrderCartCalculate.get(i).get("gConsumerPrice"));

			int ocAmount = (int) selectOrderCartCalculate.get(i).get("ocAmount");

			int imsigConsumberPrice = ocAmount * (int) selectOrderCartCalculate.get(i).get("gConsumerPrice");
			System.out.println("=============" + imsigConsumberPrice);
			totalConsumerPrice += imsigConsumberPrice;

			int imsigDeliveryCost = (int) selectOrderCartCalculate.get(i).get("gDeliveryCost");
			totalDeliveryCost += imsigDeliveryCost;

			System.out.println("=============" + totalDeliveryCost);

			int imsigMemberPrice = ocAmount * (int) selectOrderCartCalculate.get(i).get("gMemberPrice");
			totalMemberPrice += imsigMemberPrice;
			System.out.println("=============" + imsigMemberPrice);
		}
		System.out.println("totalDeliveryCost" + totalDeliveryCost);
		System.out.println("totalMemberPrice" + totalMemberPrice);
		System.out.println("totalConsumerPrice" + totalConsumerPrice);

		AllTotal_MemberPrice = totalDeliveryCost + totalMemberPrice;
		AllTotal_ConsumerPrice = totalDeliveryCost + totalConsumerPrice;

		map.put("totalDeliveryCost", totalDeliveryCost);
		map.put("totalMemberPrice", totalMemberPrice);
		map.put("totalConsumerPrice", totalConsumerPrice);
		map.put("AllTotal_MemberPrice", AllTotal_MemberPrice);
		map.put("AllTotal_ConsumerPrice", AllTotal_ConsumerPrice);

		return map;
	}

	@Override
	public List<Map<String, Object>> selectListOrderCartChecked(Map<String, Object> map, Vector<String> goods_id, Vector<String> ocChoiceDt) {
		return orderDAO.selectListOrderCartChecked(map, goods_id, ocChoiceDt);
	}

}