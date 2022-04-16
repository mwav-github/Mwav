package net.bizlogin.common.service;

import org.springframework.stereotype.Service;

import net.mwav.framework.cryption.AES128Lib;

/**
 * 비밀번호 공통 암호화 로직
 * AES128 암호화 사용
 * TODO : 단방향 해쉬계열로 암호화 방식 변경
 * @see : net.mwav.framework.cryption.AES128Lib
 *
 */
@Service
public class PasswordEncoder {

	private static final String KEY = "Mwav.net";

	private static final String IV = "Mwav";

	/**
	 * 암호화
	 */
	public String encode(String password) throws Exception {
		AES128Lib cyper = AES128Lib.getInstance();
		return cyper.encryptToString(KEY, IV, password);
	}

	/**
	 * 암호화 되지 않은 비밀번호와 암호화된 비밀번호 일치여부 비교
	 * TODO : null값 입력시 동작여부 확인
	 */
	public boolean matches(String rawPassword, String encodedPassword) throws Exception {
		return encode(rawPassword).equals(encodedPassword);
	}

}
