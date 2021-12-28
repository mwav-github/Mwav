package net.bizLogin.promoter.service;

import java.io.IOException;
import java.util.Map;

import net.bizLogin.promoter.vo.PmtFacilitatorSO;
import net.bizLogin.promoter.vo.PmtFacilitatorVO;
import net.common.common.CommandMap;

/**
 * 프로모터 로그인
 * @author 남동희
 *
 */
public interface PmtFacilitatorService {

	/**
	 * 프로모터 등록여부 확인
	 * @param stfLoginId
	 * @return
	 * @throws Exception
	 */
	public boolean selectOnePmtLoginIdCheck(String stfLoginId) throws Exception;

	/**
	 * 프로모터 회원가입
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> insertPmtForm(CommandMap commandMap) throws Exception;

	public PmtFacilitatorVO checkSocialJoin(PmtFacilitatorSO vo);

	public PmtFacilitatorVO joinSocialLogin(PmtFacilitatorSO vo);

	public Map<String, Object> login(Map<String, Object> param) throws Exception;

	public boolean sendCertifyMail(String serverUrl, String pmtMail, String pmtLoginId) throws IOException;

	public String selectOnePmtId(String pmtLoginId);

	public int updatePmtEmail(String changeEmail, String promoter_id);
}
