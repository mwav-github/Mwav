package net.bizLogin.promoter.service;

import net.bizLogin.promoter.vo.BizPromoter_VO;
import net.common.common.CommandMap;

import java.util.Map;

import net.bizLogin.promoter.vo.PmtFacilitatorSO;
import net.bizLogin.promoter.vo.PmtFacilitatorVO;
import net.promoter.vo.Promoter_VO;

public interface PmtFacilitatorService {
	/*========================================등록========================================*/
	Map<String, Object> insertPmtForm(CommandMap commandMap) throws Exception ;
	boolean selectOnePmtLoginIdCheck(String stfLoginId) throws Exception;
	/*========================================업데이트========================================*/
	
	public PmtFacilitatorVO checkSocialJoin(PmtFacilitatorSO vo);
	
	public PmtFacilitatorVO joinSocialLogin(PmtFacilitatorSO vo);
	BizPromoter_VO selectBizPmtLogin(Map<String, Object> map) throws Exception;
}
