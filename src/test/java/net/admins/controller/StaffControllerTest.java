package net.admins.controller;

import net.admins.service.StaffService;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.runners.MockitoJUnitRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import static org.junit.Assert.assertNotNull;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@RunWith(MockitoJUnitRunner.class)
public class StaffControllerTest {

    @InjectMocks
    StaffController controller;

    @Mock
    StaffService service;

    MockMvc mockMvc;

    @Before
    public void setup(){
        assertNotNull(controller);
        mockMvc = MockMvcBuilders.standaloneSetup(controller).build();
    }

    @Test
    public void selectOneMbrPmtIdCheck() throws Exception {
        when(service.selectOnePmtLoginIdCheck("test")).thenReturn(true);
        mockMvc.perform(post("/admins/staff/pmtLoginIdCheck.mwav"))
                .andExpect(status().is(200));
    }
}
