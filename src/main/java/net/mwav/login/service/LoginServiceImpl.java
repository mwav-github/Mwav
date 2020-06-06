package net.mwav.login.service;

import java.io.IOException;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import net.admins.dao.CommonDAO;
import net.common.common.Status;
import net.mwav.common.module.FileUtils;
import net.mwav.login.dao.LoginDAO;
import net.mwav.login.vo.LoginVO;
import net.mwav.member.vo.Member_tbl_VO;

@Service("loginService")
public class LoginServiceImpl implements LoginService {
	
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "loginDAO")
	private LoginDAO loginDAO;

	@Override
	public LoginVO getLoginFailCount(LoginVO loginVO) {
		return loginDAO.getLoginFailCount(loginVO);
	}

	@Override
	public Integer mergeAuditLogin(LoginVO loginVO) {
		LoginVO vo = loginDAO.getLoginFailCount(loginVO);
		loginVO.setAlFailCount(vo.getAlFailCount());
		loginVO.setAuditLogin_id(vo.getAuditLogin_id());
		
		if(loginVO.getAlFailCount() == 0) {
			return loginDAO.insertAuditLogin(loginVO);
		} else {
			return loginDAO.updateAuditLogin(loginVO);
		}
	}

	@Override
	public void deleteAuditLogin(LoginVO loginVO) {
		loginDAO.deleteAuditLogin(loginVO);
		
	}

	@Override
	public Integer getUpdatePwYN(Member_tbl_VO member_tbl_VO) {
		return loginDAO.getUpdatePwYN(member_tbl_VO);
	}                                 

	@Override
	public Integer pwUpdateLater(Member_tbl_VO member_tbl_VO) {
		return loginDAO.pwUpdateLater(member_tbl_VO);
	}

	@Override
	public Status updateMbrLoginPw(HttpServletRequest request, Member_tbl_VO member_tbl_VO) throws IOException {
		HttpSession session = request.getSession();
		Member_tbl_VO member = (Member_tbl_VO) session.getAttribute("member");
		member_tbl_VO.setMember_id(member.getMember_id());
		return loginDAO.updateMbrLoginPw(member_tbl_VO);
	}

}
