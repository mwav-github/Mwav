package net.admins.vo;

import java.io.Serializable;

public class Staff_VO extends Staff implements Serializable {

	private static final long serialVersionUID = 411859812457517281L;
	private String stfLoginId; // 직원아이디
	private String stfLoginPw; // 직원패스워드
	private String stfNumber; // 사번
	private String stfName; // 직원명
	private String stfNickname; // 닉네임
	private String stfBranch; // 본사/지사
	private String stfDeptName; // 부서명
	private String stfClass; // 직급
	private String stfSubJobs; // 부업무
	private String stfPhone; // 연락처전화번호
	private String stfCellularP; // 핸드폰번호
	private String stfExtNbr; // 회사 Ext
	private String stfEmail; // 메일주소
	private String stfSsn1; // 앞 주민번호
	private String stfSsn2; // 뒷 주민번호
	private String stfZipcode; // 주소, 상세주소
	private String stfAddress;
	private String stfMessengerName;
	private String stfMessengerId;
	private String stfHomepage;
	private String stfMark;
	private int stfLoginCheck;
	private byte stfLevel;
	private String stfBusinessPic; // 직원평가데이터(자격증)
	private String stfAvataImage; // 아바타 이미지
	private String stfData; // 직원평가데이터
	private int stfPoint; // 포인트
	private int stfPointAc; // 누적포인트
	private java.sql.Timestamp stfJoinDt; // 입사일
	private java.sql.Timestamp stfDeleteDt; // 퇴사일
	private java.sql.Timestamp stfInsertDt; // 등록일
	private java.sql.Timestamp stfUpdateDt; // 수정일
	private java.sql.Timestamp stfRecentLoginDt; // 최근접속일
	private String stfIpAddress; // PC아이피

	public String getStfLoginId() {
		return stfLoginId;
	}

	public void setStfLoginId(String stfLoginId) {
		this.stfLoginId = stfLoginId;
	}

	public String getStfLoginPw() {
		return stfLoginPw;
	}

	public void setStfLoginPw(String stfLoginPw) {
		this.stfLoginPw = stfLoginPw;
	}

	public String getStfNumber() {
		return stfNumber;
	}

	public void setStfNumber(String stfNumber) {
		this.stfNumber = stfNumber;
	}

	public String getStfName() {
		return stfName;
	}

	public void setStfName(String stfName) {
		this.stfName = stfName;
	}

	public String getStfNickname() {
		return stfNickname;
	}

	public void setStfNickname(String stfNickname) {
		this.stfNickname = stfNickname;
	}

	public String getStfBranch() {
		return stfBranch;
	}

	public void setStfBranch(String stfBranch) {
		this.stfBranch = stfBranch;
	}

	public String getStfDeptName() {
		return stfDeptName;
	}

	public void setStfDeptName(String stfDeptName) {
		this.stfDeptName = stfDeptName;
	}

	public String getStfClass() {
		return stfClass;
	}

	public void setStfClass(String stfClass) {
		this.stfClass = stfClass;
	}

	public String getStfSubJobs() {
		return stfSubJobs;
	}

	public void setStfSubJobs(String stfSubJobs) {
		this.stfSubJobs = stfSubJobs;
	}

	public String getStfPhone() {
		return stfPhone;
	}

	public void setStfPhone(String stfPhone) {
		this.stfPhone = stfPhone;
	}

	public String getStfCellularP() {
		return stfCellularP;
	}

	public void setStfCellularP(String stfCellularP) {
		this.stfCellularP = stfCellularP;
	}

	public String getStfExtNbr() {
		return stfExtNbr;
	}

	public void setStfExtNbr(String stfExtNbr) {
		this.stfExtNbr = stfExtNbr;
	}

	public String getStfEmail() {
		return stfEmail;
	}

	public void setStfEmail(String stfEmail) {
		this.stfEmail = stfEmail;
	}

	public String getStfSsn1() {
		return stfSsn1;
	}

	public void setStfSsn1(String stfSsn1) {
		this.stfSsn1 = stfSsn1;
	}

	public String getStfSsn2() {
		return stfSsn2;
	}

	public void setStfSsn2(String stfSsn2) {
		this.stfSsn2 = stfSsn2;
	}

	public String getStfZipcode() {
		return stfZipcode;
	}

	public void setStfZipcode(String stfZipcode) {
		this.stfZipcode = stfZipcode;
	}

	public String getStfAddress() {
		return stfAddress;
	}

	public void setStfAddress(String stfAddress) {
		this.stfAddress = stfAddress;
	}

	public String getStfMessengerName() {
		return stfMessengerName;
	}

	public void setStfMessengerName(String stfMessengerName) {
		this.stfMessengerName = stfMessengerName;
	}

	public String getStfMessengerId() {
		return stfMessengerId;
	}

	public void setStfMessengerId(String stfMessengerId) {
		this.stfMessengerId = stfMessengerId;
	}

	public String getStfHomepage() {
		return stfHomepage;
	}

	public void setStfHomepage(String stfHomepage) {
		this.stfHomepage = stfHomepage;
	}

	public String getStfMark() {
		return stfMark;
	}

	public void setStfMark(String stfMark) {
		this.stfMark = stfMark;
	}

	public byte getStfLevel() {
		return stfLevel;
	}

	public void setStfLevel(byte stfLevel) {
		this.stfLevel = stfLevel;
	}

	public String getStfBusinessPic() {
		return stfBusinessPic;
	}

	public void setStfBusinessPic(String stfBusinessPic) {
		this.stfBusinessPic = stfBusinessPic;
	}

	public String getStfAvataImage() {
		return stfAvataImage;
	}

	public void setStfAvataImage(String stfAvataImage) {
		this.stfAvataImage = stfAvataImage;
	}

	public String getStfData() {
		return stfData;
	}

	public void setStfData(String stfData) {
		this.stfData = stfData;
	}

	public int getStfPoint() {
		return stfPoint;
	}

	public void setStfPoint(int stfPoint) {
		this.stfPoint = stfPoint;
	}

	public int getStfPointAc() {
		return stfPointAc;
	}

	public void setStfPointAc(int stfPointAc) {
		this.stfPointAc = stfPointAc;
	}

	public java.sql.Timestamp getStfJoinDt() {
		return stfJoinDt;
	}

	public void setStfJoinDt(java.sql.Timestamp stfJoinDt) {
		this.stfJoinDt = stfJoinDt;
	}

	public java.sql.Timestamp getStfDeleteDt() {
		return stfDeleteDt;
	}

	public void setStfDeleteDt(java.sql.Timestamp stfDeleteDt) {
		this.stfDeleteDt = stfDeleteDt;
	}

	public java.sql.Timestamp getStfInsertDt() {
		return stfInsertDt;
	}

	public void setStfInsertDt(java.sql.Timestamp stfInsertDt) {
		this.stfInsertDt = stfInsertDt;
	}

	public java.sql.Timestamp getStfUpdateDt() {
		return stfUpdateDt;
	}

	public void setStfUpdateDt(java.sql.Timestamp stfUpdateDt) {
		this.stfUpdateDt = stfUpdateDt;
	}

	public java.sql.Timestamp getStfRecentLoginDt() {
		return stfRecentLoginDt;
	}

	public void setStfRecentLoginDt(java.sql.Timestamp stfRecentLoginDt) {
		this.stfRecentLoginDt = stfRecentLoginDt;
	}

	public String getStfIpAddress() {
		return stfIpAddress;
	}

	public void setStfIpAddress(String stfIpAddress) {
		this.stfIpAddress = stfIpAddress;
	}

	public int getStfLoginCheck() {
		return stfLoginCheck;
	}

	public void setStfLoginCheck(int stfLoginCheck) {
		this.stfLoginCheck = stfLoginCheck;
	}

	@Override
	public String toString() {
		return "Staff_VO [stfLoginId=" + stfLoginId + ", stfLoginPw=" + stfLoginPw + ", stfNumber=" + stfNumber + ", stfName=" + stfName + ", stfNickname=" + stfNickname + ", stfBranch=" + stfBranch
				+ ", stfDeptName=" + stfDeptName + ", stfClass=" + stfClass + ", stfSubJobs=" + stfSubJobs + ", stfPhone=" + stfPhone + ", stfCellularP=" + stfCellularP + ", stfExtNbr=" + stfExtNbr
				+ ", stfEmail=" + stfEmail + ", stfSsn1=" + stfSsn1 + ", stfSsn2=" + stfSsn2 + ", stfZipcode=" + stfZipcode + ", stfAddress=" + stfAddress + ", stfMessengerName=" + stfMessengerName
				+ ", stfMessengerId=" + stfMessengerId + ", stfHomepage=" + stfHomepage + ", stfMark=" + stfMark + ", stfLoginCheck=" + stfLoginCheck + ", stfLevel=" + stfLevel + ", stfBusinessPic="
				+ stfBusinessPic + ", stfAvataImage=" + stfAvataImage + ", stfData=" + stfData + ", stfPoint=" + stfPoint + ", stfPointAc=" + stfPointAc + ", stfJoinDt=" + stfJoinDt + ", stfDeleteDt="
				+ stfDeleteDt + ", stfInsertDt=" + stfInsertDt + ", stfUpdateDt=" + stfUpdateDt + ", stfRecentLoginDt=" + stfRecentLoginDt + ", stfIpAddress=" + stfIpAddress + "]";
	}

}
