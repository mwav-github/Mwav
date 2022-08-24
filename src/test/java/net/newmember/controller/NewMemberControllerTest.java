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
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

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
        // given

        // when

        // then
        mockMvc.perform(get("/newMember/signUp"))
                .andDo(print())
                .andExpect(status().is(200));
    }

    @Test
    public void signUpRegister() throws Exception {
        // given

        // when

        // then
        mockMvc.perform(post("/newMember/register")
                        .param("name", "taehyun Kong")
                        .param("email", "taehyun@gmail.com")
                        .param("hopeField", "java, docker, react")
                        .param("age", "25")
                        .param("career", "신입")
                        .param("purpose", "열심히 해보겠습니다.")
                        .param("gender", "M"))
                .andDo(print())
                .andExpect(view().name("/NewMember/SignUp/form"))
                .andExpect(status().is(200));
    }

}