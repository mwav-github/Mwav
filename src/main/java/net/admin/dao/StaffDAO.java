package net.admin.dao;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import net.common.dao.AbstractDAO;
import net.mwav.common.module.AesEncryption;

import org.springframework.stereotype.Repository;

@Repository("staffDAO")
public class StaffDAO extends AbstractDAO {

	byte[] decrypted = null;
	byte[] encrypted = null;

	// Abstrat로 변경

	/*
	 * ========================================등록================================
	 * ========
	 */

	public void insertStfForm(Map<String, Object> map) {
		// TODO Auto-generated method stub
		try {
			/*
			 * String sKey = "ABC"; String sInitVector = "123가나다";
			 */
			// byte[] encrypted = null;

			String b_stfLoginPw = (String) map.get("stfLoginPw");
			System.out.println("* AES/CBC/IV");
			System.out.println("b_stfLoginPw=" + b_stfLoginPw);
			System.out.println("    - KEY : " + AesEncryption.sKey); // Static
																		// 변수
			System.out.println("    - IV : " + AesEncryption.sInitVector); // Static
																			// 변수
			System.out.println("    - TEXT : " + b_stfLoginPw);

			// AES/CBC/IV 암호화 (키,암호화텍스트,iv)
			encrypted = AesEncryption.aesEncryptCbc(AesEncryption.sKey,
					b_stfLoginPw, AesEncryption.sInitVector);

			// 암호화된 값이 String으로 반환
			String sBase = AesEncryption.aesEncodeBuf(encrypted);

			// String b2_mbrLoginPw = AesTest.toHexString(encrypted);
			System.out.println("    - TEXT2 : " + sBase);

			map.put("stfLoginPw", sBase);
			if (encrypted == null) {
				System.out.println("    - Encrypted : ERROR!!!");
			} else {
				System.out.println("    - Encrypted : " + sBase); // 암호화된 String
																	// 값
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		insert("staff.insertStfForm", map);
	}

	public int selectOneGetTotalCount() {
		// TODO Auto-generated method stub
		return (int) selectOne("staff.selectOneGetTotalCount");
	}

	/*
	 * ========================================보기================================
	 * ========
	 */

	/*
	 * ========================================수정================================
	 * ========
	 */

	@SuppressWarnings("unchecked")
	public Map<String, Object> updateStfForm(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("staff.updateStfForm", map);
	}

	public Map<String, Object> selectStfView(Map<String, Object> map) {
		// TODO Auto-generated method stub
		byte[] decrypted = null;

		// 디비 다녀오기 전 값
		String stfLoginPw = (String) map.get("stfLoginPw");
		Map<String, Object> selectStfView = null;

		selectStfView = (Map<String, Object>) selectOne("staff.selectStfView",
				map);

		String Decrypt_stfLoginPw = null;
		String stfDeleteDt = null;
		try {
			Decrypt_stfLoginPw = (String) selectStfView.get("stfLoginPw");

			// 복호화 전 암호화된 값 바이트 배열로 변경
			byte[] b_decrypted = AesEncryption.aesDecodeBuf(Decrypt_stfLoginPw);

			// 복호화 메소드 (키, 복호화대상, iv)
			decrypted = AesEncryption.aesDecryptCbc(AesEncryption.sKey,
					b_decrypted, AesEncryption.sInitVector);
			String decrypted1 = null;
			decrypted1 = new String(decrypted);

			selectStfView.put("stfLoginPw", decrypted1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return selectStfView;
	}

	public Map<String, Object> selectStfLogin(Map<String, Object> map) {
		// TODO Auto-generated method stub

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
		// (Map<String, Object>) selectOne("member.selectLogin", map)
		int logincheck; // loginCheck = 0 로그인 안됨 //loginCheck=1 로그인

		// 디비 다녀오기 전 값
		String stfLoginPw = (String) map.get("stfLoginPw");
		Map<String, Object> selectStfLogin = null;

		selectStfLogin = (Map<String, Object>) selectOne(
				"staff.selectStfLogin", map);
		System.out.println("selectStfLogin=" + selectStfLogin);
		// 디비 다녀와서 온 값

		// 아래와 같이 미리 선언해줘야지 에러가 x
		String Decrypt_stfLoginPw = null;
		String stfDeleteDt = null;
		try {
			Decrypt_stfLoginPw = (String) selectStfLogin.get("stfLoginPw");

			// 복호화 전 암호화된 값 바이트 배열로 변경
			byte[] b_decrypted = AesEncryption.aesDecodeBuf(Decrypt_stfLoginPw);

			// 복호화 메소드 (키, 복호화대상, iv)
			decrypted = AesEncryption.aesDecryptCbc(AesEncryption.sKey,
					b_decrypted, AesEncryption.sInitVector);
			String decrypted1 = null;
			decrypted1 = new String(decrypted);
			System.out.println("decrypted1=" + decrypted1);

			System.out.println("?");

			System.out.println("stfDeleteDt =" + stfDeleteDt);

			SimpleDateFormat sdfCurrent = new SimpleDateFormat();
			selectStfLogin.put("stfLoginPw", decrypted1);
			stfDeleteDt = sdfCurrent.format(selectStfLogin.get("stfDeleteDt")); // java.sql.Timestamp
			// cannot
			// be
			// cast
			// to
			// java.lang.String

			System.out.println("stfDeleteDt =" + stfDeleteDt);
			if (stfDeleteDt != null) {
				System.out.println("탈퇴한 회원?");
				selectStfLogin.put("loginCheck", 7);

				System.out.println("탈퇴");
			} else {

				selectStfLogin.put("loginCheck", 6);
				System.out.println("탈퇴 x");
			}

		} catch (Exception e) {
			if (Decrypt_stfLoginPw != null) {
				// 보통 null 포인터 Exception 뜬 경우.
				selectStfLogin.put("loginCheck", 5);
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
		return selectStfLogin;
	}

	public List<Map<String, Object>> selectListStfList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) selectList("staff.selectListStfList",
				map);
	}

}
