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

    @Before
    public void initTest() throws SQLException {
        MockitoAnnotations.initMocks(this);
    }

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