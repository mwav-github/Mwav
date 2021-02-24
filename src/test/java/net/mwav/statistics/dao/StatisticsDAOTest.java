package net.mwav.statistics.dao;

import com.sun.org.apache.bcel.internal.generic.NEW;
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

    @Before
    public void initTest() throws SQLException {
        MockitoAnnotations.initMocks(this);
    }

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