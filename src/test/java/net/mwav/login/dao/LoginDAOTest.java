package net.mwav.login.dao;

import net.mwav.member.dao.MemberDAO;
import net.mwav.member.vo.Member_tbl_VO;
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
import java.util.Map;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/spring/mwav-data.xml"
        , "classpath:config/spring/mwav-mapper.xml"})
@Transactional
public class LoginDAOTest {

    @Autowired
    DataSource dataSource;

    @Spy
    @Autowired
    SqlSessionTemplate sqlSession;

    @InjectMocks
    LoginDAO dao;

    @InjectMocks
    MemberDAO memberDAO;

    @Before
    public void initTest() throws SQLException {
        MockitoAnnotations.initMocks(this);
    }

    @Test
    public void getUpdatePwYN_비밀번호_변경기한_여부() throws Exception {
        // given
        int member_id = 1;
        Member_tbl_VO vo = new Member_tbl_VO();
        vo.setMember_id(member_id);

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("member_id", member_id);
        memberDAO.insertMemberValue(map);

        // when
        int pwYN = dao.getUpdatePwYN(vo);

        // then
        assertNotNull(pwYN);
    }
}