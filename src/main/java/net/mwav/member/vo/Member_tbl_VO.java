package net.mwav.member.vo;

import java.sql.Timestamp;

//참고

/* 
 ========클래스의 용도 및 설명(클래스 호출 부분 명시)==========
 용도 : Value Object
 - 값을 저장하고 반환 하기 위한 목적으로 만든 객체 이다.
 - 데이터를 하나의 객체로 관리할 목적으로 만든다.(데이터 처리)
 - 데이터를 객체 단위로 묶어서 전송하면 네트워크의 부하를 줄일 수 있다.
 - 객체 자체가 DB의 레코드 하나에 해당하기때문에 데이터를 관리하기 편하다.
 호출 부분 : 어러군데...

 순번  |    요일    |             내용              |     
 ㅡㅡㅡ------ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
 1.   17.03.25    생성
 2.
 3.
 4.
 5.
 */
public class Member_tbl_VO {

	private int member_id; // member_id , primarykey 이다.
	private String mbrLoginId;
	private String mbrLoginPw;
	private String mbrTempLoginPw;
	private String mbrFirstName;
	private String mbrMiddleName;
	private String mbrLastName;
	private String mbrEmail;
	private String mbrCellPhone;
	private Boolean mbrAddrFlag;
	private String mbrZipcode;
	private String mbrAddress;
	private String hope_mbrLoginPw;

	public Member_tbl_VO() {
	}

	public Member_tbl_VO(int member_id, String mbrLoginId, String mbrLoginPw,
			String mbrTempLoginPw, String mbrFirstName, String mbrMiddleName,
			String mbrLastName, String mbrEmail, String mbrCellPhone,
			Boolean mbrAddrFlag, String mbrZipcode, String mbrAddress) {
		this.member_id = member_id;
		this.mbrLoginId = mbrLoginId;
		this.mbrLoginPw = mbrLoginPw;
		this.mbrFirstName = mbrFirstName;
		this.mbrMiddleName = mbrMiddleName;
		this.mbrLastName = mbrLastName;
		this.mbrEmail = mbrEmail;
		this.mbrCellPhone = mbrCellPhone;
		this.mbrAddrFlag = mbrAddrFlag;
		this.mbrZipcode = mbrZipcode;
		this.mbrAddress = mbrAddress;
	}

	public int getMember_id() {
		return member_id;
	}

	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}

	public String getMbrLoginId() {
		return mbrLoginId;
	}

	public void setMbrLoginId(String mbrLoginId) {
		this.mbrLoginId = mbrLoginId;
	}

	public String getMbrLoginPw() {
		return mbrLoginPw;
	}

	public void setMbrLoginPw(String mbrLoginPw) {
		this.mbrLoginPw = mbrLoginPw;
	}

	public String getMbrTempLoginPw() {
		return mbrTempLoginPw;
	}

	public void setMbrTempLoginPw(String mbrTempLoginPw) {
		this.mbrTempLoginPw = mbrTempLoginPw;
	}

	public String getMbrFirstName() {
		return mbrFirstName;
	}

	public void setMbrFirstName(String mbrFirstName) {
		this.mbrFirstName = mbrFirstName;
	}

	public String getMbrLastName() {
		return mbrLastName;
	}

	public void setMbrLastName(String mbrLastName) {
		this.mbrLastName = mbrLastName;
	}

	public String getMbrMiddleName() {
		return mbrMiddleName;
	}

	public void setMbrMiddleName(String mbrMiddleName) {
		this.mbrMiddleName = mbrMiddleName;
	}

	public String getMbrEmail() {
		return mbrEmail;
	}

	public void setMbrEmail(String mbrEmail) {
		this.mbrEmail = mbrEmail;
	}

	public String getMbrCellPhone() {
		return mbrCellPhone;
	}

	public void setMbrCellPhone(String mbrCellPhone) {
		this.mbrCellPhone = mbrCellPhone;
	}

	public Boolean getMbrAddrFlag() {
		return mbrAddrFlag;
	}

	public void setMbrAddrFlag(Boolean mbrAddrFlag) {
		this.mbrAddrFlag = mbrAddrFlag;
	}

	public String getMbrZipcode() {
		return mbrZipcode;
	}

	public void setMbrZipcode(String mbrZipcode) {
		this.mbrZipcode = mbrZipcode;
	}

	public String getMbrAddress() {
		return mbrAddress;
	}

	public void setMbrAddress(String mbrAddress) {
		this.mbrAddress = mbrAddress;
	}

	public String getHope_mbrLoginPw() {
		return hope_mbrLoginPw;
	}

	public void setHope_mbrLoginPw(String hope_mbrLoginPw) {
		this.hope_mbrLoginPw = hope_mbrLoginPw;
	}
}
/*
 * DTO or VO - Data Transfer Object - Value Object - 값을 저장하고 반환 하기 위한 목적으로 만든 객체
 * 이다. - 데이터를 하나의 객체로 관리할 목적으로 만든다.(데이터 처리) - 데이터를 객체 단위로 묶어서 전송하면 네트워크의 부하를 줄일
 * 수 있다. - 객체 자체가 DB의 레코드 하나에 해당하기때문에 데이터를 관리하기 편하다.
 * 
 * - 작성방법 클래스 접근지정자 : public 인스턴스 변수 : private (외부 접근 금지) 값을 저장할 목적의 메서드 :
 * Setter public void setInstance(parameter) - setter메서드는 반드시 parameter가 존재 한다.
 * - 리턴형은 void이다. 값을 반환할 목적의 메서드 : getter public 인스턴스변수와 동일한 반환형 getInstance() -
 * getter 메서드는 parameter가 존재 해서는 안된다. - 리턴형은 반드시 인스턴스변수와 동일한 형을 가진다.
 */