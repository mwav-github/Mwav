package net.common.charts.dao;

import net.common.charts.vo.FusionChartVo;
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
 *  <p>퓨전차트 DB CURD 테스트</p>
 * }
 * </pre>
 * @author 공태현
 * @since 1.0.1
 * @version 1.0.0
 * @see net.common.charts.dao.FusionChartDao
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/spring/mwav-data.xml"
        , "classpath:config/spring/mwav-mapper.xml"})
@Transactional
public class FusionChartDaoTest {

    @Autowired
    DataSource dataSource;

    @Spy
    @Autowired
    SqlSessionTemplate sqlSession;

    @InjectMocks
    FusionChartDao dao;

    /**
     * <pre>
     * {@code
     *      <p>@InjectMocks 어노테이션을 활성화시키기 위한 설정</p>
     *      <p>FusionChartDao 클래스 하위의 모든 테스크케이스들은 매번 실행시 마다 initTest 메소드를 실행하게 된다.</p>
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
     *      <p>퓨전차트 주간사용자 접속 차트 조회 쿼리 테스트</p>
     * }
     * </pre>
     * @param
     * @return void
     * @throws
     * @see FusionChartDao.selectWeeklyUsersList
     * @since 1.0.1
     * @version 1.0.0
     */
    @Test
    public void selectWeeklyUsersList_주간사용자접속차트조회() {
        // given

        // when
        final List<FusionChartVo> list = dao.selectWeeklyUsersList(null);

        // then
        Assertions.assertThat(list).isNotNull();
    }

    /**
     * <pre>
     * {@code
     *      <p>퓨전차트 최상위 10개의 쿼리 조회 테스트</p>
     * }
     * </pre>
     * @param
     * @return void
     * @throws
     * @see FusionChartDao.selectTop10PageList
     * @since 1.0.1
     * @version 1.0.0
     */
    @Test
    public void selectTop10PageList() {
        // given

        // when
        final List<FusionChartVo> list = dao.selectTop10PageList(null);

        // then
        Assertions.assertThat(list).isNotNull();

    }

    /**
     * <pre>
     * {@code
     *      <p>퓨전차트 쿼리 조회 테스트</p>
     * }
     * </pre>
     * @param
     * @return void
     * @throws
     * @see FusionChartDao.selectClientScreenSizeList
     * @since 1.0.1
     * @version 1.0.0
     */
    @Test
    public void selectClientScreenSizeList() {
        // given

        // when
        final List<FusionChartVo> list = dao.selectClientScreenSizeList(null);

        // then
        Assertions.assertThat(list).isNotNull();

    }
}