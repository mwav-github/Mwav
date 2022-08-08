package net.newmember.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.runners.MockitoJUnitRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@RunWith(MockitoJUnitRunner.class)
public class NewMemberControllerTest {

    @InjectMocks
    NewMemberController controller;

    MockMvc mockMvc;

    @Before
    public void setup(){
        assertThat(controller).isNotNull();
        mockMvc = MockMvcBuilders.standaloneSetup(controller).build();
    }

    @Test
    public void signUpForm() throws Exception {
        mockMvc.perform(get("/newMember/signUp"))
                .andDo(print())
                .andExpect(status().is(200));
    }
}