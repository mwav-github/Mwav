package net.admins.service;

import java.util.List;
import java.util.Map;

public interface GoodsAdminsService {

	Map<String, Object> insertGdsForm(Map<String, Object> map);

	int selectOneGetGdsTotalCount();

	List<Map<String, Object>> selectListGdsList(Map<String, Object> map);

	Map<String, Object> updateGdsForm(Map<String, Object> map);

	void updateProGdsForm(Map<String, Object> map);

	void insertGdsFiles(Map<String, Object> map);

	String selectNextPk();

	List<Map<String, Object>> selectListGdsFilesList(Map<String, Object> map);

	Map<String, Object> selectOneGdsView(Map<String, Object> map);

	List<Map<String, Object>> selectCategoryGoodsList();

	void deleteGdsDelete(Map<String, Object> map);

	String mkTempImgFileName(String imgLocation);

	void saveImage(String goodsId) throws Exception;

	boolean deletePreTempFile(String fileName) throws Exception;
}
