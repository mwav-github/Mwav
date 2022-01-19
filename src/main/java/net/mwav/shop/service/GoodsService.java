package net.mwav.shop.service;

import java.util.List;
import java.util.Map;

public interface GoodsService {

	List<Map<String, Object>> selectListGdsList(Map<String, Object> map);

	int selectOneGetGdsTotalCount();

	Map<String, Object> selectOneGdsView(Map<String, Object> map);

}
