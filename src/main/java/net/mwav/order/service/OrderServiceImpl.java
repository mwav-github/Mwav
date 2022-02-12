package net.mwav.order.service;

import net.mwav.order.dao.OrderDAO;
import net.mwav.order.vo.OrderCartVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;
import java.util.Map;
import java.util.Vector;

@Service
public class OrderServiceImpl implements OrderService {

	private static final Logger logger = LoggerFactory.getLogger(OrderServiceImpl.class);

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
			logger.debug("=============" + selectOrderCartCalculate.get(i).get("gConsumerPrice"));

			int ocAmount = (int) selectOrderCartCalculate.get(i).get("ocAmount");

			int imsigConsumberPrice = ocAmount * (int) selectOrderCartCalculate.get(i).get("gConsumerPrice");
			logger.debug("=============" + imsigConsumberPrice);
			totalConsumerPrice += imsigConsumberPrice;

			int imsigDeliveryCost = (int) selectOrderCartCalculate.get(i).get("gDeliveryCost");
			totalDeliveryCost += imsigDeliveryCost;

			logger.debug("=============" + totalDeliveryCost);

			int imsigMemberPrice = ocAmount * (int) selectOrderCartCalculate.get(i).get("gMemberPrice");
			totalMemberPrice += imsigMemberPrice;
			logger.debug("=============" + imsigMemberPrice);
		}
		logger.debug("totalDeliveryCost" + totalDeliveryCost);
		logger.debug("totalMemberPrice" + totalMemberPrice);
		logger.debug("totalConsumerPrice" + totalConsumerPrice);

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