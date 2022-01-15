package net.mwav.qa.dao;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;

import net.common.dao.AbstractDAO;
import net.mwav.common.module.AesEncryption;

@Repository
@SuppressWarnings("unchecked")
public class QADAO extends AbstractDAO {

	/*
	 * ========================================등록================================
	 * ========
	 */
	public String insertQAForm(Map<String, Object> map, HttpServletRequest request) {
		String b_uqUserPw = null;
		String flag = null;

		try {
			b_uqUserPw = (String) map.get("uqUserPw");

			//비회원인 경우만, 패스워드 이쓴ㄴ 경우 
			if (b_uqUserPw != null) {
				// AES/CBC/IV 암호화 (키,암호화텍스트,iv)
				byte[] encrypted = AesEncryption.aesEncryptCbc(AesEncryption.sKey, b_uqUserPw, AesEncryption.sInitVector);

				// 암호화된 값이 String으로 반환
				String sBase = null;
				try {
					sBase = AesEncryption.aesEncodeBuf(encrypted);
				} catch (IOException e) {
					e.printStackTrace();
				}

				System.out.println("    - TEXT2 : " + sBase);

				map.put("uqUserPw", sBase);
			}

			Map<String, Object> imsimap = (Map<String, Object>) selectOne("qa.selectNextPk", map);
			// map을 위에서 써버리면 그 다음 쿼리시 null 값 나온다. !! (가져오는값이라?)
			String q_pk = String.valueOf(imsimap.get("QnA_id"));
			map.put("QnA_id", q_pk);

			String check = String.valueOf(insert("qa.insertQAForm", map));
			String QnA_id = q_pk;
			System.out.println("check" + check);
			if (check.equals("1")) {
				flag = QnA_id;
			} else {
				flag = null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public List<Map<String, Object>> selectListQAList(Map<String, Object> map) {
		String member_id = (String) map.get("member_id");
		System.out.println("member_id" + member_id);
		List<Map<String, Object>> qaList = null;
		if (member_id == null || member_id.equals("") || member_id.equals("null")) {
			// 비회원
			qaList = selectList("qa.selectListNonMemberQAList", map);

		} else {
			// 회원
			qaList = selectList("qa.selectListMemberQAList", map);
		}

		return qaList;
	}

	public int selectOneGetTotalCount(String member_id, String uqUserEmail) {
		int totalCount = 0;
		System.out.println("member_id" + member_id);
		if (member_id == null || member_id.equals("null") || member_id == "") {
			// 비회원
			totalCount = (int) selectOne("qa.selectOneNonMemberGetTotalCount", uqUserEmail);
		} else {
			// 회원
			totalCount = (int) selectOne("qa.selectOneMemberGetTotalCount", member_id);
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

	public List<Map<String, Object>> selectListQAFrontList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("qa.selectListQAFrontList", map);
	}

	public Map<String, Object> selectOneQAView(Map<String, Object> map) {
		//##이전 게시글 처리 
		int QnA_id = Integer.parseInt((String) map.get("userQuestion_id"));
		Map<String, Object> map1 = new HashMap<String, Object>();

		Map<String, Object> map2 = new HashMap<String, Object>();

		// Add everything in map1 not in map2 to map2

		map1 = (Map<String, Object>) selectOne("qa.selectOneQAView", map);

		// 대답은 null 일 수 있다 문제는 만약 위에있음 QnA_id가 null 이 될수도잇으니까
		// 아예 따로하거나 밑에 배치
		map2 = (Map<String, Object>) selectOne("qa.selectOneQAUaView", map);
		if (map2 != null) {
			map1.putAll(map2);
		}

		Date uaBeReadDt = (Date) map1.get("uaBeReadDt");
		System.out.println("uaBeReadDt" + uaBeReadDt);

		//답변달린 후 최초 조회.
		if (uaBeReadDt == null) {
			update("qa.updateUABeReadDt", QnA_id);
		}
		//기 이력이있는 경우 

		int maxQnA_id = (int) selectOne("qa.selectOneMAXQAView");

		// 이전 / 다음글에 대한 처리를 위하여,
		//현재 Q&A 아이디가 max Q&A 아이디가 작을 때
		//즉 제일 마지막 이전게시글 까지는

		if (QnA_id < maxQnA_id) {

			map1.put("QnA_id_2", (QnA_id + 1));

			// 마지막 게시글인 경우
		} else if (QnA_id == maxQnA_id) {

			map1.put("QnA_id_2", null);
		}
		return map1;
	}

	public String selectOneQALogin(Map<String, Object> map) {
		// 디비 다녀오기 전 값
		// String uqUserPw = (String) map.get("uqUserPw");
		int qaLogin = 0;
		String b_uqUserPw = (String) map.get("uqUserPw");
		String b_uqUserEmail = (String) map.get("uqUserEmail");

		// AES/CBC/IV 암호화 (키,암호화텍스트,iv)
		byte[] encrypted = AesEncryption.aesEncryptCbc(AesEncryption.sKey, b_uqUserPw, AesEncryption.sInitVector);

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

	public boolean uaSatisfactionUpdateAjax(Map<String, Object> map) {
		boolean flag = false;

		try {

			String check = String.valueOf(update("qa.uaSatisfactionUpdateAjax", map));

			System.out.println("check" + check);
			if (check.equals("1")) {

				flag = true;
			} else if (check.equals("0")) {
				flag = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;

	}

}
