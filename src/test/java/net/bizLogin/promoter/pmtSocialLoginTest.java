package net.bizLogin.promoter;

import com.fasterxml.jackson.databind.ObjectMapper;
import net.bizLogin.promoter.auth.PmtNaverUrl;
import net.bizLogin.promoter.dao.PmtFacilitatorDAO;
import net.bizLogin.promoter.service.PmtFacilitatorServiceImpl;
import net.bizLogin.promoter.vo.PmtFacilitatorVO;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.runners.MockitoJUnitRunner;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.Map;

@Transactional
@RunWith(MockitoJUnitRunner.class)
@Configuration
@PropertySource("classpath:googleProperties/application.properties")
public class pmtSocialLoginTest {

    @InjectMocks
    private PmtFacilitatorServiceImpl service;

    @Mock
    PmtFacilitatorDAO dao;

    @Inject
    PmtNaverUrl pmtNaverUrl;

    @Before
    public void before() {

    }

    @Value("${promoter.naver.clientId}")
    private String clientId;
    @Value("${promoter.naver.clientSecret}")
    private String clientSecret;
    @Value("${promoter.naver.callbackUrl}")
    private String callbackUrl;

    @Test
    public void propertiesPrint() {
        System.out.println("clientId = " + clientId);
        System.out.println("clientSecret = " + clientSecret);
        System.out.println("callbackUrl = " + callbackUrl);
    }

    @Test
    public void 테스트() throws Exception {
        ObjectMapper mapper = new ObjectMapper();
        String result = "{\"resultcode\":\"00\",\"message\":\"success\",\"response\":{\"id\":\"53541691\",\"email\":\"szdbsyyszs@naver.com\",\"name\":\"\\uc724\\uc601\\uc120\"}}";

        Map<String, Object> resultMap = mapper.readValue(result, Map.class);

        System.out.println("resultMap = " + resultMap);

        Map<String, Object> response = (Map<String, Object>) resultMap.get("response");

        System.out.println("response = " + response);

        PmtFacilitatorVO vo = service.selectPmtFacLogin(response);

        if (vo == null) {
            Map<String, Object> map = new HashMap<>();
            map.put("pmtLoginId", response.get("id"));
            map.put("name", response.get("name"));
            map.put("email", response.get("email"));
//            Map<String, Object> insertResultMap = service.insertPmtForm(map);
//            System.out.println("insertResultMap = " + insertResultMap);
        }else{
            service.selectPmtFacLogin(response);
        }
    }
}
