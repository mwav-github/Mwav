package net.promoter.service;

import java.util.List;
import java.util.Map;

import net.promoter.vo.Promoter_VO;

public interface PromoterService {

	/*========================================등록========================================*/
	int selectNextPmtPk() throws Exception;

	public int selectOnePmtLoginIdCheck(String PmtLoginId) throws Exception;

	int insertPmtForm(Promoter_VO promoter) throws Exception;

	int selectOneGetTotalCount()throws Exception;

	Map<String, Object> selectPmtView(Map<String, Object> map)throws Exception;

	Map<String, Object> updatePmtForm(Map<String, Object> map) throws Exception;

	Promoter_VO selectPmtLogin(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> selectListPmtList(Map<String, Object> map) throws Exception;

	Promoter_VO selectOnePmtInfo(String promoter_id) throws Exception;

	/*========================================업데이트========================================*/
	int updatePmtVisitNbr(String PmtLoginId)  throws Exception;


	int updatePmtPro(Map<String, Object> map);
}
