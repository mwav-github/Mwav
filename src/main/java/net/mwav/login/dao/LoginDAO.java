package net.mwav.login.dao;

import java.io.IOException;

import org.springframework.stereotype.Repository;

import net.common.common.Status;
import net.common.dao.AbstractDAO;
import net.mwav.common.module.AesEncryption;
import net.mwav.common.module.SecurityLib;
import net.mwav.login.vo.LoginVO;
import net.mwav.member.vo.Member_tbl_VO;

@Repository
public class LoginDAO extends AbstractDAO {

	public LoginVO getLoginFailCount(LoginVO loginVO) {
		return (LoginVO) selectOne("login.getLoginFailCount", loginVO);
	}

	public Integer insertAuditLogin(LoginVO loginVO) {
		return (Integer) insert("login.insertAuditLogin", loginVO);
	}

	public Integer updateAuditLogin(LoginVO loginVO) {
		return (Integer) update("login.updateAuditLogin", loginVO);
	}

	public void deleteAuditLogin(LoginVO loginVO) {
		delete("login.deleteAuditLogin", loginVO);
	}

	public Integer getUpdatePwYN(Member_tbl_VO member_tbl_VO) {
		return (Integer) selectOne("login.getUpdatePwYN", member_tbl_VO);
	}

	public Integer pwUpdateLater(Member_tbl_VO member_tbl_VO) {
		return (Integer) update("login.pwUpdateLater", member_tbl_VO);
	}

	public Status updateMbrLoginPw(Member_tbl_VO member_tbl_VO) throws IOException {
		try {
			String b_mbrLoginPw = member_tbl_VO.getMbrLoginPw();

			// AES128 암호화
			String encrypted = SecurityLib.getInstance().encryptToString(AesEncryption.sKey, AesEncryption.sInitVector, b_mbrLoginPw);
			member_tbl_VO.setHope_mbrLoginPw(encrypted);

			// 이전 pw워드와 동일한것으로 바뀌었는지여부
			String before_mbrLoginPw = (String) selectOne("login.selectMbrLoginPw", member_tbl_VO);

			// 이전 비밀번호와 동일하게 입력한 경우
			if (before_mbrLoginPw.equals(encrypted))
				return Status.INPUT_ERROR;

			int imsiflag = (int) update("login.updateMbrLoginPw", member_tbl_VO);
			if (imsiflag != 1)
				return Status.FAIL;

			update("login.pwUpdateLater", member_tbl_VO);
			return Status.OK;
		} catch (Exception e) {
			e.printStackTrace();
			return Status.FAIL;
		}
	}
}
