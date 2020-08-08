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

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:config/spring/mwav-data.xml")
public class DBConnectionTest {

    @Autowired
    DataSource dataSource;

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
