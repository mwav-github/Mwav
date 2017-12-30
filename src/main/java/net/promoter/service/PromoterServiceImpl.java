package net.promoter.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.promoter.dao.PromoterDAO;
import net.promoter.vo.Promoter_VO;

import org.springframework.stereotype.Service;

@Service("promoterService")
public class PromoterServiceImpl implements PromoterService {

	@Resource(name = "promoterDAO")
	private PromoterDAO promoterDAO;

	@Override
	public int selectNextPmtPk() throws Exception {
		// TODO Auto-generated method stub
		return promoterDAO.selectNextPmtPk();
	}

	@Override
	public boolean selectOnePmtLoginIdCheck(String PmtLoginId) throws Exception {
		// TODO Auto-generated method stub
		return promoterDAO.selectOnePmtLoginIdCheck(PmtLoginId);
	}

	@Override
	public int insertPmtForm(Map<String, Object> map) throws Exception {
		return promoterDAO.insertPmtForm(map);
	}



	@Override
	public List<Map<String, Object>> selectListPmtList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return promoterDAO.selectListPmtList(map);
	}

	@Override
	public int selectOneGetTotalCount() {
		return promoterDAO.selectOneGetTotalCount();
	}

	@Override
	public Map<String, Object> selectPmtView(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Promoter_VO selectPmtLogin(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}




	@Override
	public Promoter_VO selectOnePmtInfo(String promoter_id) {
		// TODO Auto-generated method stub
		return promoterDAO.selectOnePmtInfo(promoter_id);
	}

	@Override
	public Map<String, Object> updatePmtForm(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updatePmtPro(Map<String, Object> map) {
		return promoterDAO.updatePmtPro(map);
	}

	@Override
	public int updatePmtVisitNbr(String PmtLoginId) throws Exception {
		return promoterDAO.updatePmtVisitNbr(PmtLoginId);
	}

}
