package net.bizLogin.promoter.dao;

import net.bizLogin.promoter.vo.PmtFacilitatorSO;
import net.bizLogin.promoter.vo.PmtFacilitatorVO;
import net.common.dao.AbstractDAO;
import org.springframework.stereotype.Repository;


@Repository("pmtFacilitatorDAO")
public class PmtFacilitatorDAO extends AbstractDAO{
	public PmtFacilitatorVO checkSocialJoin(PmtFacilitatorSO so) {
		return (PmtFacilitatorVO) selectOne("promoter.checkSocialLogin", so);
	}
	
	public int joinSocialLogin(PmtFacilitatorSO so) {
		return (int) insert("promoter.joinSocialLogin", so);
	}
}

