package net.admins.dao;

import org.assertj.core.api.Assertions;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.MockitoAnnotations;
import org.mockito.Spy;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import javax.sql.DataSource;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <pre>
 * {@code
 *  <p>관리자페이지의 통계 DB CRUD 테스트</p>
 * }
 * </pre>
 * @author 공태현
 * @since 1.0.1
 * @version 1.0.0
 * @see net.admins.dao.StatisticsAdminsDAO
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/spring/mwav-data.xml"
        , "classpath:config/spring/mwav-mapper.xml"})
@Transactional
public class StatisticsAdminsDAOTest {

    @Autowired
    DataSource dataSource;

    @Spy
    @Autowired
    SqlSessionTemplate sqlSession;

    @InjectMocks
    StatisticsAdminsDAO dao;

    /**
     * <pre>
     * {@code
     *      <p>@InjectMocks 어노테이션을 활성화시키기 위한 설정</p>
     *      <p>StatisticsAdminsDAO 클래스 하위의 모든 테스크케이스들은 매번 실행시 마다 initTest 메소드를 실행하게 된다.</p>
     * }
     * </pre>
     * @param
     * @return void
     * @throws
     * @see
     * @since 1.0.1
     * @version 1.0.0
     */
    @Before
    public void initTest() throws SQLException {
        MockitoAnnotations.initMocks(this);
    }

    /**
     * <pre>
     * {@code
     *      <p>관리자페이지 통계 리스트가 정상적으로 불러와지는지 테스트</p>
     * }
     * </pre>
     * @param
     * @return void
     * @throws
     * @see StatisticsAdminsDAO.selectListStatistics
     * @since 1.0.1
     * @version 1.0.0
     */
    @Test
    public void selectListStatistics() {
        // given
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("startRow", 0); // 시작 열
        map.put("endRow", 1); // 끝 열

        // when
        final List<Map<String, Object>> list = dao.selectListStatistics(map);

        // then
        Assertions.assertThat(list).isNotNull();
    }
}