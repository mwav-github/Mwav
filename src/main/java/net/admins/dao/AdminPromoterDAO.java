package net.admins.dao;

import net.common.common.CommandMap;
import net.common.dao.AbstractDAO;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class AdminPromoterDAO extends AbstractDAO {

    public int selectPmtOneGetTotalCount(CommandMap commandMap) {
        return (int) selectOne("staff.selectPmtOneGetTotalCount", commandMap.getMap());
    }

    public List<Map<String, Object>> selectListPmtList(Map<String, Object> map) {
        return (List<Map<String, Object>>) selectList("staff.selectListPmtList", map);
    }


    public int selectOnePmtLoginIdCheck(String pmtLoginId) {
        return (int) selectOne("staff.selectOnePmtLoginIdCheck", pmtLoginId);
    }

    public Map<String, Object> selectPmtView(String promoter_id) {
        return (Map<String, Object>) selectOne("staff.selectPmtView", promoter_id);
    }

    public void insertPromoter_tbl(CommandMap commandMap) {
        insert("staff.insertPromoter_tbl", commandMap.getMap());
    }

    public void insertPromoterValue_tbl(CommandMap commandMap) {
        insert("staff.insertPromoterValue_tbl", commandMap.getMap());
    }

    public void insertPromoterValueLog_tbl(CommandMap commandMap) {
        insert("staff.insertPromoterValueLog_tbl", commandMap.getMap());
    }

    public void insertPromoterSpecialty_tbl(CommandMap commandMap) {
        insert("staff.insertPromoterSpecialty_tbl", commandMap.getMap());
    }

    public void insertPromoterLicense_tbl(CommandMap commandMap) {
        insert("staff.insertPromoterLicense_tbl", commandMap.getMap());
    }

    public void insertPromoterChannel_tbl(CommandMap commandMap) {
        insert("staff.insertPromoterChannel_tbl", commandMap.getMap());
    }

    public void insertPromoterAccount_tbl(CommandMap commandMap) {
        insert("staff.insertPromoterAccount_tbl", commandMap.getMap());
    }

    public Map<String, Object> updatePmtForm(String promoter_id) {
        return (Map<String, Object>) selectOne("staff.updatePmtForm", promoter_id);
    }

    public void updatePromoter_tbl(CommandMap commandMap) {
        update("staff.updatePromoter_tbl", commandMap.getMap());
    }

    public void updatePromoterValue_tbl(CommandMap commandMap) {
        update("staff.updatePromoterValue_tbl", commandMap.getMap());
    }

    public void updatePromoterLicense_tbl(CommandMap commandMap) {
        update("staff.updatePromoterLicense_tbl", commandMap.getMap());
    }

    public void updatePromoterChannel_tbl(CommandMap commandMap) {
        update("staff.updatePromoterChannel_tbl", commandMap.getMap());
    }

    public void updatePromoterAccount_tbl(CommandMap commandMap) {
        update("staff.updatePromoterAccount_tbl", commandMap.getMap());
    }

    public void updatePmtPassword(CommandMap commandMap) {
        update("staff.updatePmtPassword", commandMap.getMap());
    }

    public void leavePmt(CommandMap commandMap) {
        update("staff.leavePmt", commandMap.getMap());
    }

    public List selectPmtSpecialtyNames(String promoter_id) {
        return selectList("staff.selectPmtSpecialtyNames", promoter_id);
    }

    public void deletePromoterSpecialty_tbl(String promoter_id) {
        delete("staff.deletePromoterSpecialty_tbl", promoter_id);
    }

    public List selectStaffSeek(CommandMap commandMap) {
        return selectList("staff.selectStaffSeek",commandMap.getMap());
    }

    public int selectStaffSeekMaxCount(CommandMap commandMap) {
        return (int) selectOne("staff.selectStaffSeekMaxCount", commandMap.getMap());
    }

    public void returnPmt(CommandMap commandMap) {
        update("staff.returnPmt", commandMap.getMap());
    }
}
