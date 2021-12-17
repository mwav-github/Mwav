package net.bizLogin.promoter.dao;

import net.common.common.CommandMap;
import net.bizLogin.promoter.vo.PmtFacilitatorSO;
import net.bizLogin.promoter.vo.PmtFacilitatorVO;
import net.common.dao.AbstractDAO;
import net.promoter.vo.Promoter_VO;
import org.springframework.stereotype.Repository;

import java.util.Map;


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

	public PmtFacilitatorVO checkSocialJoin(PmtFacilitatorSO so) {
		return (PmtFacilitatorVO) selectOne("promoter.checkSocialLogin", so);
	}
	
	public int joinSocialLogin(PmtFacilitatorSO so) {
		return (int) insert("promoter.joinSocialLogin", so);
	}

    public String selectChkPmtCertifyDtYN(String promoter_id){
        return (String) selectOne("promoter.selectChkPmtCertifyDtYN",promoter_id);
    }
    public PmtFacilitatorVO selectPmtLogin(Map<String, Object> map){
        return (PmtFacilitatorVO)selectOne("promoter.selectPmtLogin",map);
    }

    public int checkNaverAccount(PmtFacilitatorVO vo){
        return (int) selectOne("promoter.checkNaverAccount", vo);
    }

    public void saveNaverAccount(PmtFacilitatorVO vo){
        insert("promoter.saveNaverAccount", vo);
    }
}

