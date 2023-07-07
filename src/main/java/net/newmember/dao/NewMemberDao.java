package net.newmember.dao;

import net.newmember.vo.NewMemberVO;
import org.springframework.stereotype.Repository;

@Repository
public interface NewMemberDao {

    public void createSignUpRegister(NewMemberVO vo);

    public void createSignUpRegisterValue(NewMemberVO vo);
}
