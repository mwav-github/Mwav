package net.mwav.member.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.common.common.AesTest;
import net.mwav.member.dao.MemberDAO;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

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

	@Override
	public Map<String, Object> insertMbrForm(Map<String, Object> map) {
		// TODO Auto-generated method stub

		return memberDAO.insertMbrForm(map);
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
	
	/*========================================삭제========================================*/
	@Override
	public boolean deleteMbrDelete(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return memberDAO.deleteMbrDelete(map);
	}

	
	@Override
	public List<String> selectGunguFinder(String sido) {
		// TODO Auto-generated method stub
		return memberDAO.selectGunguFinder(sido);
	}

	@Override
	public List<Map<String, Object>> selectpostList_2(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return memberDAO.selectpostList_2(map);
	}

	@Override
	public Map<String, Object> selectLogin(Map<String, Object> map)
			throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.selectLogin(map);
	}

}