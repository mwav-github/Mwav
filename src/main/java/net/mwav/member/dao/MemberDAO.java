package net.mwav.member.dao;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.crypto.IllegalBlockSizeException;

import net.common.common.AesTest;
import net.common.common.Common_Util;
import net.common.dao.AbstractDAO;

import org.springframework.stereotype.Repository;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

@Repository("memberDAO")
public class MemberDAO extends AbstractDAO {

	byte[] decrypted = null;
	byte[] encrypted = null;

	// Abstrat로 변경

	/*
	 * ========================================등록================================
	 * ========
	 */

	public Map<String, Object> insertMbrForm(Map<String, Object> map) {
		// TODO Auto-generated method stub

		try {
			/*
			 * String sKey = "ABC"; String sInitVector = "123가나다";
			 */
			// byte[] encrypted = null;

			String b_mbrLoginPw = (String) map.get("mbrLoginPw");
			System.out.println("* AES/CBC/IV");
			System.out.println("b_mbrLoginPw=" + b_mbrLoginPw);
			System.out.println("    - KEY : " + AesTest.sKey);
			System.out.println("    - IV : " + AesTest.sInitVector);
			System.out.println("    - TEXT : " + b_mbrLoginPw);

			// AES/CBC/IV 암호화
			encrypted = AesTest.aesEncryptCbc(AesTest.sKey, b_mbrLoginPw,
					AesTest.sInitVector);
			String sBase = AesTest.aesEncodeBuf(encrypted);

			// String b2_mbrLoginPw = AesTest.toHexString(encrypted);
			System.out.println("    - TEXT2 : " + sBase);

			map.put("mbrLoginPw", sBase);
			if (encrypted == null) {
				System.out.println("    - Encrypted : ERROR!!!");
			} else {
				System.out.println("    - Encrypted : " + sBase);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		Map<String, Object> imsimap = (Map<String, Object>) selectOne(
				"member.selectNextPk", map);
		// map을 위에서 써버리면 그 다음 쿼리시 null 값 나온다. !! (가져오는값이라?)
		String m_pk = String.valueOf(imsimap.get("member_id"));
		System.out.println("m_pk" + m_pk);
		map.put("member_id", m_pk);
		insert("member.insertMbrForm", map); // Membertbl

		// Insert
		insert("member.insertMemberValue_tbl", map); // Membertbl Insert

		return null;
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
	public boolean updateMbrLoginPw(Map<String, Object> map) throws IOException {
		// TODO Auto-generated method stub
		boolean flag;
		String b_mbrLoginPw = (String) map.get("mbrLoginPw");
		System.out.println("* AES/CBC/IV");
		System.out.println("b_mbrLoginPw=" + b_mbrLoginPw);
		System.out.println("    - KEY : " + AesTest.sKey);
		System.out.println("    - IV : " + AesTest.sInitVector);
		System.out.println("    - TEXT : " + b_mbrLoginPw);

		// AES/CBC/IV 암호화
		encrypted = AesTest.aesEncryptCbc(AesTest.sKey, b_mbrLoginPw,
				AesTest.sInitVector);
		String sBase = AesTest.aesEncodeBuf(encrypted);

		// String b2_mbrLoginPw = AesTest.toHexString(encrypted);
		System.out.println("    - TEXT2 : " + sBase);

		map.put("mbrLoginPw", sBase);
		if (encrypted == null) {
			System.out.println("    - Encrypted : ERROR!!!");
		} else {
			System.out.println("    - Encrypted : " + sBase);
		}

		int imsiflag = (int) update("member.updateMbrLoginPw", map);
		if (imsiflag == 1) {
			System.out.println("성공");
			flag = true;
		} else {
			System.out.println("실패");
			flag = true;
		}

		return flag;
	}

	

	public boolean updateMbrTempLoginPw(Map<String, Object> map) {
		// TODO Auto-generated method stub
		Common_Util rndStr = new Common_Util();
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
		// TODO Auto-generated method stub
		boolean check;
		System.out.println("값이?="
				+ selectOne("member.selectOneMbrLoginIdCheck", mbrLoginId));
		if (selectOne("member.selectOneMbrLoginIdCheck", mbrLoginId) == null) {
			check = false; // 아이디가 없는 경우
		} else {
			check = true; // 아이디가 있는 경우
		}

		return check;
	}

	public String selectOneMbrLoginIdSeek(Map<String, Object> map) {
		// TODO Auto-generated method stub
		String mbrLoginId;
		Map<String, Object> imsimap = (Map<String, Object>) selectOne(
				"member.selectOneMbrLoginIdSeek", map);
		mbrLoginId = (String) imsimap.get("mbrLoginId");

		return mbrLoginId;
	}
	

	public boolean selectOneMbrTempLoginPwSeek(Map<String, Object> map) {
		// TODO Auto-generated method stub
		String imsiCheck = (String) selectOne("member.selectOneMbrTempLoginPwSeek", map);
		boolean check;
		if (imsiCheck == null) {
			check = false;
		} else {
			check = true;
		}

		return check;
	}
	
	/*========================================삭제========================================*/
	
	@SuppressWarnings("unchecked")
	public boolean deleteMbrDelete(Map<String, Object> map) {
		// TODO Auto-generated method stub
		String b_mbrLoginPw = (String) map.get("mbrLoginPw");
		System.out.println("* AES/CBC/IV");
		System.out.println("b_mbrLoginPw=" + b_mbrLoginPw);
		System.out.println("    - KEY : " + AesTest.sKey);
		System.out.println("    - IV : " + AesTest.sInitVector);
		System.out.println("    - TEXT : " + b_mbrLoginPw);

		// AES/CBC/IV 암호화
		encrypted = AesTest.aesEncryptCbc(AesTest.sKey, b_mbrLoginPw,
				AesTest.sInitVector);
		String sBase = null;
		try {
			sBase = AesTest.aesEncodeBuf(encrypted);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// String b2_mbrLoginPw = AesTest.toHexString(encrypted);
		System.out.println("    - TEXT2 : " + sBase);

		map.put("mbrLoginPw", sBase);
		if (encrypted == null) {
			System.out.println("    - Encrypted : ERROR!!!");
		} else {
			System.out.println("    - Encrypted : " + sBase);
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
	public List<String> selectGunguFinder(String sido) {
		// TODO Auto-generated method stub

		return (List<String>) selectList("member.selectGunguFinder", sido);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectpostList_2(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) selectList(
				"member.selectpostList_2", map);
	}


	@SuppressWarnings("unchecked")
	public Map<String, Object> selectLogin(Map<String, Object> map)
			throws IOException {
		// TODO Auto-generated method stub
		byte[] decrypted = null;
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
			byte[] b_decrypted = AesTest.aesDecodeBuf(Decrypt_mbrLoginPw);
			decrypted = AesTest.aesDecryptCbc(AesTest.sKey, b_decrypted,
					AesTest.sInitVector);
			String decrypted1 = null;
			decrypted1 = new String(decrypted);
			System.out.println("decrypted1=" + decrypted1);

			System.out.println("?");

			System.out.println("mbrLeaveDt =" + mbrLeaveDt);

			SimpleDateFormat sdfCurrent = new SimpleDateFormat();

			mbrLeaveDt = sdfCurrent.format(memberLogin.get("mbrLeaveDt")); // java.sql.Timestamp
																			// cannot
																			// be
																			// cast
																			// to
																			// java.lang.String
			System.out.println("mbrLeaveDt =" + mbrLeaveDt);
			if (mbrLeaveDt != null) {
				System.out.println("탈퇴한 회원?");
				memberLogin.put("logincheck", 7);
			} else {

				memberLogin.put("logincheck", 6);
				memberLogin.put("mbrLoginPw", decrypted1);
			}

		} catch (Exception e) {
			if (memberLogin != null) {
				// 보통 null 포인터 Exception 뜬 경우.
				memberLogin.put("logincheck", 5);
			}
		}

		// Convert Map to byte array
		/*
		 * ByteArrayOutputStream byteOut = new ByteArrayOutputStream();
		 * ObjectOutputStream out = new ObjectOutputStream(byteOut);
		 * out.writeObject(memberLogin.get("mbrLoginPw"));
		 */

		// http://linuxism.tistory.com/1089

		// new String(decrypted, "UTF-8");

		return memberLogin;
	}

}
