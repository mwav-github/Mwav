package net.mwav.member.dao;

import net.admins.dao.AdminPromoterDAO;
import net.common.common.CommandMap;
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
import java.util.Map;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/spring/mwav-data.xml"
        , "classpath:config/spring/mwav-mapper.xml"})
@Transactional
public class MemberDAOTest {

    @Autowired
    DataSource dataSource;

    @Spy
    @Autowired
    SqlSessionTemplate sqlSession;

    @InjectMocks
    MemberDAO dao;

    @Before
    public void initTest() throws SQLException {
        MockitoAnnotations.initMocks(this);
    }

    @Test
    public void selectNextSnsPk_SNS회원가입시_pk호출() {
        // given

        // when
        String snsPk = dao.selectNextSnsPk();

        // then
        Assertions.assertThat(snsPk).isNotNull();
    }
}