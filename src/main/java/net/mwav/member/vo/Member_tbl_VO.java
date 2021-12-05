package net.mwav.member.vo;

import java.io.Serializable;

public class Member_tbl_VO implements Serializable {

	private static final long serialVersionUID = 6367852497587900954L;

	private int member_id;
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

	public Member_tbl_VO(int member_id, String mbrLoginId, String mbrLoginPw, String mbrTempLoginPw, String mbrFirstName, String mbrMiddleName, String mbrLastName, String mbrEmail, String mbrCellPhone, Boolean mbrAddrFlag, String mbrZipcode, String mbrAddress) {
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

	@Override
	public String toString() {
		return "Member_tbl_VO [member_id=" + member_id + ", mbrLoginId=" + mbrLoginId + ", mbrLoginPw=" + mbrLoginPw + ", mbrTempLoginPw=" + mbrTempLoginPw + ", mbrFirstName=" + mbrFirstName
				+ ", mbrMiddleName=" + mbrMiddleName + ", mbrLastName=" + mbrLastName + ", mbrEmail=" + mbrEmail + ", mbrCellPhone=" + mbrCellPhone + ", mbrAddrFlag=" + mbrAddrFlag + ", mbrZipcode="
				+ mbrZipcode + ", mbrAddress=" + mbrAddress + ", hope_mbrLoginPw=" + hope_mbrLoginPw + "]";
	}

}
