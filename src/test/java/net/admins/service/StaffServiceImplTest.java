package net.admins.service;

import net.admins.dao.StaffDAO;
import net.common.common.CommandMap;
import org.assertj.core.api.Assertions;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.runners.MockitoJUnitRunner;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.when;

@RunWith(MockitoJUnitRunner.class)
public class StaffServiceImplTest {

    @InjectMocks
    private StaffServiceImpl staffService;

    @Mock
    StaffDAO staffDAO;

    @Test
    public void updatePmtPassword_프로모터_비밀번호_변경_비밀번호와_신규비밀번호_비교() throws IOException {
        // given
        CommandMap commandMap = new CommandMap();
        commandMap.put("pmtLoginPw", "mwav123!@#");
        commandMap.put("pmtLoginPw2", "mwav123444");

        // when
        boolean result = staffService.updatePmtPassword(commandMap);

        // then
        Assertions.assertThat(result).isFalse();
    }

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
        when(staffDAO.selectStaffSeekMaxCount(commandMap)).thenReturn(maxCountPage);

        // then
        Map<String, Object> map = staffService.selectStaffSeek(commandMap);

        map.forEach((s, o) -> {
            System.out.println(s + " : " + o);
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