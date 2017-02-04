package net.mwav.qa.dao;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.common.dao.AbstractDAO;
import net.mwav.common.module.AesEncryption;

import org.springframework.stereotype.Repository;

@Repository("qaDAO")
public class QADAO extends AbstractDAO {

	// Abstrat로 변경

	/*
	 * ========================================등록================================
	 * ========
	 */

	public boolean insertQAForm(Map<String, Object> map,
			HttpServletRequest request) {
		// TODO Auto-generated method stub

		boolean flag = true;

		String check = String.valueOf(insert("qa.insertQAForm", map));

		System.out.println("check" + check);
		if (check.equals("1")) {
			flag = true;
		} else {
			flag = false;
		}
		return flag;
	}

	public List<Map<String, Object>> selectListQAList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
		String member_id = (String) map.get("member_id");
		List<Map<String, Object>> qaList = null;
		if(member_id == null){
			//비회원
			qaList = selectList("qa.selectListNonMemberQAList",map);
		}else{
			//회원
			qaList = selectList("qa.selectListMemberQAList",map);
		}
		
		return qaList;
	}

	public int selectOneGetTotalCount(String member_id, String uqUserEmail) {
		// TODO Auto-generated method stub
		int totalCount = 0;
		System.out.println("member_id"+member_id);
		if(member_id == null || member_id.equals("null") || member_id == ""){
			//비회원
			totalCount = (int) selectOne("qa.selectOneNonMemberGetTotalCount",uqUserEmail);
		}else{
			//회원
			totalCount = (int) selectOne("qa.selectOneMemberGetTotalCount",member_id);
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
		//System.out.println("음뭐지"+map.get("uqStatus"));
		if ((QnA_id + 1) < maxQnA_id) {
			
			map.put("QnA_id_2", (QnA_id + 1));
		} else if ((QnA_id + 1) == maxQnA_id || QnA_id == maxQnA_id) {
			
			map.put("QnA_id_2", null);
		}
		return map;
	}

	public Map<String, Object> selectOneQALogin(Map<String, Object> map) {
		// TODO Auto-generated method stub

		byte[] decrypted = null;
		// (Map<String, Object>) selectOne("member.selectLogin", map)
		
		// 디비 다녀오기 전 값
		String uqUserPw = (String) map.get("uqUserPw");
		Map<String, Object> qaLogin = null;

		qaLogin = (Map<String, Object>) selectOne("qa.selectOneQALogin", map);
		// 디비 다녀와서 온 값

		// 아래와 같이 미리 선언해줘야지 에러가 x
		

		return qaLogin;
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
