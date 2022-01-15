package net.sample.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import net.sample.dao.SampleDAO;

/*ServiceImpl 클래스는 Service 인터페이스를 통해 정의된 메서드를 실제로 구현하는 클래스
 @Servcie 어노테이션을 이용하여 Service 객체임을 선언하였고, 이 객체의 이름은 "sampleService"라고 선언하였다. 
 
 만약 Autowired 나 Inject 이라면
 @Service 만 쓴다. 
*/
@Service
public class SampleServiceImpl implements SampleService {
	Logger log = Logger.getLogger(this.getClass());

	/*마찬가지로 수동으로 빈 등록
	  Controller에서 Service 접근을 위한 선언을 한것과 마찬가지로, 
	  Service에서는 데이터 접근을 위한 DAO(Data Access Object) 객체를 선언하였다. 
	 *  */
	@Inject
	private SampleDAO sampleDAO;

	/*ServiceImpl클래스는 SampleServcie 인터페이스를 상속(extends와 implements의 차이다. 
	 * extends는 클래스를 상속, implements는 인터페이스의 상속)하여, 해당 인터페이스에 정의된 메서드를 무조건 작성해야한다.  */
	@Override
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
		return sampleDAO.selectBoardList(map);
		// sampleDAO는 xml매퍼파일의 네임스페이스, selectBoardList
		// 쿼리를 설정한 ID이다. 그리고 파라미터를 map으로 넣었다.         

	}

	@Override
	public void insertBoard(Map<String, Object> map) throws Exception {
		sampleDAO.insertBoard(map);
	}

	@Override
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception {
		sampleDAO.updateHitCnt(map);
		Map<String, Object> resultMap = sampleDAO.selectBoardDetail(map);
		return resultMap;
	}

	@Override
	public void updateBoard(Map<String, Object> map) throws Exception {
		sampleDAO.updateBoard(map);
	}

	@Override
	public void deleteBoard(Map<String, Object> map) throws Exception {
		sampleDAO.deleteBoard(map);
	}

}
