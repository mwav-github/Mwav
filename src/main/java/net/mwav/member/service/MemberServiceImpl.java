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

	@Override
	public Map<String, Object> selectLogin(Map<String, Object> map)
			throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.selectLogin(map);
	}

	@Override
	public Map<String, Object> insertMemberForm(Map<String, Object> map) {
		// TODO Auto-generated method stub

		return memberDAO.insertMemberForm(map);
	}

	@Override
	public Map<String, Object> selectMemberView(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return memberDAO.selectMemberView(map);
	}

	@Override
	public boolean selectIdCheck(String mbrLoginId) {
		// TODO Auto-generated method stub
		return memberDAO.selectIdCheck(mbrLoginId);
	}

	@Override
	public String selectIdFinder(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return memberDAO.selectIdFinder(map);
	}

	@Override
	public boolean selectPWFinder(Map<String, Object> map) {
		// TODO Auto-generated method stub
		boolean flag = memberDAO.imsiPWInsert(map);
		/*
		 * if (flag = false) { flag = false; } else { flag = true;
		 * memberDAO.selectPWFinder(map); }
		 */
		return flag;
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
	public boolean updateMemberDelete(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return memberDAO.updateMemberDelete(map);
	}

	@Override
	public boolean selectimsiPWFinder(Map<String, Object> map) {
		// TODO Auto-generated method stub
		boolean flag = memberDAO.imsiPWFinder(map);
		/*
		 * if (flag = false) { flag = false; } else { flag = true;
		 * memberDAO.selectPWFinder(map); }
		 */
		return flag;
	}

	@Override
	public boolean updatePw(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
		boolean flag = false;
		try {
			flag = memberDAO.updatePw(map);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
}