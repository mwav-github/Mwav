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

/**
 * <pre>
 * {@code
 *  <p>멤버 DB 연동 테스트</p>
 * }
 * </pre>
 * @author 공태현
 * @since 1.0.1
 * @version 1.0.0
 * @see net.common.common.AccountEmailCertify
 *
 */
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

    /**
     * <pre>
     * {@code
     *      <p>@InjectMocks 어노테이션을 활성화시키기 위한 설정</p>
     *      <p>MemberDAOTest 클래스 하위의 모든 테스크케이스들은 매번 실행시 마다 initTest 메소드를 실행하게 된다.</p>
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
     *      <p>SNS 회원가입시 PK를 가져오기 위한 테스트</p>
     * }
     * </pre>
     * @param
     * @return void
     * @throws
     * @see MemberDAOTest.selectNextSnsPk
     * @since 1.0.1
     * @version 1.0.0
     */
    @Test
    public void selectNextSnsPk_SNS회원가입시_pk호출() {
        // given

        // when
        String snsPk = dao.selectNextSnsPk();

        // then
        Assertions.assertThat(snsPk).isNotNull();
    }
}