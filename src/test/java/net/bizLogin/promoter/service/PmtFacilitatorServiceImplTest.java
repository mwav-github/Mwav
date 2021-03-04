package net.bizLogin.promoter.service;

import net.bizLogin.promoter.dao.PmtFacilitatorDAO;
import net.common.common.CommandMap;
import org.assertj.core.api.Assertions;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.runners.MockitoJUnitRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.Map;

import static org.mockito.Matchers.any;
import static org.mockito.Matchers.anyString;
import static org.mockito.Mockito.doNothing;
import static org.mockito.Mockito.when;

/**
 * <pre>
 * {@code
 *  <p>BizLogin 멤버 비즈니스 로직 테스트케이스</p>
 * }
 * </pre>
 * @author 공태현
 * @since 1.0.4
 * @version 1.0.0
 * @see net.bizLogin.promoter.service.PmtFacilitatorService
 */
@Transactional
@RunWith(MockitoJUnitRunner.class)
public class PmtFacilitatorServiceImplTest {

    @InjectMocks
    private PmtFacilitatorServiceImpl service;

    @Mock
    PmtFacilitatorDAO dao;

    // 테스트 멤버 파라미터
    private CommandMap commandMap;

    /**
     * <pre>
     * {@code
     *      <p>각각의 테스트케이스마다 테스트에 사용할 멤버 파라미터를 생성</p>
     * }
     * </pre>
     * @param
     * @return void
     * @throws
     * @see
     * @since 1.0.4
     * @version 1.0.0
     */
    @Before
    public void testParameterMember(){
        this.commandMap = new CommandMap();
        this.commandMap.put("pmtLoginId", "mwavtest");       // 아이디
        this.commandMap.put("pmtLoginPw", "mwav123!!");       // 비밀번호
        this.commandMap.put("pmtCellularPhone", "010-2866-2352"); // 핸드폰 번호
        this.commandMap.put("pmtMail", "mwavtest@gmail.com");          // 이메일
        this.commandMap.put("pmtGender", "M");        // 성별
        this.commandMap.put("pmtFirstName", "공");     // 첫번째 이름
        this.commandMap.put("pmtLastName", "태현");      // 이름
    }

    /**
     * <pre>
     * {@code
     *      <p>멤버 회원가입시 아이디 중복에 따른 결과 테스트</p>
     * }
     * </pre>
     * @param
     * @return void
     * @throws IOException
     * @see PmtFacilitatorService.insertPmtForm
     * @since 1.0.4
     * @version 1.0.0
     */
    @Test
    public void insertPmtForm_DUPLICATED() throws Exception {
        // given

        // when
        // 멤버 로그인시 중복된 아이디가 1개 존재한다.
        when(dao.selectOnePmtLoginIdCheck(anyString())).thenReturn(1);

        // 비즈니스 로직 테스트 이기 떄문에 insert 는 무시한다.
        doNothing().when(dao).insertPromoter_tbl(any());
        doNothing().when(dao).insertPromoterValue_tbl(any());
        doNothing().when(dao).insertPromoterValueLog_tbl(any());

        // service를 실행하여 결과를 반환한다.
        final Map<String, Object> map = service.insertPmtForm(this.commandMap);

        // then
        // 반환된 결과 map의 키와 값이 containsOnly에 들어가야한다.
        Assertions.assertThat(map)
                .extracting("result", "message")
                .containsOnly("31", "DUPLICATED");
    }

    /**
     * <pre>
     * {@code
     *      <p>멤버 회원가입시 유효하지않은 값이 넘겨왔을때 테스트</p>
     * }
     * </pre>
     * @param
     * @return void
     * @throws IOException
     * @see PmtFacilitatorService.insertPmtForm
     * @since 1.0.4
     * @version 1.0.0
     */
    @Test
    public void insertPmtForm_INVALID() throws Exception {
        // given
        // 입력받아온 pmtLoginId값이 한글이라 유효성조건에 일치하지않는 경우
        commandMap.put("pmtLoginId", "엠웨이브");

        // when
        // 멤버 로그인시 중복된 아이디는 없다.(정상)
        when(dao.selectOnePmtLoginIdCheck(anyString())).thenReturn(0);

        // 비즈니스 로직 테스트 이기 떄문에 insert 는 무시한다.
        doNothing().when(dao).insertPromoter_tbl(any());
        doNothing().when(dao).insertPromoterValue_tbl(any());
        doNothing().when(dao).insertPromoterValueLog_tbl(any());

        // service를 실행하여 결과를 반환한다.
        final Map<String, Object> map = service.insertPmtForm(this.commandMap);

        // then
        // 반환된 결과 map의 키와 값이 containsOnly에 들어가야한다.
        Assertions.assertThat(map)
                .extracting("result", "message")
                .containsOnly("42", "INVALID");
    }

    /**
     * <pre>
     * {@code
     *      <p>멤버 회원가입이 정상적으로 진행됐을때를 확인</p>
     * }
     * </pre>
     * @param
     * @return void
     * @throws IOException
     * @see PmtFacilitatorService.insertPmtForm
     * @since 1.0.4
     * @version 1.0.0
     */
    @Test
    public void insertPmtForm_SUCCESS() throws Exception {
        // given
        Map<String, Object> pmtMap = new HashMap<String, Object>();
        pmtMap.put("pmtLoginId", (String) commandMap.get("pmtLoginId"));

        // when
        // 멤버 로그인시 중복된 아이디는 없다.(정상)
        when(dao.selectOnePmtLoginIdCheck(anyString())).thenReturn(0);

        // service를 실행하여 결과를 반환한다.
        final Map<String, Object> map = service.insertPmtForm(this.commandMap);

        // 비즈니스 로직 테스트 이기 떄문에 insert 는 무시한다.
        doNothing().when(dao).insertPromoter_tbl(any());
        doNothing().when(dao).insertPromoterValue_tbl(any());
        doNothing().when(dao).insertPromoterValueLog_tbl(any());

        // then
        // 반환된 결과 map의 키와 값이 containsOnly에 들어가야한다.
        // INSERT가 됐는지에 대한 검사는 DAO 단위 테스트에서 진행해야한다.
        Assertions.assertThat(map)
                .extracting("result", "message")
                .containsOnly("1", "SUCCESS");
    }
}