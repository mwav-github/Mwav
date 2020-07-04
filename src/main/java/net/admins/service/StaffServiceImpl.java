package net.admins.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.admins.dao.StaffDAO;
import net.admins.vo.Staff_VO;

import net.common.common.CommandMap;
import net.mwav.common.module.AesEncryption;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("staffService")
public class StaffServiceImpl implements StaffService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "staffDAO")
	private StaffDAO staffDAO;

	/*
	 * ========================================등록================================
	 * ========
	 */
	
	@Override
	public int selectNextStfPk() throws Exception {
		// TODO Auto-generated method stub
		return staffDAO.selectNextStfPk();
	}
	
	public boolean selectOneStfLoginIdCheck(String stfLoginId) throws Exception{
		return staffDAO.selectOneStfLoginIdCheck(stfLoginId);
	}
	
	@Override
	public void insertStfForm(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub

		System.out.println("map=" + map);
		staffDAO.insertStfForm(map);
	}

	@Override
	public int selectOneGetTotalCount() {
		// TODO Auto-generated method stub
		return  staffDAO.selectOneGetTotalCount();
	}

	@Override
	public Map<String, Object> selectStfView(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return staffDAO.selectStfView(map);
	}

	@Override
	public Map<String, Object> updateStfForm(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return staffDAO.updateStfForm(map);
	}

	@Override
	public Staff_VO selectStfLogin(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return staffDAO.selectStfLogin(map);
	}

	@Override
	public List<Map<String, Object>> selectListStfList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return staffDAO.selectListStfList(map);
	}

	@Override
	public void updateProStfForm(Map<String, Object> map) {
		// TODO Auto-generated method stub
		staffDAO.updateProStfForm(map);
		
	}

	@Override
	public int insertStfRegist(Map<String, Object> map) {
		return staffDAO.insertStfRegist(map);
	}

	@Override
	public int selectPmtOneGetTotalCount(CommandMap commandMap) {
		return staffDAO.selectPmtOneGetTotalCount(commandMap);
	}

	@Override
	public List<Map<String, Object>> selectListPmtList(Map<String, Object> map) {
		return staffDAO.selectListPmtList(map);
	}

	@Transactional
	@Override
	public void insertPmtForm(CommandMap commandMap) throws Exception {
		// AES/CBC/IV 암호화 (키,암호화텍스트,iv)
		String b_stfLoginPw = (String) commandMap.get("pmtLoginPw");
		byte[] encrypted = AesEncryption.aesEncryptCbc(AesEncryption.sKey, b_stfLoginPw, AesEncryption.sInitVector);

		// 암호화된 값이 String으로 반환
		commandMap.put("pmtLoginPw", AesEncryption.aesEncodeBuf(encrypted));

		// Promoter_tbl
		staffDAO.insertPromoter_tbl(commandMap);

		// PromoterValue_tbl
		staffDAO.insertPromoterValue_tbl(commandMap);

		// PromoterValueLog_tbl
		commandMap.put("pvlRemark", "신규 회원가입");
		staffDAO.insertPromoterValueLog_tbl(commandMap);

		// PromoterSpecialty_tbl
		staffDAO.insertPromoterSpecialty_tbl(commandMap);

		// PromoterLicense_tbl
		staffDAO.insertPromoterLicense_tbl(commandMap);

		// PromoterChannel_tbl
		commandMap.put("pmtChannelMember", 0);
		commandMap.put("pmtChannelDaillyVisit", 0);
		staffDAO.insertPromoterChannel_tbl(commandMap);

		// PromoterAccount_tbl
		staffDAO.insertPromoterAccount_tbl(commandMap);
	}

	public boolean selectOnePmtLoginIdCheck(String stfLoginId) throws Exception{
		return staffDAO.selectOnePmtLoginIdCheck(stfLoginId) == 0 ? true : false;
	}

	@Override
	public Map<String, Object> selectPmtView(String promoter_id) {
		return staffDAO.selectPmtView(promoter_id);
	}

	@Override
	public Map<String, Object> updatePmtForm(CommandMap commandMap) {
		return staffDAO.updatePmtForm(commandMap);
	}

	@Transactional
	@Override
	public void updatePmt(CommandMap commandMap) {

		// Promoter_tbl
		staffDAO.updatePromoter_tbl(commandMap);

		// PromoterValue_tbl 보류
//		staffDAO.updatePromoterValue_tbl(commandMap);

		// PromoterValueLog_tbl
		commandMap.put("pvlRemark", "프로모터 회원 정보 수정");
		staffDAO.insertPromoterValueLog_tbl(commandMap);

		// PromoterSpecialty_tbl, TODO : 프로모터 전문분야 업데이트 보류
//		staffDAO.updatePromoterSpecialty_tbl(commandMap);

		// PromoterLicense_tbl
		staffDAO.updatePromoterLicense_tbl(commandMap);

		// PromoterChannel_tbl
		staffDAO.updatePromoterChannel_tbl(commandMap);

		// PromoterAccount_tbl
		staffDAO.updatePromoterAccount_tbl(commandMap);
	}

	@Transactional
	@Override
	public boolean updatePmtPassword(CommandMap commandMap) throws IOException {
		String pmtLoginPw = (String) commandMap.get("pmtLoginPw");
		String pmtLoginPw2 = (String) commandMap.get("pmtLoginPw2");

		// 신규 비밀번호와 재입력한 비밀번호가 일치한지 재확인
		boolean chkUpdate = pmtLoginPw.equals(pmtLoginPw2) ? true : false;

		if(chkUpdate){
			// AES/CBC/IV 암호화 (키,암호화텍스트,iv)
			byte[] encrypted = AesEncryption.aesEncryptCbc(AesEncryption.sKey, pmtLoginPw, AesEncryption.sInitVector);
			// 암호화된 값이 String으로 반환
			commandMap.put("pmtLoginPw", AesEncryption.aesEncodeBuf(encrypted));

			staffDAO.updatePmtPassword(commandMap);
			chkUpdate = true;

			// PromoterValueLog_tbl, TODO : 예외처리 객체를 만들어서 로그처리 필요함
			commandMap.put("pvlRemark", "비밀번호 수정");
			staffDAO.insertPromoterValueLog_tbl(commandMap);
		}

		return chkUpdate;
	}
}