package net.admins.controller;

import net.admins.service.PromoterService;
import net.admins.service.StaffService;
import net.promoter.vo.Promoter;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
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

@RunWith(MockitoJUnitRunner.class)
public class PromoterControllerTest {

    @InjectMocks
    PromoterController controller;

    @Mock
    PromoterService service;

    MockMvc mockMvc;

    @Before
    public void setup(){
        assertThat(controller).isNotNull();
        mockMvc = MockMvcBuilders.standaloneSetup(controller).build();
    }

    @Test
    public void selectOneMbrPmtIdCheck() throws Exception {
        // given

        // when & then
        when(service.selectOnePmtLoginIdCheck("test")).thenReturn(true);

        mockMvc.perform(post("/admins/staff/pmtLoginIdCheck.mwav"))
                .andExpect(status().is(200));
    }

    @Test
    public void returnPmt() throws Exception {
        mockMvc.perform(post("/admins/staff/pmtReturn.mwav"))
                .andDo(print())
                .andExpect(status().is(302))
                .andExpect(view().name("redirect:/admins/staff/pmtView.mwav"));
    }

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
                .andExpect(view().name("/Admins/CompanyMgr/Staff/PmtView"))
                .andDo(print());
    }
}
