package net.bizLogin.promoter.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import net.bizLogin.promoter.vo.BizPromoter_VO;
import net.bizLogin.promoter.vo.PmtFacilitatorSO;
import net.bizLogin.promoter.vo.PmtFacilitatorVO;
import net.common.common.CommandMap;
import net.common.dao.AbstractDAO;

/**
 * 프로모터 로그인
 * @author 공태현
 *
 */
@Repository("pmtFacilitatorDAO")
public class PmtFacilitatorDAO extends AbstractDAO {

	/**
	 * 프로모터 등록여부 확인
	 * @param pmtLoginId
	 * @return
	 */
	public int selectOnePmtLoginIdCheck(String pmtLoginId) {
		return (int) selectOne("promoterFacilitator.selectOnePmtLoginIdCheck", pmtLoginId);
	}

	/**
	 * 프로모터 등록
	 * @param commandMap
	 */
	public void insertPromoter_tbl(CommandMap commandMap) {
		insert("promoterFacilitator.insertPromoter_tbl", commandMap.getMap());
	}

	/**
	 * 프로모터 가치정보 등록
	 * @param commandMap
	 */
	public void insertPromoterValue_tbl(CommandMap commandMap) {
		insert("promoterFacilitator.insertPromoterValue_tbl", commandMap.getMap());
	}

	/**
	 * 프로모터 가치정보 로그 등록
	 * @param commandMap
	 */
	public void insertPromoterValueLog_tbl(CommandMap commandMap) {
		insert("promoterFacilitator.insertPromoterValueLog_tbl", commandMap.getMap());
	}

	public PmtFacilitatorVO checkSocialJoin(PmtFacilitatorSO so) {
		return (PmtFacilitatorVO) selectOne("promoter.checkSocialLogin", so);
	}

	public int joinSocialLogin(PmtFacilitatorSO so) {
		return (int) insert("promoter.joinSocialLogin", so);
	}

	public String selectChkPmtCertifyDtYN(String promoter_id) {
		return (String) selectOne("promoter.selectChkPmtCertifyDtYN", promoter_id);
	}

	public BizPromoter_VO selectBizPmtLogin(Map<String, Object> map) {
		return (BizPromoter_VO) selectOne("promoter.selectBizPmtLogin", map);
	}

	public String selectOnePmtId(String pmtLoginId) {
		return (String) selectOne("promoter.selectOnePmtId", pmtLoginId);
	}

	public int updatePmtEmail(Map<String, String> param) {
		return (int) selectOne("promoter.updatePmtEmail", param);
	}
}
