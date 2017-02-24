package net.mwav.qa.dao;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.common.dao.AbstractDAO;
import net.mwav.common.module.AesEncryption;

import org.springframework.stereotype.Repository;

@Repository("qaDAO")
public class QADAO extends AbstractDAO {
	byte[] decrypted = null;
	byte[] encrypted = null;

	// Abstrat로 변경

	/*
	 * ========================================등록================================
	 * ========
	 */

	public boolean insertQAForm(Map<String, Object> map,
			HttpServletRequest request) {
		// TODO Auto-generated method stub
		String b_uqUserPw = null;
		boolean flag = false;

		try{
		b_uqUserPw = (String) map.get("uqUserPw");

		//비회원인 경우만, 패스워드 이쓴ㄴ 경우 
		if (b_uqUserPw != null) {
			// AES/CBC/IV 암호화 (키,암호화텍스트,iv)
			encrypted = AesEncryption.aesEncryptCbc(AesEncryption.sKey,
					b_uqUserPw, AesEncryption.sInitVector);

			// 암호화된 값이 String으로 반환
			String sBase = null;
			try {
				sBase = AesEncryption.aesEncodeBuf(encrypted);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			System.out.println("    - TEXT2 : " + sBase);

			map.put("uqUserPw", sBase);
		}
		
		String check = String.valueOf(insert("qa.insertQAForm", map));

		System.out.println("check" + check);
		if (check.equals("1")) {
			flag = true;
		} else {
			flag = false;
		}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return flag;
	}

	public List<Map<String, Object>> selectListQAList(Map<String, Object> map) {
		// TODO Auto-generated method stub

		String member_id = (String) map.get("member_id");
		System.out.println("member_id" + member_id);
		List<Map<String, Object>> qaList = null;
		if (member_id == null || member_id.equals("")
				|| member_id.equals("null")) {
			// 비회원
			qaList = selectList("qa.selectListNonMemberQAList", map);

		} else {
			// 회원
			qaList = selectList("qa.selectListMemberQAList", map);
		}

		return qaList;
	}

	public int selectOneGetTotalCount(String member_id, String uqUserEmail) {
		// TODO Auto-generated method stub
		int totalCount = 0;
		System.out.println("member_id" + member_id);
		if (member_id == null || member_id.equals("null") || member_id == "") {
			// 비회원
			totalCount = (int) selectOne("qa.selectOneNonMemberGetTotalCount",
					uqUserEmail);
		} else {
			// 회원
			totalCount = (int) selectOne("qa.selectOneMemberGetTotalCount",
					member_id);
		}
		return totalCount;
	}

	/*
	 * ========================================보기================================
	 * ========
	 */

	/*
	 * ========================================수정================================
	 * ========
	 */
	// 조회수 증가
	public void updateQAHitCnt(Map<String, Object> map) throws Exception {
		update("qa.updateQAHitCnt", map);
	}

	/*
	 * ========================================리스트(SelectOne, SelectList
	 * 순)========================================
	 */

	public List<Map<String, Object>> selectListQAFrontList(
			Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) selectList(
				"qa.selectListQAFrontList", map);
	}

	public Map<String, Object> selectOneQAView(Map<String, Object> map) {
		// TODO Auto-generated method stub
		int QnA_id = Integer.parseInt((String) map.get("QnA_id"));
		int maxQnA_id = (int) selectOne("qa.selectOneMAXQAView");
		System.out.println("QnA_id" + QnA_id);
		System.out.println("maxQnA_id" + maxQnA_id);

		// 이게 밑으로가면 아래 map 값넣는거는 안먹힌다.
		map = (Map<String, Object>) selectOne("qa.selectOneQAView", map);
		// System.out.println("음뭐지"+map.get("uqStatus"));
		if (QnA_id < maxQnA_id) {

			map.put("QnA_id_2", (QnA_id + 1));
		} else if ((QnA_id + 1) == maxQnA_id || QnA_id == maxQnA_id) {

			map.put("QnA_id_2", null);
		}
		return map;
	}

	public String selectOneQALogin(Map<String, Object> map) {
		// TODO Auto-generated method stub

		byte[] decrypted = null;
		// (Map<String, Object>) selectOne("member.selectLogin", map)

		// 디비 다녀오기 전 값
		// String uqUserPw = (String) map.get("uqUserPw");
		int qaLogin = 0;
		String b_uqUserPw = (String) map.get("uqUserPw");
		String b_uqUserEmail = (String) map.get("uqUserEmail");

		// AES/CBC/IV 암호화 (키,암호화텍스트,iv)
		encrypted = AesEncryption.aesEncryptCbc(AesEncryption.sKey, b_uqUserPw,
				AesEncryption.sInitVector);

		// 암호화된 값이 String으로 반환
		String sBase = null;
		try {
			sBase = AesEncryption.aesEncodeBuf(encrypted);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		map.put("uqUserPw", sBase);

		qaLogin = (int) selectOne("qa.selectOneQALogin", map);
		System.out.println("qaLogin" + qaLogin);

		String uqUserEmail = null;
		if (qaLogin == 0) {
			uqUserEmail = null;
		} else {
			System.out.println("b_uqUserEmail" + b_uqUserEmail);
			uqUserEmail = b_uqUserEmail;
		}

		return uqUserEmail;
	}

	/*
	 * ========================================삭제================================
	 * ========
	 */

	// ///////////////////////////////////BoardNotices/////////////////////////////////////

	/*
	 * ========================================등록================================
	 * ========
	 */

	/*
	 * ========================================보기================================
	 * ========
	 */

	/*
	 * ========================================수정================================
	 * ========
	 */

	/*
	 * ========================================리스트(SelectOne, SelectList
	 * 순)========================================
	 */

	/*
	 * ========================================삭제================================
	 * ========
	 */

}
