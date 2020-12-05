package net.bizLogin.promoter.service;

import java.util.Map;

import net.bizLogin.promoter.vo.PmtFacilitatorSO;
import net.bizLogin.promoter.vo.PmtFacilitatorVO;

public interface PmtFacilitatorService {

	void insertBoard(Map<String, Object> map);

	/*========================================등록========================================*/

	/*========================================업데이트========================================*/
	
	public PmtFacilitatorVO checkSocialJoin(PmtFacilitatorSO vo);
	
	public PmtFacilitatorVO joinSocialLogin(PmtFacilitatorSO vo);

}
