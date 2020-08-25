package net.common.common;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.runners.MockitoJUnitRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;

import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;

@RunWith(MockitoJUnitRunner.class)
public class AccountEmailCertifyTest {

    @InjectMocks
    AccountEmailCertify controller;

    MockMvc mockMvc;

    @Before
    public void setup(){
        assertThat(controller).isNotNull();
        mockMvc = MockMvcBuilders.standaloneSetup(controller).build();
    }

    @Test
    public void certify() throws Exception {

        mockMvc.perform(get("/certify")
                        .param("id", "test")
                        .param("account", "test"))
                .andDo(print());

    }
}