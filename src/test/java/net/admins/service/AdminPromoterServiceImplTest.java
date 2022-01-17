package net.admins.service;

import net.admins.dao.AdminPromoterDAO;
import net.common.common.CommandMap;
import org.assertj.core.api.Assertions;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.runners.MockitoJUnitRunner;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.util.Map;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.when;

/**
 * <pre>
 * {@code
 *  <p>관리자페이지의 프로모터쪽 비즈니스로직 테스트케이스</p>
 * }
 * </pre>
 * @author 공태현
 * @since 1.0.1
 * @version 1.0.0
 * @see net.admins.service.AdminPromoterService
 *
 */
@RunWith(MockitoJUnitRunner.class)
public class AdminPromoterServiceImplTest {

    private static final Logger logger = LoggerFactory.getLogger(AdminPromoterServiceImplTest.class);

    @InjectMocks
    private AdminPromoterServiceImpl pmtService;

    @Mock
    AdminPromoterDAO pmtDAO;

    /**
     * <pre>
     * {@code
     *      <p>프로모터 비밀번호 변경시 기존의 비밀번호와 변경하려는 비밀번호의 일치여부 테스트</p>
     * }
     * </pre>
     * @param
     * @return void
     * @throws IOException
     * @see AdminPromoterService.updatePmtPassword
     * @since 1.0.1
     * @version 1.0.0
     */
    @Test
    public void updatePmtPassword_프로모터_비밀번호_변경_비밀번호와_신규비밀번호_비교() throws IOException {
        // given
        CommandMap commandMap = new CommandMap();
        commandMap.put("pmtLoginPw", "mwav123!@#");
        commandMap.put("pmtLoginPw2", "mwav123444");

        // when
        boolean result = pmtService.updatePmtPassword(commandMap);

        // then
        Assertions.assertThat(result).isFalse();
    }

    /**
     * <pre>
     * {@code
     *      <p>관리자페이지 스태프 리스트 페이징 로직 테스트</p>
     * }
     * </pre>
     * @param
     * @return void
     * @throws
     * @see AdminPromoterService.selectStaffSeek
     * @since 1.0.1
     * @version 1.0.0
     */
    @Test
    public void selectStaffSeek_스태프_페이징(){
        // given
        // 요청한 페이지
        int page = 4;
        // staff Count(*)
        int maxCountPage = 51;

        CommandMap commandMap = new CommandMap();
        commandMap.put("page", page);

        // when
        when(pmtDAO.selectStaffSeekMaxCount(commandMap)).thenReturn(maxCountPage);

        // then
        Map<String, Object> map = pmtService.selectStaffSeek(commandMap);

        map.forEach((s, o) -> {
            logger.debug(s + " : " + o);
        });

        assertThat(map).extractingByKey("minPage").isEqualTo(1);
        assertThat(map).extractingByKey("maxPage").isEqualTo(5);
        assertThat(map).extractingByKey("maxCountPage").isEqualTo(5);

        int minPage = (int) map.get("minPage");
        int maxPage = (int) map.get("maxPage");
        maxCountPage = (int) map.get("maxCountPage");

        if(page > 3){
            System.out.print("< ");
        }

        // 페이지 번호 출력 상황
        for(int i = minPage; i <= maxPage; i++){
            System.out.print(i+1 + " ");
        }

        if(maxCountPage -2 > page){
            System.out.print(">");
        }


    }

}