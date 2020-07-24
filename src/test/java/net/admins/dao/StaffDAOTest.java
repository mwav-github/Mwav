package net.admins.dao;

import net.common.common.CommandMap;
import org.assertj.core.api.Assertions;
import org.assertj.core.groups.Tuple;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.MockitoAnnotations;
import org.mockito.Spy;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import javax.sql.DataSource;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

/*
    Mybatis SQL Mapper 테스트
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/spring/mwav-data.xml"
                                 , "classpath:config/spring/mwav-mapper.xml"})
@Transactional
public class StaffDAOTest {

    @Autowired
    DataSource dataSource;

    @Spy @Autowired
    SqlSessionTemplate sqlSession;

    @InjectMocks
    StaffDAO dao;

    @Before
    public void initTest() throws SQLException {
        MockitoAnnotations.initMocks(this);
    }

    @Test
    public void insertPromoter_tbl_프로모터_회원가입() throws SQLException {
        // given
        CommandMap commandMap = new CommandMap();
        commandMap.put("pmtLoginId", "TestpmtLoginId");
        commandMap.put("pmtLoginPw", "TestpmtLoginPw");
        commandMap.put("pmtName", "TestpmtName");
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
        String promoter_id = sqlSession.selectOne("staff.selectOnePmtLoginId", commandMap.get("pmtLoginId"));
        Assertions.assertThat(promoter_id).isNotNull();
    }

    @Test
    public void insertPromoterSpecialty_tbl_프로모터_회원가입_전문분야() throws SQLException {
        // given
        // Promoter_tbl
        CommandMap commandMap = new CommandMap();
        commandMap.put("pmtLoginId", "TestpmtLoginId");
        commandMap.put("pmtLoginPw", "TestpmtLoginPw");
        commandMap.put("pmtName", "TestpmtName");
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
        String promoter_id = sqlSession.selectOne("staff.selectOnePmtLoginId", commandMap.get("pmtLoginId"));
        List result = dao.selectPmtSpecialtyNames(promoter_id);
        Assertions.assertThat(result)
                .hasSize(2)
                    .extracting("pmtSpecialtyName", "pmtSpecialtyLevel")
                    .containsOnly(Tuple.tuple("반려동물용품", null)
                                , Tuple.tuple("헬스/건강식품", null)
                                );
    }

    @Test
    public void selectPmtView_프로모터_조회() {
        // given
        CommandMap commandMap = new CommandMap();
        commandMap.put("pmtLoginId", "TestpmtLoginId");
        commandMap.put("pmtLoginPw", "TestpmtLoginPw");
        commandMap.put("pmtName", "TestpmtName");
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
        String promoter_id = sqlSession.selectOne("staff.selectOnePmtLoginId", commandMap.get("pmtLoginId"));
        Map<String, Object> map = dao.selectPmtView(promoter_id);

        // then
        Assertions.assertThat(map)
                .extractingByKey("pmtLoginId")
                .isEqualTo("TestpmtLoginId");
    }

    @Test
    public void insertPromoterChannel_tbl() {
        // given
        // Promoter_tbl
        CommandMap commandMap = new CommandMap();
        commandMap.put("pmtLoginId", "TestpmtLoginId");
        commandMap.put("pmtLoginPw", "TestpmtLoginPw");
        commandMap.put("pmtName", "TestpmtName");
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
        String promoter_id = sqlSession.selectOne("staff.selectOnePmtLoginId", commandMap.get("pmtLoginId"));
        Map<String, Object> map = dao.selectPmtView(promoter_id);

        Assertions.assertThat(map)
                .extractingByKey("pmtChannelId")
                .isEqualTo("test");
    }
}