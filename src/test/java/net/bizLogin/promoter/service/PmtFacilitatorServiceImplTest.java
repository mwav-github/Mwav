package net.bizLogin.promoter.service;

import net.bizLogin.promoter.dao.PmtFacilitatorDAO;
import net.common.common.CommandMap;
import org.assertj.core.api.Assertions;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.runners.MockitoJUnitRunner;
import org.springframework.transaction.annotation.Transactional;

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
        // 테스트 멤버 파라미터
        CommandMap commandMap = new CommandMap();
        commandMap.put("pmtLoginId", "mwavtest");       // 아이디
        commandMap.put("pmtLoginPw", "mwav123!!");       // 비밀번호
        commandMap.put("pmtCellularPhone", "010-2866-2352"); // 핸드폰 번호
        commandMap.put("pmtMail", "mwavtest@gmail.com");          // 이메일
        commandMap.put("pmtGender", "M");        // 성별
        commandMap.put("pmtFirstName", "공");     // 첫번째 이름
        commandMap.put("pmtLastName", "태현");      // 이름

        // when
        // 멤버 로그인시 중복된 아이디가 1개 존재한다.
        when(dao.selectOnePmtLoginIdCheck(anyString())).thenReturn(1);

        // 아이디 중복 테스트이기 때문에 insert 는 무시한다.
        doNothing().when(dao).insertPromoter_tbl(any());
        doNothing().when(dao).insertPromoterValue_tbl(any());
        doNothing().when(dao).insertPromoterValueLog_tbl(any());

        // service를 실행하여 결과를 반환한다.
        final Map<String, Object> map = service.insertPmtForm(commandMap);

        // then
        // 반환된 결과 map의 키와 값이 containsOnly에 들어가야한다.
        Assertions.assertThat(map)
                .extracting("result", "message")
                .containsOnly("31", "DUPLICATED");
    }

}