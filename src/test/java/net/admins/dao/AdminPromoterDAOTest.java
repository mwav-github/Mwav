package net.admins.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.assertj.core.api.Assertions;
import org.assertj.core.groups.Tuple;
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

import net.common.common.CommandMap;

/**
 * <pre>
 * {@code
 *  <p>관리자페이지의 프로모터쪽 DB CRUD 테스트</p>
 * }
 * </pre>
 * @author 공태현
 * @since 1.0.1
 * @version 1.0.0
 * @see net.admins.dao.AdminPromoterDAO
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/spring/mwav-data.xml"
                                 , "classpath:config/spring/mwav-mapper.xml"})
@Transactional
public class AdminPromoterDAOTest {

    @Autowired
    DataSource dataSource;

    @Spy @Autowired
    SqlSessionTemplate sqlSession;

    @InjectMocks
    AdminPromoterDAO dao;

    /**
     * <pre>
     * {@code
     *      <p>@InjectMocks 어노테이션을 활성화시키기 위한 설정</p>
     *      <p>AdminPromoterDAO 클래스 하위의 모든 테스크케이스들은 매번 실행시 마다 initTest 메소드를 실행하게 된다.</p>
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
     *      <p>프로모터 회원가입 INSERT 쿼리가 정상적으로 됐는지 테스트</p>
     * }
     * </pre>
     * @param
     * @return void
     * @throws SQLException
     * @see AdminPromoterDAO.insertPromoter_tbl
     * @since 1.0.1
     * @version 1.0.0
     */
    @Test
    public void insertPromoter_tbl_프로모터_회원가입() throws SQLException {
        // given
        CommandMap commandMap = new CommandMap();
        commandMap.put("pmtLoginId", "TestpmtLoginId");
        commandMap.put("pmtLoginPw", "TestpmtLoginPw");
        commandMap.put("pmtName", "TestpmtName");
        commandMap.put("pmtFirstName", "kong");
        commandMap.put("pmtLastName", "taehyun");
        commandMap.put("pmtGender", "남성");
        commandMap.put("pmtNickname", "TestpmtNickname");
        commandMap.put("pmtCellularPhone", "01011112222");
        commandMap.put("pmtMail", "TestpmtMail@mwav.net");
        commandMap.put("pmtZipcode", "0000");
        commandMap.put("pmtAddress", "TestpmtAddress");
        commandMap.put("pmtAddressDetail", "TestpmtAddressDetail");
        commandMap.put("pmtMark", "TestpmtMark");

        // when
        dao.insertPromoter_tbl(commandMap);

        // then
        String promoter_id = sqlSession.selectOne("staffPromoter.selectOnePmtLoginId", commandMap.get("pmtLoginId"));
        Assertions.assertThat(promoter_id).isNotNull();
    }

    /**
     * <pre>
     * {@code
     *      <p>프로모터의 전문분야 리스트 쿼리가 정상적으로 불러와지는지 테스트</p>
     * }
     * </pre>
     * @param
     * @return void
     * @throws SQLException
     * @see AdminPromoterDAO.insertPromoterSpecialty_tbl
     * @since 1.0.1
     * @version 1.0.0
     */
    @Test
    public void insertPromoterSpecialty_tbl_프로모터_회원가입_전문분야() throws SQLException {
        // given
        // Promoter_tbl
        CommandMap commandMap = new CommandMap();
        commandMap.put("pmtLoginId", "TestpmtLoginId");
        commandMap.put("pmtLoginPw", "TestpmtLoginPw");
        commandMap.put("pmtFirstName", "kong");
        commandMap.put("pmtLastName", "taehyun");
        commandMap.put("pmtGender", "남성");
        commandMap.put("pmtNickname", "TestpmtNickname");
        commandMap.put("pmtCellularPhone", "01011112222");
        commandMap.put("pmtMail", "TestpmtMail@mwav.net");
        commandMap.put("pmtZipcode", "0000");
        commandMap.put("pmtAddress", "TestpmtAddress");
        commandMap.put("pmtAddressDetail", "TestpmtAddressDetail");
        commandMap.put("pmtMark", "TestpmtMark");

        // PromoterSpecialty_tbl
        commandMap.put("pmtSpecialtyName", new String[]{"반려동물용품", "헬스/건강식품"});

        // when
        dao.insertPromoter_tbl(commandMap);
        dao.insertPromoterSpecialty_tbl(commandMap);

        // then
        String promoter_id = sqlSession.selectOne("staffPromoter.selectOnePmtLoginId", commandMap.get("pmtLoginId"));
        List<?> result = dao.selectPmtSpecialtyNames(promoter_id);
        Assertions.assertThat(result)
                .hasSize(2)
                    .extracting("pmtSpecialtyName", "pmtSpecialtyLevel")
                    .containsOnly(Tuple.tuple("반려동물용품", null)
                                , Tuple.tuple("헬스/건강식품", null)
                                );
    }

    /**
     * <pre>
     * {@code
     *      <p>프로모터 상세정보가 DB에서 정상적으로 불러와지는지 테스트</p>
     * }
     * </pre>
     * @param
     * @return void
     * @throws
     * @see AdminPromoterDAO.selectPmtView
     * @since 1.0.1
     * @version 1.0.0
     */
    @Test
    public void selectPmtView_프로모터_조회() {
        // given
        CommandMap commandMap = new CommandMap();
        commandMap.put("pmtLoginId", "TestpmtLoginId");
        commandMap.put("pmtLoginPw", "TestpmtLoginPw");
        commandMap.put("pmtFirstName", "kong");
        commandMap.put("pmtLastName", "taehyun");
        commandMap.put("pmtGender", "남성");
        commandMap.put("pmtNickname", "TestpmtNickname");
        commandMap.put("pmtCellularPhone", "01011112222");
        commandMap.put("pmtMail", "TestpmtMail@mwav.net");
        commandMap.put("pmtZipcode", "0000");
        commandMap.put("pmtAddress", "TestpmtAddress");
        commandMap.put("pmtAddressDetail", "TestpmtAddressDetail");
        commandMap.put("pmtMark", "TestpmtMark");

        // when
        dao.insertPromoter_tbl(commandMap);
        String promoter_id = sqlSession.selectOne("staffPromoter.selectOnePmtLoginId", commandMap.get("pmtLoginId"));
        Map<String, Object> map = dao.selectPmtView(promoter_id);

        // then
        Assertions.assertThat(map)
                .extractingByKey("pmtLoginId")
                .isEqualTo("TestpmtLoginId");
    }

    /**
     * <pre>
     * {@code
     *      <p>프로모터 채널 데이터가 정상적으로 INSERT 됐는지 테스트</p>
     * }
     * </pre>
     * @param
     * @return void
     * @throws
     * @see AdminPromoterDAO.insertPromoterChannel_tbl
     * @since 1.0.1
     * @version 1.0.0
     */
    @Test
    public void insertPromoterChannel_tbl() {
        // given
        // Promoter_tbl
        CommandMap commandMap = new CommandMap();
        commandMap.put("pmtLoginId", "TestpmtLoginId");
        commandMap.put("pmtLoginPw", "TestpmtLoginPw");
        commandMap.put("pmtFirstName", "kong");
        commandMap.put("pmtLastName", "taehyun");
        commandMap.put("pmtGender", "남성");
        commandMap.put("pmtNickname", "TestpmtNickname");
        commandMap.put("pmtCellularPhone", "01011112222");
        commandMap.put("pmtMail", "TestpmtMail@mwav.net");
        commandMap.put("pmtZipcode", "0000");
        commandMap.put("pmtAddress", "TestpmtAddress");
        commandMap.put("pmtAddressDetail", "TestpmtAddressDetail");
        commandMap.put("pmtMark", "TestpmtMark");

        // PromoterChannel_tbl
        commandMap.put("pmtChannelType", "Youtube");
        commandMap.put("pmtChannelId", "test");
        commandMap.put("pmtChannelName", "채널테스트");
        commandMap.put("pmtChannelDesc", "채널설명테스트");
        commandMap.put("pmtChannelURL", "http://www.youtube.com/test");
        commandMap.put("pmtChannelMember", 3000);
        commandMap.put("pmtChannelDaillyVisit", 2000);

        // when
        dao.insertPromoter_tbl(commandMap);
        dao.insertPromoterChannel_tbl(commandMap);

        // then
        String promoter_id = sqlSession.selectOne("staffPromoter.selectOnePmtLoginId", commandMap.get("pmtLoginId"));
        Map<String, Object> map = dao.selectPmtView(promoter_id);

        Assertions.assertThat(map)
                .extractingByKey("pmtChannelId")
                .isEqualTo("test");
    }
}