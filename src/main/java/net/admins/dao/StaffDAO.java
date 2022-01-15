package net.admins.dao;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import net.admins.vo.Staff_VO;
import net.common.dao.AbstractDAO;
import net.mwav.common.module.AesEncryption;

@Repository
@SuppressWarnings("unchecked")
public class StaffDAO extends AbstractDAO {

	public int selectNextStfPk() {
		return (int) selectOne("staff.selectNextStfPk");
	}

	public boolean selectOneStfLoginIdCheck(String stfLoginId) {
		boolean check;
		if (selectOne("staff.selectOneStfLoginIdCheck", stfLoginId) == null) {
			check = false; // 아이디가 없는 경우
		} else {
			check = true; // 아이디가 있는 경우
		}
		return check;
	}

	@Transactional
	public void insertStfForm(Map<String, Object> map) {
		try {

			String b_stfLoginPw = (String) map.get("stfLoginPw");

			// AES/CBC/IV 암호화 (키,암호화텍스트,iv)
			byte[] encrypted = AesEncryption.aesEncryptCbc(AesEncryption.sKey, b_stfLoginPw, AesEncryption.sInitVector);

			// 암호화된 값이 String으로 반환
			String sBase = AesEncryption.aesEncodeBuf(encrypted);

			map.put("stfLoginPw", sBase);
		} catch (Exception e) {
			e.printStackTrace();
		}

		insert("staff.insertStfForm", map);
	}

	public int selectOneGetTotalCount() {
		return (int) selectOne("staff.selectOneGetTotalCount");
	}

	public Map<String, Object> updateStfForm(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("staff.updateStfForm", map);
	}

	public void updateProStfForm(Map<String, Object> map) {
		update("staff.updateProStfForm", map);
	}

	public Map<String, Object> selectStfView(Map<String, Object> map) {
		byte[] decrypted = null;

		// 디비 다녀오기 전 값
		Map<String, Object> selectStfView = null;

		selectStfView = (Map<String, Object>) selectOne("staff.selectStfView", map);

		String Decrypt_stfLoginPw = null;
		try {
			Decrypt_stfLoginPw = (String) selectStfView.get("stfLoginPw");

			// 복호화 전 암호화된 값 바이트 배열로 변경
			byte[] b_decrypted = AesEncryption.aesDecodeBuf(Decrypt_stfLoginPw);

			// 복호화 메소드 (키, 복호화대상, iv)
			decrypted = AesEncryption.aesDecryptCbc(AesEncryption.sKey, b_decrypted, AesEncryption.sInitVector);
			String decrypted1 = null;
			decrypted1 = new String(decrypted);

			selectStfView.put("stfLoginPw", decrypted1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return selectStfView;
	}

	public List<Map<String, Object>> selectListStfList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("staff.selectListStfList", map);
	}

	public Staff_VO selectStfLogin(Map<String, Object> map) {
		/*
		 * 현재 방식은 아이디 패스워드를 둘다 비교하는것이 아닌 아이디만 비교하고 패스워드는 암호화해서 아에 들어가는것이 아닌 db 후
		 * 복호화해서 비교하는 형식으로 가고 있다.
		 * 
		 * >>
		 * 
		 * 프로세스 변경이 필요 1안) 현행유지 (아이디 없음은 null 제외 제일 아닐때 값으로 진행) 2안) logincheck 값
		 * 한쪽으로 몰아넣기 + 정의 필요.
		 */

		byte[] decrypted = null;

		// 디비 다녀오기 전 값
		Staff_VO selectStfLogin = null;

		selectStfLogin = (Staff_VO) selectOne("staff.selectStfLogin", map);
		// 디비 다녀와서 온 값

		// 아래와 같이 미리 선언해줘야지 에러가 x
		String Decrypt_stfLoginPw = null;
		String stfDeleteDt = null;
		try {
			Decrypt_stfLoginPw = (String) selectStfLogin.getStfLoginPw();

			// 복호화 전 암호화된 값 바이트 배열로 변경
			byte[] b_decrypted = AesEncryption.aesDecodeBuf(Decrypt_stfLoginPw);

			// 복호화 메소드 (키, 복호화대상, iv)
			decrypted = AesEncryption.aesDecryptCbc(AesEncryption.sKey, b_decrypted, AesEncryption.sInitVector);
			String decrypted1 = null;
			decrypted1 = new String(decrypted);
			SimpleDateFormat sdfCurrent = new SimpleDateFormat();

			selectStfLogin.setStfLoginPw(decrypted1);
			stfDeleteDt = sdfCurrent.format(selectStfLogin.getStfDeleteDt()); // java.sql.Timestamp

			if (stfDeleteDt != null) {
				selectStfLogin.setStfLoginCheck(7);
			} else {
				selectStfLogin.setStfLoginCheck(6);
			}

		} catch (Exception e) {
			if (Decrypt_stfLoginPw != null) {
				selectStfLogin.setStfLoginCheck(5);
			}
		}

		return selectStfLogin;
	}

	public int insertStfRegist(Map<String, Object> map) {
		return (int) insert("staff.insrtStfRegist", map);
	}

}
