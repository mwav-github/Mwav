package net.mwav.qa.dao;

import net.common.dao.AbstractDAO;
import org.assertj.core.api.Assertions;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
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

import static org.mockito.Matchers.*;
import static org.mockito.Mockito.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/spring/mwav-data.xml"
        , "classpath:config/spring/mwav-mapper.xml"})
@Transactional
public class QADAOTest {

    @Autowired
    DataSource dataSource;

    @Spy
    @Autowired
    SqlSessionTemplate sqlSession;

    @InjectMocks
    QADAO dao;

    @Before
    public void initTest() throws SQLException {
        MockitoAnnotations.initMocks(this);
    }

    @Test
    public void insertQAForm_QA등록() {
        // given
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("userQuestion_id", 9999999);
        map.put("uqGroup", "-");
        map.put("uqGroupItem", "-");
        map.put("member_id", 9999);
        map.put("uqUserName", "-");
        map.put("uqUserEmail", "-");
        map.put("uqUserPw", "-");
        map.put("uqUserPhone", "-");
        map.put("uqTitle", "-");
        map.put("uqContent", "-");
        map.put("uqStatus", 10);
        map.put("uqAttachFile", "-");
        map.put("uqRelatedLink", "-");
        map.put("uqUpdateDt", null);
        map.put("uqDeleteDt", null);
        map.put("uqIpAddress", "-");
        map.put("uqOption1", "-");
        map.put("uqOption2", "-");
        map.put("uqOption3", "-");
        map.put("uqInvoker", "M");
        map.put("uqInvoker_id", 9999999);
        map.put("statistics_id", 9999999);
        map.put("uqAdminNotice", "-");

        Map<String, Object> imsimap = new HashMap<String, Object>();
        imsimap.put("QnA_id", 9999999);

        // when
        when(sqlSession.selectOne("qa.selectNextPk", map)).thenReturn(imsimap);
        String flag = dao.insertQAForm(map, null);

        // then
        Assertions.assertThat(flag).isEqualTo("9999999");
    }

    @Test
    public void selectListQAList_QA리스트페이징처리조회() {
        // given
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("member_id", "9999999");
        map.put("startRow", 0); // 시작 열
        map.put("endRow", 1); // 끝 열
        map.put("uqUserEmail", "email.@google.com");

        // when
        // 회원일 경우 리스트 조회
        final List<Map<String, Object>> memberList = dao.selectListQAList(map);

        // 비회원일 경우 리스트 조회
        map.remove("member_id");
        final List<Map<String, Object>> nonMemberList = dao.selectListQAList(map);

        // then
        Assertions.assertThat(memberList).isNotNull();
        Assertions.assertThat(nonMemberList).isNotNull();
    }

    @Test
    public void selectOneGetTotalCount_테이블의총로우수를조회함() {
        // given
        String member_id = "9999999";
        String uqUserEmail = "email.@google.com";

        // when
        // 회원일 경우 리스트 조회
        final int memberTotalCount = dao.selectOneGetTotalCount(member_id, uqUserEmail);

        // 비회원일 경우 리스트 조회
        member_id = null;
        final int nonMemberTotalCount = dao.selectOneGetTotalCount(member_id, uqUserEmail);

        // then
        Assertions.assertThat(memberTotalCount).isNotNull();
        Assertions.assertThat(nonMemberTotalCount).isNotNull();
    }

    @Test
    public void updateQAHitCnt_QA조회수증가() throws Exception {
        // given
        String member_id = "9999";
        String uqUserEmail = "email.@google.com";

        // UserQuestion_tbl에 insert
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("userQuestion_id", 9999999);
        map.put("uqGroup", "-");
        map.put("uqGroupItem", "-");
        map.put("member_id", member_id);
        map.put("uqUserName", "-");
        map.put("uqUserEmail", uqUserEmail);
        map.put("uqUserPw", "-");
        map.put("uqUserPhone", "-");
        map.put("uqTitle", "-");
        map.put("uqContent", "-");
        map.put("uqStatus", 10);
        map.put("uqAttachFile", "-");
        map.put("uqRelatedLink", "-");
        map.put("uqUpdateDt", null);
        map.put("uqDeleteDt", null);
        map.put("uqIpAddress", "-");
        map.put("uqOption1", "-");
        map.put("uqOption2", "-");
        map.put("uqOption3", "-");
        map.put("uqInvoker", "M");
        map.put("uqInvoker_id", 9999999);
        map.put("statistics_id", 9999999);
        map.put("uqAdminNotice", "-");
        map.put("startRow", 0); // 시작 열
        map.put("endRow", 10); // 끝 열

        Map<String, Object> imsimap = new HashMap<String, Object>();
        imsimap.put("QnA_id", 9999999);

        when(sqlSession.selectOne("qa.selectNextPk", map)).thenReturn(imsimap);
        dao.insertQAForm(map, null);

        // when
        // 조회수 1 증가
        dao.updateQAHitCnt(map);
        // 조회수 조회
        final List<Map<String, Object>> memberList = dao.selectListQAList(map);

        // then
        Assertions.assertThat(memberList)
                .extracting("uqViewCount")
                .containsOnly(1);
    }

    @Test
    public void selectListQAFrontList_QA페이지에서보여줄최대5개의리스트조회() {
        // given
        // UserQuestion_tbl에 insert
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("userQuestion_id", 9999999);
        map.put("uqGroup", "-");
        map.put("uqGroupItem", "-");
        map.put("member_id", "9999");
        map.put("uqUserName", "-");
        map.put("uqUserEmail", "email.@google.com");
        map.put("uqUserPw", "-");
        map.put("uqUserPhone", "-");
        map.put("uqTitle", "-");
        map.put("uqContent", "-");
        map.put("uqStatus", 10);
        map.put("uqAttachFile", "-");
        map.put("uqRelatedLink", "-");
        map.put("uqUpdateDt", null);
        map.put("uqDeleteDt", null);
        map.put("uqIpAddress", "-");
        map.put("uqOption1", "-");
        map.put("uqOption2", "-");
        map.put("uqOption3", "-");
        map.put("uqInvoker", "M");
        map.put("uqInvoker_id", 9999999);
        map.put("statistics_id", 9999999);
        map.put("uqAdminNotice", "-");
        map.put("startRow", 0); // 시작 열
        map.put("endRow", 10); // 끝 열

        Map<String, Object> imsimap = new HashMap<String, Object>();
        imsimap.put("QnA_id", 9999999);

        when(sqlSession.selectOne("qa.selectNextPk", map)).thenReturn(imsimap);
        dao.insertQAForm(map, null);

        // when
        final List<Map<String, Object>> list = dao.selectListQAFrontList(null);

        // then
        Assertions.assertThat(list).extracting("userQuestion_id").containsOnly(9999999);
    }

    @Test
    public void selectOneQAView_QA상세보기조회() {
        // given
        // UserQuestion_tbl에 insert
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("userQuestion_id", "9999999");
        map.put("uqGroup", "-");
        map.put("uqGroupItem", "-");
        map.put("member_id", "9999");
        map.put("uqUserName", "-");
        map.put("uqUserEmail", "email.@google.com");
        map.put("uqUserPw", "-");
        map.put("uqUserPhone", "-");
        map.put("uqTitle", "-");
        map.put("uqContent", "-");
        map.put("uqStatus", 10);
        map.put("uqAttachFile", "-");
        map.put("uqRelatedLink", "-");
        map.put("uqUpdateDt", null);
        map.put("uqDeleteDt", null);
        map.put("uqIpAddress", "-");
        map.put("uqOption1", "-");
        map.put("uqOption2", "-");
        map.put("uqOption3", "-");
        map.put("uqInvoker", "M");
        map.put("uqInvoker_id", 9999999);
        map.put("statistics_id", 9999999);
        map.put("uqAdminNotice", "-");

        Map<String, Object> imsimap = new HashMap<String, Object>();
        imsimap.put("QnA_id", 9999999);

        when(sqlSession.selectOne("qa.selectNextPk", map)).thenReturn(imsimap);
        dao.insertQAForm(map, null);

        // when
        when(sqlSession.selectOne("qa.selectOneQAUaView", map)).thenReturn(null);
        when(sqlSession.update("qa.updateUABeReadDt", null)).thenReturn(0);
        when(sqlSession.selectOne("qa.selectOneMAXQAView")).thenReturn(0);

        final Map<String, Object> result = dao.selectOneQAView(map);

        // then
        Assertions.assertThat(result)
                .extracting("userQuestion_id")
                .isEqualTo(9999999);
    }

    @Test
    public void selectOneQALogin() {
        // given

        // when

        // then
    }

    @Test
    public void uaSatisfactionUpdateAjax() {
        // given

        // when

        // then
    }
}