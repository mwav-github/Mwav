package net.admins.dao;

import net.common.common.CommandMap;
import net.common.dao.AbstractDAO;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class AdminPromoterDAO extends AbstractDAO {

	public int selectPmtOneGetTotalCount(CommandMap commandMap) {
		return (int) selectOne("staffPromoter.selectPmtOneGetTotalCount", commandMap.getMap());
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectListPmtList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("staffPromoter.selectListPmtList", map);
	}

	public int selectOnePmtLoginIdCheck(String pmtLoginId) {
		return (int) selectOne("staffPromoter.selectOnePmtLoginIdCheck", pmtLoginId);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectPmtView(String promoter_id) {
		return (Map<String, Object>) selectOne("staffPromoter.selectPmtView", promoter_id);
	}

	public void insertPromoter_tbl(CommandMap commandMap) {
		insert("staffPromoter.insertPromoter_tbl", commandMap.getMap());
	}

	public void insertPromoterValue_tbl(CommandMap commandMap) {
		insert("staffPromoter.insertPromoterValue_tbl", commandMap.getMap());
	}

	public void insertPromoterValueLog_tbl(CommandMap commandMap) {
		insert("staffPromoter.insertPromoterValueLog_tbl", commandMap.getMap());
	}

	public void insertPromoterSpecialty_tbl(CommandMap commandMap) {
		insert("staffPromoter.insertPromoterSpecialty_tbl", commandMap.getMap());
	}

	public void insertPromoterLicense_tbl(CommandMap commandMap) {
		insert("staffPromoter.insertPromoterLicense_tbl", commandMap.getMap());
	}

	public void insertPromoterChannel_tbl(CommandMap commandMap) {
		insert("staffPromoter.insertPromoterChannel_tbl", commandMap.getMap());
	}

	public void insertPromoterAccount_tbl(CommandMap commandMap) {
		insert("staffPromoter.insertPromoterAccount_tbl", commandMap.getMap());
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> updatePmtForm(String promoter_id) {
		return (Map<String, Object>) selectOne("staffPromoter.updatePmtForm", promoter_id);
	}

	public void updatePromoter_tbl(CommandMap commandMap) {
		update("staffPromoter.updatePromoter_tbl", commandMap.getMap());
	}

	public void updatePromoterValue_tbl(CommandMap commandMap) {
		update("staffPromoter.updatePromoterValue_tbl", commandMap.getMap());
	}

	public void updatePromoterLicense_tbl(CommandMap commandMap) {
		update("staffPromoter.updatePromoterLicense_tbl", commandMap.getMap());
	}

	public void updatePromoterChannel_tbl(CommandMap commandMap) {
		update("staffPromoter.updatePromoterChannel_tbl", commandMap.getMap());
	}

	public void updatePromoterAccount_tbl(CommandMap commandMap) {
		update("staffPromoter.updatePromoterAccount_tbl", commandMap.getMap());
	}

	public void updatePmtPassword(CommandMap commandMap) {
		update("staffPromoter.updatePmtPassword", commandMap.getMap());
	}

	public void leavePmt(CommandMap commandMap) {
		update("staffPromoter.leavePmt", commandMap.getMap());
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectPmtSpecialtyNames(String promoter_id) {
		return selectList("staffPromoter.selectPmtSpecialtyNames", promoter_id);
	}

	public void deletePromoterSpecialty_tbl(String promoter_id) {
		delete("staffPromoter.deletePromoterSpecialty_tbl", promoter_id);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectStaffSeek(CommandMap commandMap) {
		return selectList("staffPromoter.selectStaffSeek", commandMap.getMap());
	}

	public int selectStaffSeekMaxCount(CommandMap commandMap) {
		return (int) selectOne("staffPromoter.selectStaffSeekMaxCount", commandMap.getMap());
	}

	public void returnPmt(CommandMap commandMap) {
		update("staffPromoter.returnPmt", commandMap.getMap());
	}
}
