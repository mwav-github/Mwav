package net.sample.dao;

import java.util.List;
import java.util.Map;

import net.common.dao.AbstractDAO;

import org.springframework.stereotype.Repository;

/*@Repository라는 어노테이션을 통해서 이 클래스가 DAO 임을 선언하고 이름을 "sampleDAO"로 작성하였다. 
 * SampleServiceImpl에서 @Resource(name="sampleDAO")로 bean을 수동으로 등록하였고, 
 * 거기서 사용된 빈이 방금 작성한 SampleDAO 클래스다. 
 * 
 *  AbstractDAO 클래스를 상속 : 공통적인 자주쓰는 것에 대해서 빼놓음. 로그 출력이나 동시 수정에 유리
 * */
@Repository("sampleDAO")
public class SampleDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("sample.selectBoardList", map);
	}

	public void insertBoard(Map<String, Object> map) throws Exception{
		insert("sample.insertBoard", map);
	}

	public void updateHitCnt(Map<String, Object> map) throws Exception{
		update("sample.updateHitCnt", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("sample.selectBoardDetail", map);
	}

	public void updateBoard(Map<String, Object> map) throws Exception{
		update("sample.updateBoard", map);
	}

	public void deleteBoard(Map<String, Object> map) throws Exception{
		update("sample.deleteBoard", map);
	}

}
