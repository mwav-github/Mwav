package net.mwav.member.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.mwav.member.dao.MemberDAO;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	Logger log = Logger.getLogger(this.getClass());

	byte[] encrypted = null;

	@Resource(name = "memberDAO")
	private MemberDAO memberDAO;

	/*
	 * ========================================등록================================
	 * ========
	 */

	/**
	 * @date 2016.04.27
	 * @author Kim YJ
	 * @see 서비스단 로직 활용
	 */
	@Override
	public String insertMbrForm(Map<String, Object> map) {

		String result = null;

		String b_mbrLoginPw = String.valueOf(map.get("mbrLoginPw"));
		if (b_mbrLoginPw.isEmpty()) { //비번처리 로직
			return "pwEmpty"; //null exception 처리
		} else if (b_mbrLoginPw.length() < 8 || b_mbrLoginPw.length() > 15) {
			return "pwLengthWrong"; //pw 자리수 return
		} else if (b_mbrLoginPw.trim().length() == 0) {
			return "pwWrongType"; //공백일 경우 처리
		}

		String mbrCellPhone = String.valueOf(map.get("mbrCellPhone_1"))
				+ String.valueOf(map.get("mbrCellPhone_2"))
				+ String.valueOf(map.get("mbrCellPhone_3"));
		map.put("mbrCellPhone", mbrCellPhone);

		String mbrAddress_1 = String.valueOf(map.get("mbrAddress_1"));
		String mbrAddress_2 = String.valueOf(map.get("mbrAddress_2"));
		if (mbrAddress_1 == null && mbrAddress_2 == null) {
			map.put("mbrAddress", null);
		} else {
			map.put("mbrAddress", mbrAddress_1 + mbrAddress_2);
		}

		result = memberDAO.insertMbrForm(map);

		return result;
	}

	/*
	 * ========================================보기================================
	 * ========
	 */

	@Override
	public Map<String, Object> selectMbrView(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return memberDAO.selectMbrView(map);
	}

	/*
	 * ========================================수정================================
	 * ========
	 */

	@Override
	public Map<String, Object> updateMbrForm(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return memberDAO.updateMbrForm(map);
	}

	@Override
	public void updateProMbrform(Map<String, Object> map) {
		// TODO Auto-generated method stub
		memberDAO.updateProMbrform(map);
		return;
	}

	@Override
	public boolean updateMbrLoginPw(Map<String, Object> map) throws IOException {
		// TODO Auto-generated method stub

		boolean flag = false;
		flag = memberDAO.updateMbrLoginPw(map);
		return flag;
	}

	@Override
	public boolean updateMbrTempLoginPw(Map<String, Object> map) {
		// TODO Auto-generated method stub
		boolean flag = memberDAO.updateMbrTempLoginPw(map);
		/*
		 * if (flag = false) { flag = false; } else { flag = true;
		 * memberDAO.selectPWFinder(map); }
		 */
		return flag;
	}

	/*
	 * ========================================리스트(SelectOne, SelectList
	 * 순)========================================
	 */

	@Override
	public boolean selectOneMbrLoginIdCheck(String mbrLoginId) {
		// TODO Auto-generated method stub
		return memberDAO.selectOneMbrLoginIdCheck(mbrLoginId);
	}

	@Override
	public String selectOneMbrLoginIdSeek(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return memberDAO.selectOneMbrLoginIdSeek(map);
	}

	@Override
	public boolean selectOneMbrTempLoginPwSeek(Map<String, Object> map) {
		// TODO Auto-generated method stub
		boolean flag = memberDAO.selectOneMbrTempLoginPwSeek(map);
		/*
		 * if (flag = false) { flag = false; } else { flag = true;
		 * memberDAO.selectPWFinder(map); }
		 */
		return flag;
	}

	/*
	 * ========================================삭제================================
	 * ========
	 */
	@Override
	public boolean deleteMbrDelete(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return memberDAO.deleteMbrDelete(map);
	}

	@Override
	public List<String> selectListZcGunGuSeek(String zcSiDoName) {
		// TODO Auto-generated method stub
		return memberDAO.selectListZcGunGuSeek(zcSiDoName);
	}

	@Override
	public List<Map<String, Object>> selectListZcAll(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return memberDAO.selectListZcAll(map);
	}

	@Override
	public Map<String, Object> selectLogin(Map<String, Object> map)
			throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.selectLogin(map);
	}

	@Override
	public Map<String, Object> insertSnsForm(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return memberDAO.insertSnsForm(map);
	}

	@Override
	public boolean selectOneSnsMbrLoginIdCheck(String smMember_id) {
		// TODO Auto-generated method stub
		return memberDAO.selectOneSnsMbrLoginIdCheck(smMember_id);
	}
	
	@Override
	public String selectOneMemberPkCheck() {
		// TODO Auto-generated method stub
		return memberDAO.selectOneMemberPkCheck();
	}

}