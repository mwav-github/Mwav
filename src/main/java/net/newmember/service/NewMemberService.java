package net.newmember.service;

import net.newmember.dao.NewMemberDao;
import net.newmember.vo.NewMemberVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;

@Service
public class NewMemberService {

    @SuppressWarnings("unused")
    private static final Logger logger = LoggerFactory.getLogger(NewMemberService.class);

    @Inject
    private NewMemberDao newMemberDao;

    /**
     * 신규멤버 지원 등록
     * @param vo
     * @return
     */
    @Transactional(rollbackFor = { Exception.class }, readOnly = false)
    public boolean signUpRegister(NewMemberVO vo) {

        // 신규 가입자 신청
        newMemberDao.createSignUpRegister(vo);

        return false;
    }
}
