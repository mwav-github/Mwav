package net.common.common;

import net.mwav.common.module.MailLib;
import net.mwav.common.module.SecurityLib;
import net.promoter.dao.PromoterDAO;
import org.junit.Before;
import org.junit.Ignore;
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
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.view.velocity.VelocityConfigurer;

import javax.mail.Message;
import javax.servlet.ServletContext;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.Date;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

/**
 * <pre>
 * {@code
 *  <p>이메일 인증 테스트</p>
 * }
 * </pre>
 * @author 공태현
 * @since 1.0.1
 * @version 1.0.0
 * @see net.common.common.AccountEmailCertify
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/spring/mwav-mvc.xml"
                                    , "classpath:config/spring/mwav-data.xml"
                                    , "classpath:config/spring/mwav-mapper.xml"
                                    , "classpath:config/spring/mwav-common.xml"})
@WebAppConfiguration
public class AccountEmailCertifyTest {

    @Mock
    PromoterDAO promoterDAO;

    @Spy @Autowired
    ServletContext servletContext;

    @Spy @Autowired
    VelocityConfigurer velocityConfig;

    @InjectMocks
    AccountEmailCertify controller;

    MockMvc mockMvc;

    @Autowired
    SqlSessionTemplate sqlSession;

    /**
     * <pre>
     * {@code
     *      <p>AccountEmailCertify 컨트롤러의 핸들링을 MockMvc 객체로 생성하기 위한 setup</p>
     *      <p>AccountEmailCertify 클래스 하위의 모든 테스크케이스들은 매번 실행시 마다 setup 메소드를 실행하게 된다.</p>
     * }
     * </pre>
     * @param
     * @return void
     * @throws
     * @see MockMvc
     * @since 1.0.1
     * @version 1.0.0
     */
    @Before
    public void setup(){
        MockitoAnnotations.initMocks(this);

        assertThat(controller).isNotNull();
        mockMvc = MockMvcBuilders.standaloneSetup(controller).build();
    }

    /**
     * <pre>
     * {@code
     *     이메일 테스트를 위해 이메일 발송를 Mock으로 대체해야하지만
     *     MailLib는 Bill Pugh Singleton 패턴으로 이루어져 있기 때문에
     *     inner class, private, final을 무시하는 reflection 기술로
     *     runtime에 MailLib.MailLibSingleton.instance의 값을 mock으로 수정함
     * }
     * </pre>
     * @param
     * @return void
     * @throws Exception
     * @see net.mwav.common.module.MailLib
     * @since 1.0.1
     * @version 1.0.0
     */
    private void makeMockMailLib() throws Exception {
        //구현된 mock객체를 미리 선언
        MailLib mailLib = spy(MailLib.getInstance());

        //MailLib 하위에 있는 MailLibSingleton 클래스를 찾음
        Class<?> declaredClass = MailLib.class.getDeclaredClasses()[0];

        //MailLib의 하위의 private static class MailLibSingleton 클래스의 instance 필드를 찾음
        final Field field = declaredClass.getDeclaredField("instance");

        //private 객체에 액세스하기 위해 SecurityManager 허용 요청
        field.setAccessible(true);

        //final 객체를 수정하기 위해 리플렉션 객체를 수정함
        final Field modifiers = Field.class.getDeclaredField("modifiers");
        modifiers.setAccessible(true);
        modifiers.setInt(field, field.getModifiers() & ~Modifier.FINAL);

        //MailLib.MailLibSingleton.instance의 값을 mock으로 수정
        field.set(MailLib.class, mock(MailLib.class));

        //mailLib.send 호출 시 무시한다.
        doNothing().when(mailLib).send(any(Message.class));
    }

    /**
     * <pre>
     * {@code
     *      <p>테스트를 위해 이메일 발송은 Mock으로 대체하여 무시하고
     *          만약 이메일이 정상적으로 발송되었다면 발송여부를 JSON으로 반환되는지 확인</p>
     * }
     * </pre>
     * @param
     * @return void
     * @throws Exception
     * @see AccountEmailCertify.certify
     * @since 1.0.1
     * @version 1.0.0
     */
    @Test
    public void certify_이메일_발송_및_이메일_확인_페이지로_포워딩() throws Exception {
        //given
        makeMockMailLib();
        final String id = "testPmtId";
        final String account = "pmt";
        final String email = "testEmail@naver.com";

        //when
        when(promoterDAO.selectChkPmtCertifyDtYN(id)).thenReturn("N");   //pmtCertifyDt 의 값이 null 인 유저

        //then
        mockMvc.perform(get("/accounts/email/certify")
                        .param("email", email)
                        .param("id", id)
                        .param("account", account))
                .andDo(print())
                .andExpect(status().isOk())
                .andExpect(content().string("{\"msg\":\"인증 메일을 발송하였습니다.\",\"status\":\"SEND_MAIL\"}"));
    }

    /**
     * <pre>
     * {@code
     *      <p>이메일를 수신받은 유저가 이메일인증을 클릭했을때 DB에 정상적으로 인증여부가 체크되는지 테스트</p>
     * }
     * </pre>
     * @param
     * @return void
     * @throws Exception
     * @see AccountEmailCertify.authority
     * @since 1.0.1
     * @version 1.0.0
     */
    @Test
    public void authority_이메일_인증_후_인증완료_체크() throws Exception {
        //given
        final String testEncryptKey = "EncryptKey";
        final String account = "pmt";
        final String id = "testPmtId";

        SecurityLib securityLib = SecurityLib.getInstance();
        String encryptAccount = securityLib.encryptToString(testEncryptKey, "account", account);
        String encryptId = securityLib.encryptToString(testEncryptKey, "id", id);
        String encryptTime = securityLib.encryptToString(testEncryptKey, "time", String.valueOf(new Date().getTime()));

        String encryptQuery = securityLib.encryptToString(testEncryptKey, "total", encryptAccount + encryptId + encryptTime);
        encryptQuery = encryptQuery.replaceAll("/","~");

        //when
        when(promoterDAO.selectChkPmtCertifyDtYN(id)).thenReturn("N");   //pmtCertifyDt 의 값이 null 인 유저
        when(promoterDAO.updatePmtCertifyDt(anyString())).thenReturn(1);

        //then
        mockMvc.perform(get("/accounts/email/authority/" + encryptQuery))
                .andExpect(status().isOk())
                .andExpect(model().attribute("msg", "이메일 인증되었습니다."))
                .andDo(print());
    }

    /**
     * <pre>
     * {@code
     *      <p>유저에게 이메일 인증 후 인증여부 확인 하는 테스트</p>
     * }
     * </pre>
     * @param
     * @return void
     * @throws Exception
     * @see AccountEmailCertify.authority
     * @since 1.0.1
     * @version 1.0.0
     */
    @Ignore
    @Transactional
    @Test
    public void 이메일_인증할_유저가_존재하는지_인증됐는지_여부(){
        // given
        // PromoterValue_tbl Dump Data Insert
        String pmtLoginId = "TestpmtLoginId";

        CommandMap commandMap = new CommandMap();
        commandMap.put("pmtLoginId", pmtLoginId);
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

        commandMap.put("promoter_id", "999999");
        commandMap.put("Promoter_tbl_promoter_id", "999999");

        sqlSession.insert("staffPromoter.insertPromoter_tbl", commandMap.getMap());
        sqlSession.insert("staffPromoter.insertPromoterValue_tbl", commandMap.getMap());

        String promoter_id = sqlSession.selectOne("staffPromoter.selectOnePmtLoginId", pmtLoginId);
        sqlSession.update("promoter.updatePmtCertifyDt", pmtLoginId);

        // when

        // then
        final String pmtCertifyDt = sqlSession.selectOne("promoter.selectChkPmtCertifyDtYN", promoter_id);
        assertThat(pmtCertifyDt).isEqualTo("Y");
    }

}
