package net.mwav.member.dao;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import net.common.dao.AbstractDAO;
import net.mwav.common.module.AesEncryption;
import net.mwav.common.module.Common_Utils;
import net.mwav.common.module.SecurityLib;
import net.mwav.member.vo.Member_tbl_VO;

@Repository
@SuppressWarnings("unchecked")
public class MemberDAO extends AbstractDAO {

	private static final Logger logger = LoggerFactory.getLogger(MemberDAO.class);

	Common_Utils cu = new Common_Utils();

	/**
	 * 등록
	 */
	public int insertMbrForm(Map<String, Object> map) throws Exception {
		return (int) insert("member.insertMbrForm", map);
	}

	public int insertMemberValue(Map<String, Object> map) throws Exception {
		return (int) insert("member.insertMemberValue", map);
	}

	/**
	 * 보기
	 */
	public Map<String, Object> selectMbrView(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("member.selectMbrView", map);
	}

	/**
	 * 수정
	 */
	public Map<String, Object> updateMbrForm(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("member.updateMbrForm", map);
	}

	public int updateMbrRecLoginDt(int member_id) {
		return (int) update("member.updateMbrRecLoginDt", member_id);
	}

	public void updateProMbrform(Map<String, Object> map) {
		update("member.updateProMbrform", map);
	}

	public boolean updateMbrLoginPwTmp(Map<String, Object> map) throws IOException {
		boolean flag = true;
		try {

			String b_mbrLoginPw = (String) map.get("mbrLoginPw");

			// AES/CBC/IV 암호화
			String encrypted = SecurityLib.getInstance().encryptToString(AesEncryption.sKey, AesEncryption.sInitVector, b_mbrLoginPw);

			map.put("hope_mbrLoginPw", encrypted);
			// 이전 pw워드와 동일한것으로 바뀌었는지 여부
			String before_mbrLoginPw = (String) selectOne("member.selectMbrLoginPw", map);
			if (before_mbrLoginPw.equals(encrypted)) {
				flag = false;
			} else {

				// 2차로 동일조건으로 거르는거
				int imsiflag = (int) update("member.updateMbrLoginPw", map);
				if (imsiflag == 1) {
					flag = true;
				} else {
					flag = true;
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}

	public boolean updateMbrTempLoginPw(Map<String, Object> map) {
		Common_Utils rndStr = new Common_Utils();
		String mbrTempLoginPw = rndStr.getString(20, "");
		map.put("mbrTempLoginPw", mbrTempLoginPw);
		boolean flag;

		// update의 결과는 Integer
		int imsiflag = (int) update("member.updateMbrTempLoginPw", map);
		if (imsiflag == 1) {
			flag = true;
		} else {
			flag = true;
		}

		return flag;
	}

	public boolean selectOneMbrLoginIdCheck(String mbrLoginId) {
		return selectOne("member.selectOneMbrLoginIdCheck", mbrLoginId) == null ? true : false;
	}

	public List<String> selectOneMbrLoginIdSeek(Map<String, Object> map) {
		List<String> imsimap = (List<String>) selectList("member.selectListMbrLoginIdSeek", map);

		return imsimap;
	}

	public String selectOneMbrLoginPWSeek(Map<String, Object> map) {
		String mbrLoginPw = null;
		Map<String, Object> imsimap = (Map<String, Object>) selectOne("member.selectOneMbrLoginPWSeek", map);

		if (imsimap == null) {
			mbrLoginPw = null;
		} else {
			mbrLoginPw = (String) imsimap.get("mbrLoginPw");
		}
		return mbrLoginPw;
	}

	public boolean selectOneMbrTempLoginPwSeek(Map<String, Object> map) {
		String imsiCheck = (String) selectOne("member.selectOneMbrTempLoginPwSeek", map);
		boolean check;
		if (imsiCheck == null) {
			check = false;
		} else {
			check = true;
		}

		return check;
	}

	/**
	 * 삭제
	 */
	public boolean deleteMbrDelete(Map<String, Object> map) throws Exception {
		String b_mbrLoginPw = (String) map.get("mbrLoginPw");

		// AES/CBC/IV 암호화
		String encrypted = SecurityLib.getInstance().encryptToString(AesEncryption.sKey, AesEncryption.sInitVector, b_mbrLoginPw);

		map.put("mbrLoginPw", encrypted);

		int imsiflag = (int) update("member.deleteMbrDelete", map);
		boolean flag;
		if (imsiflag == 1) {
			flag = true;
		} else {
			flag = true;
		}
		return flag;
	}

	public List<String> selectListZcGunGuSeek(String zcSiDoName) {
		return (List<String>) selectList("member.selectListZcGunGuSeek", zcSiDoName);
	}

	public List<Map<String, Object>> selectListZcAll(Map<String, Object> map) {
		List<Map<String, Object>> selectListZcAll = null;

		String post_mode = null;
		post_mode = (String) map.get("post_mode");
		if (post_mode.equals("post_zcRoadName")) {
			selectListZcAll = selectList("member.post_zcRoadName", map);
		} else if (post_mode.equals("post_zcLegalEupMyeonDongName")) {
			selectListZcAll = selectList("member.post_zcLegalEupMyeonDongName", map);
		} else if (post_mode.equals("post_post_zcBuildingBook")) {
			selectListZcAll = selectList("member.post_zcBuildingBook", map);
		}

		return selectListZcAll;
	}

	@Transactional
	public Map<String, Object> selectLogin(Map<String, Object> map) throws IOException {
		String decrypted = null;

		// 디비 다녀오기 전 값
		Map<String, Object> memberLogin = null;

		memberLogin = (Map<String, Object>) selectOne("member.selectLogin", map);
		// 디비 다녀와서 온 값

		// 아래와 같이 미리 선언해줘야지 에러가 x
		String Decrypt_mbrLoginPw = null;
		String mbrLeaveDt = null;
		try {
			Decrypt_mbrLoginPw = (String) memberLogin.get("mbrLoginPw");

			// 복호화 전 암호화된 값 바이트 배열로 변경

			//byte[] b_decrypted = AesEncryption.aesDecodeBuf(Decrypt_mbrLoginPw);

			// 복호화 메소드 (키, 복호화대상, iv)
			decrypted = SecurityLib.getInstance().decryptToString(AesEncryption.sKey, AesEncryption.sInitVector, Decrypt_mbrLoginPw);

			SimpleDateFormat sdfCurrent = new SimpleDateFormat();
			memberLogin.put("mbrLoginPw", decrypted);
			mbrLeaveDt = sdfCurrent.format(memberLogin.get("mbrLeaveDt"));
			if (memberLogin != null) {

				if (updateMbrRecLoginDt((int) memberLogin.get("member_id")) == 1) {
					logger.info("최근로그인날 반영성공");
				} else {
					logger.info("최근로그인날 반영실패");
				}
			}
			if (mbrLeaveDt != null) {
				memberLogin.put("loginCheck", 7);
			} else {
				memberLogin.put("loginCheck", 6);
			}

		} catch (Exception e) {
			if (memberLogin != null) {
				memberLogin.put("loginCheck", 5);

				if (updateMbrRecLoginDt((int) memberLogin.get("member_id")) == 1) {
					logger.info("최근로그인날 반영성공");
				} else {
					logger.info("최근로그인날 반영실패");
				}
			}
		}

		return memberLogin;
	}

	public Map<String, Object> insertSnsForm(Map<String, Object> map) {
		try {
			insert("member.insertSnsForm", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	public boolean selectOneSnsMbrLoginIdCheck(String fsmMember_id) {
		return selectOne("member.selectOneSnsMbrLoginIdCheck", fsmMember_id) == null ? false : true;
	}

	public String selectNextSnsPk() {
		Object pk = selectOne("member.selectNextSnsPk");
		return pk != null ? (String) pk : "1";
	}

	public String selectOneMemberPkCheck() {
		Map<String, Object> memberid = (Map<String, Object>) selectOne("member.selectNextPk");

		String member_id = String.valueOf(memberid.get("member_id"));
		return member_id;
	}

	public String selectOneSmMemberPkCheck(String smMember_id) {
		return smMember_id = (String) selectOne("member.selectOneSmMemberPkCheck", smMember_id);
	}

	// 오토로그인 체크되었을 시 오토로그인 날짜 업데이트
	public boolean updateAutoLogin(Map<String, Object> map) {
		if ((int) update("member.updateAutoLogin", map) == 1) {
			return true;
		} else {
			return false;
		}
	}

	//
	@Transactional
	public Member_tbl_VO selectAutoLogin(int member_id) {
		Member_tbl_VO member = (Member_tbl_VO) selectOne("member.selectAutoLogin", member_id);
		if (member != null) {
			if (updateMbrRecLoginDt(member_id) == 1) {
				logger.info("최근로그인날 반영성공");
			} else {
				logger.info("최근로그인날 반영실패");
			}

			return member;
		} else {
			return member;
		}
	}

	// 로그아웃 했을 시 오토로그인 날짜 데이터 삭제
	public boolean updateAutoLoginDel(int member_id) {
		if ((int) update("member.updateAutoLoginDel", member_id) == 1) {
			return true;
		} else {
			return false;
		}
	}

	public int insertMemberOption(Map<String, Object> map) {
		return (int) insert("member.insertMemberOption", map);
	}

	public int insertMemberJob(Map<String, Object> map) {
		return (int) insert("member.insertMemberJob", map);
	}
}
