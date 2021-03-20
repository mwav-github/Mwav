package net.mwav.common.module;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import static org.hamcrest.core.Is.is;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertThat;

/**
 * <pre>
 * {@code
 *  <p>DB 연결 및 연동 테스트</p>
 * }
 * </pre>
 * @author 공태현
 * @since 1.0.1
 * @version 1.0.0
 * @see net.common.common.AccountEmailCertify
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:config/spring/mwav-data.xml")
public class DBConnectionTest {

    @Autowired
    DataSource dataSource;

    /**
     * <pre>
     * {@code
     *      <pre>DB 연동 테스트</pre>
     * }
     * </pre>
     * @param
     * @return void
     * @throws SQLException
     * @see DBConnectionTest.connectDB
     * @since 1.0.1
     * @version 1.0.0
     */
    @Test
    public void connectDB() throws SQLException {
        int queryResult = 0;
        assertNotNull("DataSource is Null", dataSource);

        try(Connection conn = dataSource.getConnection()){
            PreparedStatement preparedStatement = conn.prepareStatement("SELECT 1 FROM DUAL");
            ResultSet resultSet = preparedStatement.executeQuery();

            while(resultSet.next()){
                queryResult = resultSet.getInt(1);
            }

        }

        assertThat(queryResult, is(1));
    }
}
