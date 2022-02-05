package net.bizLogin.promoter.service;

import net.bizLogin.promoter.vo.BizPromoter_VO;
import net.common.common.CommandMap;

import java.io.IOException;
import java.util.Map;

import net.bizLogin.promoter.vo.PmtFacilitatorSO;
import net.bizLogin.promoter.vo.PmtFacilitatorVO;

import javax.servlet.http.HttpServletRequest;

public interface PmtFacilitatorService {
	/*========================================등록========================================*/
	Map<String, Object> insertPmtForm(CommandMap commandMap) throws Exception ;
	boolean selectOnePmtLoginIdCheck(String stfLoginId) throws Exception;
	/*========================================업데이트========================================*/
	
	public PmtFacilitatorVO checkSocialJoin(PmtFacilitatorSO vo);
	
	public PmtFacilitatorVO joinSocialLogin(PmtFacilitatorSO vo);

	PmtFacilitatorVO selectPmtFacLogin(Map<String, Object> map) throws Exception;

	/*======================================SocialNaver==========================================*/
	public int checkNaverAccount(Map<String, Object> map);
  
	public void saveNaverAccount(Map<String, Object> map, HttpServletRequest request);

	Map<String, Object> selectBizPmtLogin(Map<String, Object> map) throws Exception;

	boolean sendCertifyMail(String serverUrl, String pmtMail, String pmtLoginId) throws IOException;

  String selectOnePmtId(String pmtLoginId);

	int updatePmtEmail(String changeEmail, String promoter_id);

}
