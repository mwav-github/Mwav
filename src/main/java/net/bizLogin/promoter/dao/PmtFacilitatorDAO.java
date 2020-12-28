package net.bizLogin.promoter.dao;

import net.common.common.CommandMap;
import net.common.dao.AbstractDAO;
import org.springframework.stereotype.Repository;


@Repository("pmtFacilitatorDAO")
public class PmtFacilitatorDAO extends AbstractDAO{
    public void insertPromoter_tbl(CommandMap commandMap) {
        insert("promoterFacilitator.insertPromoter_tbl", commandMap.getMap());
    }

    public void insertPromoterValue_tbl(CommandMap commandMap) {
        insert("promoterFacilitator.insertPromoterValue_tbl", commandMap.getMap());
    }
    public void insertPromoterValueLog_tbl(CommandMap commandMap) {
        insert("promoterFacilitator.insertPromoterValueLog_tbl", commandMap.getMap());
    }
    public int selectOnePmtLoginIdCheck(String pmtLoginId) {
        return (int) selectOne("promoterFacilitator.selectOnePmtLoginIdCheck", pmtLoginId);
    }

}

