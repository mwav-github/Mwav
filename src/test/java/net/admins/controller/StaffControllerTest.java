package net.admins.controller;

import net.admins.service.StaffService;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.mockito.runners.MockitoJUnitRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

@RunWith(MockitoJUnitRunner.class)
public class StaffControllerTest {

    @InjectMocks
    StaffController controller;

    @Mock
    StaffService service;

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
}
