package net.common.dao;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * SqlSessionTemplate을 설정하였고, 이는 SqlSession을 대체한다고 이야기 했었다.
 *
 */
public class AbstractDAO {

	private static final Logger logger = LoggerFactory.getLogger(AbstractDAO.class);

	/*SqlSessionTemplate을 선언하고 여기에 Autowired 어노테이션(Annotation)을 통해서 
	 * xml에 선언했던 의존관계를 자동으로 주입하도록 하였다. 
	 * 
	 * 쿼리는 sqlSession.메서드를 호출하면 되는데, 여기서는 앞으로 개발할때, 좀 더 보기편하게 로그를 남기기위해서 AbstractDAO를 만들어서 insert, delete, update, select 메서드를 재정의 하였다.
	 * 실제 개발에서는 각 비즈니스 로직을 담당할 DAO를 생성하여 AbstractDAO를 상속받도록 할 계획이다. 
	 * */
	@Inject
	private SqlSessionTemplate sqlSession;

	protected void printQueryId(String queryId) {
		logger.debug("\t QueryId  \t:  " + queryId);
	}

	public Object insert(String queryId, Object params) {
		printQueryId(queryId);
		return sqlSession.insert(queryId, params);
	}

	public Object update(String queryId, Object params) {
		printQueryId(queryId);
		return sqlSession.update(queryId, params);
	}

	public Object delete(String queryId, Object params) {
		printQueryId(queryId);
		return sqlSession.delete(queryId, params);
	}

	public Object selectOne(String queryId) {
		printQueryId(queryId);
		return sqlSession.selectOne(queryId);
	}

	public Object selectOne(String queryId, Object params) {
		printQueryId(queryId);
		return sqlSession.selectOne(queryId, params);
	}

	@SuppressWarnings("rawtypes")
	public List selectList(String queryId) {
		printQueryId(queryId);
		return sqlSession.selectList(queryId);
	}

	@SuppressWarnings("rawtypes")
	public List selectList(String queryId, Object params) {
		printQueryId(queryId);
		return sqlSession.selectList(queryId, params);
	}
}
