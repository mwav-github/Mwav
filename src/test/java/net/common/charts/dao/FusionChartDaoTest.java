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

    @Before
    public void initTest() throws SQLException {
        MockitoAnnotations.initMocks(this);
    }

    @Test
    public void selectWeeklyUsersList_주간사용자접속차트조회() {
        // given

        // when
        final List<FusionChartVo> list = dao.selectWeeklyUsersList(null);

        // then
        Assertions.assertThat(list).isNotNull();
    }

    @Test
    public void selectTop10PageList() {
        // given

        // when
        final List<FusionChartVo> list = dao.selectTop10PageList(null);

        // then
        Assertions.assertThat(list).isNotNull();

    }

    @Test
    public void selectClientScreenSizeList() {
        // given

        // when
        final List<FusionChartVo> list = dao.selectClientScreenSizeList(null);

        // then
        Assertions.assertThat(list).isNotNull();

    }
}