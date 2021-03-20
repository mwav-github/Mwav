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

/**
 * <pre>
 * {@code
 *  <p>멤버 로그인 DB 연동 테스트</p>
 * }
 * </pre>
 * @author 공태현
 * @since 1.0.1
 * @version 1.0.0
 * @see net.mwav.login.dao.LoginDAO
 *
 */
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

    /**
     * <pre>
     * {@code
     *      <p>@InjectMocks 어노테이션을 활성화시키기 위한 설정</p>
     *      <p>LoginDAOTest 클래스 하위의 모든 테스크케이스들은 매번 실행시 마다 initTest 메소드를 실행하게 된다.</p>
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
     *      <p>유저가 로그인 했을때 비밀번호 변경 기한 이 넘어가는지 테스트</p>
     * }
     * </pre>
     * @param
     * @return void
     * @throws Exception
     * @see LoginDAOTest.getUpdatePwYN
     * @since 1.0.1
     * @version 1.0.0
     */
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