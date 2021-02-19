package net.admins.controller;

import net.admins.service.AdminPromoterService;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.runners.MockitoJUnitRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import java.util.HashMap;
import java.util.Map;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

/**
 * <pre>
 * {@code
 *  <p>관리자페이지의 프로모터쪽 핸들링의 테스트케이스</p>
 * }
 * </pre>
 * @author 공태현
 * @since 1.0.1
 * @version 1.0.0
 * @see net.admins.controller.AdminPromoterController
 *
 */
@RunWith(MockitoJUnitRunner.class)
public class AdminPromoterControllerTest {

    @InjectMocks
    AdminPromoterController controller;

    @Mock
    AdminPromoterService service;

    MockMvc mockMvc;

    /**
     * <pre>
     * {@code
     *      <p>AdminPromoterController 컨트롤러의 핸들링을 MockMvc 객체로 생성하기 위한 setup</p>
     *      <p>AdminPromoterControllerTest 클래스 하위의 모든 테스크케이스들은 매번 실행시 마다 setup 메소드를 실행하게 된다.</p>
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
        assertThat(controller).isNotNull();
        mockMvc = MockMvcBuilders.standaloneSetup(controller).build();
    }

    /**
     * <pre>
     * {@code
     *      <p>파라미터로 넘어온 아이다의 중복여부를 반환하는 테스트케이스</p>
     * }
     * </pre>
     * @param
     * @return void
     * @throws Exception
     * @see AdminPromoterController.selectOneMbrPmtIdCheck
     * @since 1.0.1
     * @version 1.0.0
     */
    @Test
    public void selectOneMbrPmtIdCheck() throws Exception {
        // given

        // when & then
        when(service.selectOnePmtLoginIdCheck("test")).thenReturn(true);

        mockMvc.perform(post("/admins/staff/pmtLoginIdCheck.mwav"))
                .andExpect(status().is(200));
    }

    /**
     * <pre>
     * {@code
     *      <p>프로모터 페이지 요청시 pmtView로 redirect 테스트</p>
     * }
     * </pre>
     * @param
     * @return void
     * @throws Exception
     * @see AdminPromoterController.returnPmt
     * @since 1.0.1
     * @version 1.0.0
     */
    @Test
    public void returnPmt() throws Exception {
        mockMvc.perform(post("/admins/staff/pmtReturn.mwav"))
                .andDo(print())
                .andExpect(status().is(302))
                .andExpect(view().name("redirect:/admins/staff/pmtView.mwav"));
    }

    /**
     * <pre>
     * {@code
     *      <p>프로모터 ID를 넘겨받아 해당 프로모터의 상세정보를 조회하는 테스트</p>
     * }
     * </pre>
     * @param
     * @return void
     * @throws Exception
     * @see AdminPromoterController.selectPmtView
     * @since 1.0.1
     * @version 1.0.0
     */
    @Test
    public void selectPmtView_프로모터_상세조회() throws Exception {
        // given
        String promoter_id = "100001";
        Map<String, Object> map = new HashMap<String, Object>();

        // when
        when(service.selectPmtView(promoter_id)).thenReturn(map);

        // then
        mockMvc.perform(get("/admins/staff/pmtView.mwav")
                        .param("promoter_id", promoter_id))
                .andExpect(status().isOk())
                .andExpect(model().attribute("mm","firms"))
                .andExpect(model().attribute("selectPmtView", map))
                .andExpect(view().name("/Admins/Promoter/Facilitator/PmtView"))
                .andDo(print());
    }
}
