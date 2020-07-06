package net.admins.dao;

import net.common.common.CommandMap;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import javax.sql.DataSource;
import java.sql.SQLException;

import static org.hamcrest.core.Is.is;
import static org.junit.Assert.assertThat;

/*
    Mybatis SQL Mapper 테스트
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/spring/mwav-data.xml"
                                 , "classpath:config/spring/mwav-mapper.xml"})
public class StaffDAOTest {

    @Autowired
    DataSource dataSource;

    @Autowired
    SqlSessionTemplate sqlSession;

    @Autowired
    DataSourceTransactionManager transactionManager;

    @Before
    public void initTest() throws SQLException {
        /*
            Mybatis 스프링 연동 모듈은 스프링의 SqlSession에 주입하기 때문에
            스프링이 항상 트랜잭션을 관리하기 때문에 별도로 트랜잭션을 처리해주어야함

            https://mybatis.org/spring/ko/transactions.html
        */
        TransactionStatus status = transactionManager.getTransaction(new DefaultTransactionDefinition());
        insertPromoter_tbl(status);
    }

    @After
    public void closeTest() {
        TransactionStatus status = transactionManager.getTransaction(new DefaultTransactionDefinition());

        // 모든 테스트가 끝이 난다면 롤백으로 초기화시킴
        transactionManager.rollback(status);
    }

    /*
        프로모터 테스트를 위해서는 필수적으로 Promoter_tbl에 1개의 row가 필요함
     */
    public void insertPromoter_tbl(TransactionStatus status) {
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

        int result = sqlSession.insert("staff.insertPromoter_tbl", commandMap.getMap());
        assertThat(result, is(1));
    }

    @Test
    public void insertPromoterSpecialty_tbl() throws SQLException {
        String[] pmtSpecialtyName = new String[]{"반려동물용품","자동차용품", "가전디지털"};
        String pmtLoginId = "TestpmtLoginId";

        CommandMap commandMap = new CommandMap();
        commandMap.put("pmtLoginId", pmtLoginId);
        commandMap.put("pmtSpecialtyName", pmtSpecialtyName);

        int result = sqlSession.insert("staff.insertPromoterSpecialty_tbl", commandMap.getMap());
        assertThat(result, is(pmtSpecialtyName.length));

    }

}