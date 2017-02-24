package net.admins.dao;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.common.dao.AbstractDAO;
import net.mwav.common.module.AesEncryption;

import org.springframework.stereotype.Repository;

@Repository("boardQaAdminsDAO")
public class BoardQaAdminsDAO extends AbstractDAO {

	int uqStatus;
	public void insertQnAForm(Map<String, Object> map) {
		// TODO Auto-generated method stub
		insert("boardQaAdminsDAO.insertQnAForm", map);
	}

	public Map<String, Object> selectOneQnAView(Map<String, Object> map) {
		// TODO Auto-generated method stub

		// 원래 하나의 조인문으로 뽑아내려고했으나 그러면, 문제가 답변이 없는 경우에는 뽑아낼수가 없다.
		Map<String, Object> map1 = new HashMap<String, Object>();

		Map<String, Object> map2 = new HashMap<String, Object>();

		// Add everything in map1 not in map2 to map2

		map1 = (Map<String, Object>) selectOne(
				"boardQaAdminsDAO.selectOneQnAView", map);

		// 대답은 null 일 수 있다 문제는 만약 위에있음 QnA_id가 null 이 될수도잇으니까
		// 아예 따로하거나 밑에 배치
		map2 = (Map<String, Object>) selectOne(
				"boardQaAdminsDAO.selectOneQnAUaView", map);
		if (map2 != null) {
			map1.putAll(map2);
		}
		return map1;

	}

	public void updateQnAHitCnt(Map<String, Object> map) {
		// TODO Auto-generated method stub
		update("boardQaAdminsDAO.updateQnAHitCnt", map);

	}

	public List<Map<String, Object>> selectListQnAList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) selectList(
				"boardQaAdminsDAO.selectListQnAList", map);
	}

	public int selectOneGetQnATotalCount() {
		// TODO Auto-generated method stub
		return (int) selectOne("boardQaAdminsDAO.selectOneGetQnATotalCount");
	}

	public void deleteQnADelete(Map<String, Object> map) {
		// TODO Auto-generated method stub
		update("boardQaAdminsDAO.deleteQnADelete", map);
	}

	public List<Map<String, Object>> selectListQnAFrontList(
			Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) selectList(
				"boardQaAdminsDAO.selectListQnAFrontList", map);
	}

	// =================답변
	public boolean insertQnAUaForm(Map<String, Object> map) {
		// TODO Auto-generated method stub
		boolean flag = false;

		try {
			

			String check = String.valueOf(insert(
					"boardQaAdminsDAO.insertQnAUaForm", map));

			System.out.println("check" + check);
			if (check.equals("1")) {
				//insert 성공시에 status 값 업데이트 해줘야 한다. 
				

				update("boardQaAdminsDAO.updateQnAUaForm", map);
				
				flag = true;
			} else {
				flag = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

}
