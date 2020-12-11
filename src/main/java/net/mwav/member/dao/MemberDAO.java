package net.mwav.member.dao;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import net.common.dao.AbstractDAO;
import net.mwav.common.module.AesEncryption;
import net.mwav.common.module.Common_Utils;
import net.mwav.common.module.SecurityLib;
import net.mwav.member.vo.Member_tbl_VO;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository("memberDAO")
public class MemberDAO extends AbstractDAO {

	byte[] decrypted = null;
	String encrypted = null;

	Common_Utils cu = new Common_Utils();

	// Abstrat로 변경

	/*
	 * ========================================등록================================
	 * ========
	 */
	public int insertMbrForm(Map<String, Object> map) throws Exception {
		return (int) insert("member.insertMbrForm", map);
		
	}
	
	public int insertMemberValue_tbl(Map<String, Object> map) throws Exception {
		return (int) insert("member.insertMemberValue_tbl", map);
	}

	/*
	 * ========================================보기================================
	 * ========
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMbrView(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("member.selectMbrView", map);
	}

	/*
	 * ========================================수정================================
	 * ========
	 */

	@SuppressWarnings("unchecked")
	public Map<String, Object> updateMbrForm(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("member.updateMbrForm", map);
	}

	@SuppressWarnings("unchecked")
	public int updateMbrRecLoginDt(int member_id) {
		return (int) update("member.updateMbrRecLoginDt", member_id);
	}

	public void updateProMbrform(Map<String, Object> map) {
		// TODO Auto-generated method stub
		update("member.updateProMbrform", map);
	}

	@SuppressWarnings("unchecked")
	public boolean updateMbrLoginPwTmp(Map<String, Object> map) throws IOException {
		// TODO Auto-generated method stub

		boolean flag = true;
		try {

			String b_mbrLoginPw = (String) map.get("mbrLoginPw");
			System.out.println("* AES/CBC/IV");
			System.out.println("b_mbrLoginPw=" + b_mbrLoginPw);
			System.out.println("    - KEY : " + AesEncryption.sKey);
			System.out.println("    - IV : " + AesEncryption.sInitVector);
			System.out.println("    - TEXT : " + b_mbrLoginPw);

			// AES/CBC/IV 암호화
			encrypted = SecurityLib.getInstance().encryptToString(AesEncryption.sKey, AesEncryption.sInitVector, b_mbrLoginPw);	

			// String b2_mbrLoginPw = AesTest.toHexString(encrypted);
			System.out.println("    - TEXT2 : " + encrypted);

			map.put("hope_mbrLoginPw", encrypted);
			if (encrypted == null) {
				System.out.println("    - Encrypted : ERROR!!!");
			} else {
				System.out.println("    - Encrypted : " + encrypted);
			}
			// 이전 pw워드와 동일한것으로 바뀌었는지 여부
			String before_mbrLoginPw = (String) selectOne(
					"member.selectMbrLoginPw", map);
			System.out.println("이전" + before_mbrLoginPw);
			System.out.println("입력" + encrypted);
			if (before_mbrLoginPw.equals(encrypted)) {
				// 이전비밀번호 입력과 동일하다.
				// 1차로 거르는거
				flag = false;
			} else {

				// 2차로 동일조건으로 거르는거
				int imsiflag = (int) update("member.updateMbrLoginPw", map);
				if (imsiflag == 1) {
					System.out.println("성공");
					flag = true;
				} else {
					System.out.println("실패");
					flag = true;
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}

	public boolean updateMbrTempLoginPw(Map<String, Object> map) {
		// TODO Auto-generated method stub
		Common_Utils rndStr = new Common_Utils();
		String mbrTempLoginPw = rndStr.getString(20, ""); // 15 -> 20으로 변경
															// (150926)
		System.out.println("임시pw=" + mbrTempLoginPw);
		map.put("mbrTempLoginPw", mbrTempLoginPw);
		boolean flag;

		// update의 결과는 Integer
		int imsiflag = (int) update("member.updateMbrTempLoginPw", map);
		if (imsiflag == 1) {
			System.out.println("성공");
			flag = true;
		} else {
			System.out.println("실패");
			flag = true;
		}

		return flag;
	}

	/*
	 * ========================================리스트(SelectOne, SelectList
	 * 순)========================================
	 */
	public boolean selectOneMbrLoginIdCheck(String mbrLoginId) {
		return selectOne("member.selectOneMbrLoginIdCheck", mbrLoginId) == null ? true : false;
	}

	public List<String> selectOneMbrLoginIdSeek(Map<String, Object> map) {
		// TODO Auto-generated method stub
		List<String> mbrLoginId = null;
		List<String> imsimap = (List<String>) selectList("member.selectListMbrLoginIdSeek", map);

		/*
		 * if(imsimap == null) { mbrLoginId = null; } else{ mbrLoginId =
		 * (List<String>) imsimap.get("mbrLoginId"); }
		 */
		return imsimap;
	}

	public String selectOneMbrLoginPWSeek(Map<String, Object> map) {
		// TODO Auto-generated method stub
		String mbrLoginPw = null;
		Map<String, Object> imsimap = (Map<String, Object>) selectOne(
				"member.selectOneMbrLoginPWSeek", map);

		if (imsimap == null) {
			mbrLoginPw = null;
		} else {
			mbrLoginPw = (String) imsimap.get("mbrLoginPw");
		}
		return mbrLoginPw;
	}

	public boolean selectOneMbrTempLoginPwSeek(Map<String, Object> map) {
		// TODO Auto-generated method stub
		String imsiCheck = (String) selectOne(
				"member.selectOneMbrTempLoginPwSeek", map);
		boolean check;
		if (imsiCheck == null) {
			check = false;
		} else {
			check = true;
		}

		return check;
	}

	/*
	 * ========================================삭제================================
	 * ========
	 */

	@SuppressWarnings("unchecked")
	public boolean deleteMbrDelete(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		String b_mbrLoginPw = (String) map.get("mbrLoginPw");
		System.out.println("* AES/CBC/IV");
		System.out.println("b_mbrLoginPw=" + b_mbrLoginPw);
		System.out.println("    - KEY : " + AesEncryption.sKey);
		System.out.println("    - IV : " + AesEncryption.sInitVector);
		System.out.println("    - TEXT : " + b_mbrLoginPw);

		// AES/CBC/IV 암호화
		encrypted = SecurityLib.getInstance().encryptToString(AesEncryption.sKey, AesEncryption.sInitVector, b_mbrLoginPw);	

		// String b2_mbrLoginPw = AesTest.toHexString(encrypted);
		System.out.println("    - TEXT2 : " + encrypted);

		map.put("mbrLoginPw", encrypted);
		if (encrypted == null) {
			System.out.println("    - Encrypted : ERROR!!!");
		} else {
			System.out.println("    - Encrypted : " + encrypted);
		}

		int imsiflag = (int) update("member.deleteMbrDelete", map);
		boolean flag;
		if (imsiflag == 1) {
			System.out.println("탈퇴성공");
			flag = true;
		} else {
			System.out.println("탈퇴실패");
			flag = true;
		}
		return flag;
	}

	@SuppressWarnings("unchecked")
	public List<String> selectListZcGunGuSeek(String zcSiDoName) {
		// TODO Auto-generated method stub

		return (List<String>) selectList("member.selectListZcGunGuSeek",
				zcSiDoName);
	}

	// @SuppressWarnings({ "unchecked", "null" })
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectListZcAll(Map<String, Object> map) {
		// TODO Auto-generated method stub

		List<Map<String, Object>> selectListZcAll = null;

		/*
		 * String zcRoadName = null; zcRoadName = (String)
		 * map.get("zcRoadName"); System.out.println("zcRoadName"+zcRoadName);
		 * 
		 * String zcLegalEupMyeonDongName = null; zcLegalEupMyeonDongName =
		 * (String) map.get("zcLegalEupMyeonDongName");
		 * System.out.println("zcLegalEupMyeonDongName"
		 * +zcLegalEupMyeonDongName);
		 * 
		 * String zcBuildingBook = null; zcBuildingBook = (String)
		 * map.get("zcBuildingBook");
		 * System.out.println("zcBuildingBook"+zcBuildingBook);
		 */

		/*
		 * if (zcRoadName != null) { selectListZcAll =
		 * selectList("member.post_zcRoadName", map);
		 * System.out.println("zcRoadName"); } else if (zcLegalEupMyeonDongName
		 * != null){ selectListZcAll =
		 * selectList("member.post_zcLegalEupMyeonDongName", map);
		 * System.out.println("zcLegalEupMyeonDongName"); } else if
		 * (zcBuildingBook != null){ selectListZcAll =
		 * selectList("member.post_zcBuildingBook", map);
		 * System.out.println("zcBuildingBook"); }
		 */

		String post_mode = null;
		post_mode = (String) map.get("post_mode");
		/*
		 * map = new HashMap<String, Object>(); map.put("post_mode", post_mode);
		 * System.out.println("post_mode"+post_mode); selectListZcAll.add(map);
		 */
		if (post_mode.equals("post_zcRoadName")) {
			selectListZcAll = selectList("member.post_zcRoadName", map);
		} else if (post_mode.equals("post_zcLegalEupMyeonDongName")) {
			selectListZcAll = selectList("member.post_zcLegalEupMyeonDongName",
					map);
		} else if (post_mode.equals("post_post_zcBuildingBook")) {
			selectListZcAll = selectList("member.post_zcBuildingBook", map);
		}

		return selectListZcAll;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public Map<String, Object> selectLogin(Map<String, Object> map)
			throws IOException {
		// TODO Auto-generated method stub
		String decrypted = null;
		// (Map<String, Object>) selectOne("member.selectLogin", map)
		int logincheck; // loginCheck = 0 로그인 안됨 //loginCheck=1 로그인

		// 디비 다녀오기 전 값
		String mbrLoginPw = (String) map.get("mbrLoginPw");
		Map<String, Object> memberLogin = null;

		memberLogin = (Map<String, Object>) selectOne("member.selectLogin", map);
		System.out.println("memberLogin=" + memberLogin);
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

			System.out.println("?");

			System.out.println("mbrLeaveDt =" + mbrLeaveDt);

			SimpleDateFormat sdfCurrent = new SimpleDateFormat();
			memberLogin.put("mbrLoginPw", decrypted);
			mbrLeaveDt = sdfCurrent.format(memberLogin.get("mbrLeaveDt")); // java.sql.Timestamp
																			// cannot
																			// be
			// new String(decrypted, "UTF-8");
			if (memberLogin != null) {

				if (updateMbrRecLoginDt((int) memberLogin.get("member_id")) == 1)
					log.info("최근로그인날 반영성공");
				else
					log.info("최근로그인날 반영실패");
			} // cast
			// to
			// java.lang.String
			System.out.println("mbrLeaveDt =" + mbrLeaveDt);
			if (mbrLeaveDt != null) {
				System.out.println("탈퇴한 회원?");
				memberLogin.put("loginCheck", 7);

				System.out.println("탈퇴");
			} else {

				memberLogin.put("loginCheck", 6);
				System.out.println("탈퇴 x");
			}
			// http://linuxism.tistory.com/1089

		} catch (Exception e) {
			if (memberLogin != null) {
				// 보통 null 포인터 Exception 뜬 경우.
				memberLogin.put("loginCheck", 5);
				
				if (updateMbrRecLoginDt((int) memberLogin.get("member_id")) == 1)
					log.info("최근로그인날 반영성공");
				else
					log.info("최근로그인날 반영실패");
			}
		}

		// Convert Map to byte array
		/*
		 * ByteArrayOutputStream byteOut = new ByteArrayOutputStream();
		 * ObjectOutputStream out = new ObjectOutputStream(byteOut);
		 * out.writeObject(memberLogin.get("mbrLoginPw"));
		 */

		return memberLogin;
	}

	public Map<String, Object> insertSnsForm(Map<String, Object> map) {
		// TODO Auto-generated method stub

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

	public String selectOneMemberPkCheck() {
		// TODO Auto-generated method stub
		Map<String, Object> memberid = (Map<String, Object>) selectOne("member.selectNextPk");

		String member_id = String.valueOf(memberid.get("member_id"));
		return member_id;
	}

	public String selectOneSmMemberPkCheck(String smMember_id) {
		// TODO Auto-generated method stub
		return smMember_id = (String) selectOne(
				"member.selectOneSmMemberPkCheck", smMember_id);
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
		Member_tbl_VO member = (Member_tbl_VO) selectOne(
				"member.selectAutoLogin", member_id);
		if (member != null) {
			if (updateMbrRecLoginDt(member_id) == 1)
				log.info("최근로그인날 반영성공");
			else
				log.info("최근로그인날 반영실패");
			return member;
		} else {
			System.out.println("가져온 멤버 값이 비어있습니다");
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

	public int insertMemberOption_tbl(Map<String, Object> map) {
		return (int) insert("member.insertMemberOption_tbl", map);
	}

	public int insertMemberJob_tbl(Map<String, Object> map) {
		return (int) insert("member.insertMemberJob_tbl", map);
	}
}
