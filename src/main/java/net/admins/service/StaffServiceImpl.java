package net.admins.service;

import java.io.IOException;
import java.util.HashMap;
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

		// PromoterSpecialty_tbl, 전문분야를 체크 했을 때만 쿼리를 실행
		if(commandMap.get("pmtSpecialtyName") != null){
			staffDAO.insertPromoterSpecialty_tbl(commandMap);
		}

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
		Map<String, Object> resultMap = staffDAO.selectPmtView(promoter_id);
		// 프로모터 전문 분야는 N row가 나오기 때문에 별도로 조회
		resultMap.put("pmtSpecialtyNames", staffDAO.selectPmtSpecialtyNames(promoter_id));
		return resultMap;
	}

	@Override
	public Map<String, Object> updatePmtForm(String promoter_id) {
		Map<String, Object> resultMap = staffDAO.updatePmtForm(promoter_id);
		// 프로모터 전문 분야는 N row가 나오기 때문에 별도로 조회
		resultMap.put("pmtSpecialtyNames", staffDAO.selectPmtSpecialtyNames(promoter_id));
		return resultMap;
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

		// PromoterSpecialty_tbl, 체크했을때만 쿼리를 실행함
		staffDAO.deletePromoterSpecialty_tbl((String) commandMap.get("promoter_id"));
		// 이 테이블의 경우 DELETE -> INSERT 방식으로 업데이트를 진행
		if(commandMap.get("pmtSpecialtyName") != null){
			staffDAO.insertPromoterSpecialty_tbl(commandMap);
		}

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

	@Transactional
	@Override
	public void leavePmt(CommandMap commandMap) {

		// PromoterValue_tbl -> pmtLeaveDt
		staffDAO.leavePmt(commandMap);

		// PromoterValueLog_tbl
		commandMap.put("pvlRemark", "관리자 -> 프로모터 탈퇴");
		staffDAO.insertPromoterValueLog_tbl(commandMap);
	}
}