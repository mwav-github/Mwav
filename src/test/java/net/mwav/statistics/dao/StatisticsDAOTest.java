package net.mwav.statistics.dao;

//import com.sun.org.apache.bcel.internal.generic.NEW;
import net.mwav.statistics.vo.StatisticsLogVO;
import net.mwav.statistics.vo.StatisticsVO;
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
import java.util.Date;

/**
 * <pre>
 * {@code
 *  <p>통계 페이지 DB 연동 테스트</p>
 * }
 * </pre>
 * @author 공태현
 * @since 1.0.1
 * @version 1.0.0
 * @see net.mwav.statistics.dao.StatisticsDAOTest
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/spring/mwav-data.xml"
        , "classpath:config/spring/mwav-mapper.xml"})
@Transactional
public class StatisticsDAOTest {

    @Autowired
    DataSource dataSource;

    @Spy
    @Autowired
    SqlSessionTemplate sqlSession;

    @InjectMocks
    StatisticsDAO dao;

    /**
     * <pre>
     * {@code
     *      <p>@InjectMocks 어노테이션을 활성화시키기 위한 설정</p>
     *      <p>StatisticsDAOTest 클래스 하위의 모든 테스크케이스들은 매번 실행시 마다 initTest 메소드를 실행하게 된다.</p>
     * }
     * </pre>
     * @param
     * @return void
     * @throws SQLException
     * @see org.springframework.test.web.servlet.MockMvc
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
     *      <p>유저가 처음 접속했을때 INSERT 여부 테스트</p>
     * }
     * </pre>
     * @param
     * @return void
     * @throws
     * @see StatisticsDAO.insertFirstStatics
     * @since 1.0.1
     * @version 1.0.0
     */
    @Test
    public void insertFirstStatics_유저가처음으로접속했을때삽입() {
        // given
        StatisticsVO vo = new StatisticsVO();
        vo.setStatistics_id(1999999999);
        vo.setStPageName("-");
        vo.setStUrlScheme("-");
        vo.setStUrlHost("-");
        vo.setStUrlPort(99);
        vo.setStUrlLocalPath("-");
        vo.setStQueryString("-");
        vo.setStUrlPathAndQuery("-");
        vo.setStPrePageName("-");
        vo.setStUrlReferrerHost("-");
        vo.setStUrlReferrer("-");
        vo.setStSessionId("-");
        vo.setStUserHostAddress("-");
        vo.setStUserAgent("-");

        // when
        dao.insertFirstStatics(vo);

        // then
        // select 쿼리가 없어...
    }

    /**
     * <pre>
     * {@code
     *      <p>이미 접속했었던 유저의 정보를 INSERT 테스트</p>
     * }
     * </pre>
     * @param
     * @return void
     * @throws
     * @see StatisticsDAO.insertStatistics
     * @since 1.0.1
     * @version 1.0.0
     */
    @Test
    public void insertStatistics_접속했던유저의접속경로의정보를삽입() {
        // given
        long statistics_id = 1999999999;
        StatisticsVO vo = new StatisticsVO();
        vo.setStatistics_id(statistics_id);
        vo.setStPageName("-");
        vo.setStUrlScheme("-");
        vo.setStUrlHost("-");
        vo.setStUrlPort(99);
        vo.setStUrlLocalPath("-");
        vo.setStQueryString("-");
        vo.setStUrlPathAndQuery("-");
        vo.setStPrePageName("-");
        vo.setStUrlReferrerHost("-");
        vo.setStUrlReferrer("-");
        vo.setStSessionId("-");
        vo.setStUserHostAddress("-");
        vo.setStUserAgent("-");

        StatisticsLogVO log_vo = new StatisticsLogVO();
        log_vo.setStatistics_id(statistics_id);
        log_vo.setSlPageName("-");
        log_vo.setSlUrlHost("-");
        log_vo.setSlUrlLocalPath("-");
        log_vo.setSlQueryString("-");

        // when
        dao.insertFirstStatics(vo);

        /*  TODO: slStatLogDt 를 SYSDATE로 INSERT 하는데 이것이 PK로 잡히다보니 문제가 생김
            slStatLogDt의 INSERT 값을 세밀하게 조정하던가 다른 방법으로 삽입하는게 좋을것 같음.
        */
        dao.insertStatistics(log_vo);

        // then
    }

}