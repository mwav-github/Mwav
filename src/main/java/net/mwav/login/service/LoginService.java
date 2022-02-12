package net.mwav.login.service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import net.common.common.Status;
import net.mwav.login.vo.LoginVO;
import net.mwav.member.vo.Member_tbl_VO;

public interface LoginService {
	/** 실패횟수 */
	public LoginVO getLoginFailCount(LoginVO loginVO);

	/** 실패횟수 update or insert */
	public Integer mergeAuditLogin(LoginVO loginVO);

	/** 로그인 성공시 실패횟수 삭제 */
	public void deleteAuditLogin(LoginVO loginVO);

	/** 비밀번호 변경일이 되었는지 체크 */
	public Integer getUpdatePwYN(Member_tbl_VO member_tbl_VO);

	/** 비밀번호 변경일 업데이트 */
	public Integer pwUpdateLater(Member_tbl_VO member_tbl_VO);

	/** 비밀번호 변경 */
	public Status updateMbrLoginPw(HttpServletRequest request, Member_tbl_VO member_tbl_VO) throws IOException;
}
