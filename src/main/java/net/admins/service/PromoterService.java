package net.admins.service;

import net.common.common.CommandMap;

import java.io.IOException;
import java.util.List;
import java.util.Map;

public interface PromoterService {

    int selectPmtOneGetTotalCount(CommandMap commandMap);

    List<Map<String, Object>> selectListPmtList(Map<String, Object> map);

    void insertPmtForm(CommandMap commandMap) throws Exception;

    boolean selectOnePmtLoginIdCheck(String stfLoginId) throws Exception;

    Map<String, Object> selectPmtView(String promoter_id);

    Map<String, Object> updatePmtForm(String promoter_id);

    void updatePmt(CommandMap commandMap);

    boolean updatePmtPassword(CommandMap commandMap) throws IOException;

    void leavePmt(CommandMap commandMap);

    Map<String, Object> selectStaffSeek(CommandMap commandMap);

    void returnPmt(CommandMap commandMap);
}
