package net.newmember.service;

import net.newmember.vo.NewMemberVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service
public class NewMemberService {

    @SuppressWarnings("unused")
    private static final Logger logger = LoggerFactory.getLogger(NewMemberService.class);

    /**
     * 신규멤버 지원 등록
     * @param vo
     * @return
     */
    public boolean signUpRegister(NewMemberVO vo) {

        return false;
    }
}
