package net.promoter.vo;

public class Promoter_VO extends Promoter {

	private String pmtLoginId;

	private String pmtLoginPw;

	private String pmtName;

	private String pmtMail;

	private String pmtCellularPhone;

	private String pmtPhone;

	private int pmtAddrFlag;

	private String pmtZipcod;

	private String pmtAddress;

	private String pmtJobType;

	private int pmtFindingId;

	private String pmtFindingA;

	private String pmtSsn1;

	private String pmtSsn2;
	private int pmtMarried;

	private String pmtMarkl;

	public String getPmtPhone() {
		return pmtPhone;
	}

	public String getPmtLoginId() {
		return pmtLoginId;
	}
	public void setPmtLoginId(String pmtLoginId) {
		this.pmtLoginId = pmtLoginId;
	}
	public String getPmtLoginPw() {
		return pmtLoginPw;
	}
	public void setPmtLoginPw(String pmtLoginPw) {
		this.pmtLoginPw = pmtLoginPw;
	}
	public String getPmtName() {
		return pmtName;
	}
	public void setPmtName(String pmtName) {
		this.pmtName = pmtName;
	}
	public String getPmtMail() {
		return pmtMail;
	}
	public void setPmtMail(String pmtMail) {
		this.pmtMail = pmtMail;
	}
	public String getPmtCellularPhone() {
		return pmtCellularPhone;
	}
	public void setPmtCellularPhone(String pmtCellularPhone) {
		this.pmtCellularPhone = pmtCellularPhone;
	}
	public int getPmtAddrFlag() {
		return pmtAddrFlag;
	}
	public void setPmtAddrFlag(int pmtAddrFlag) {
		this.pmtAddrFlag = pmtAddrFlag;
	}
	public String getPmtZipcod() {
		return pmtZipcod;
	}
	public void setPmtZipcod(String pmtZipcod) {
		this.pmtZipcod = pmtZipcod;
	}
	public String getPmtAddress() {
		return pmtAddress;
	}
	public void setPmtAddress(String pmtAddress) {
		this.pmtAddress = pmtAddress;
	}
	public String getPmtJobType() {
		return pmtJobType;
	}
	public void setPmtJobType(String pmtJobType) {
		this.pmtJobType = pmtJobType;
	}
	public int getPmtFindingId() {
		return pmtFindingId;
	}
	public void setPmtFindingId(int pmtFindingId) {
		this.pmtFindingId = pmtFindingId;
	}
	public String getPmtFindingA() {
		return pmtFindingA;
	}
	public void setPmtFindingA(String pmtFindingA) {
		this.pmtFindingA = pmtFindingA;
	}
	public String getPmtSsn1() {
		return pmtSsn1;
	}
	public void setPmtSsn1(String pmtSsn1) {
		this.pmtSsn1 = pmtSsn1;
	}
	public String getPmtSsn2() {
		return pmtSsn2;
	}
	public void setPmtSsn2(String pmtSsn2) {
		this.pmtSsn2 = pmtSsn2;
	}
	public int getPmtMarried() {
		return pmtMarried;
	}
	public void setPmtMarried(int pmtMarried) {
		this.pmtMarried = pmtMarried;
	}
	public String getPmtMarkl() {
		return pmtMarkl;
	}
	public void setPmtMarkl(String pmtMarkl) {
		this.pmtMarkl = pmtMarkl;
	}
	public void setPmtPhone(String pmtPhone) {
		this.pmtPhone = pmtPhone;
	}
	@Override
	public String toString() {
		return "Promoter_VO [ promoter_id=" +super.getPromoter_id()+ ", pmtLoginId="
				+ pmtLoginId + ", pmtLoginPw=" + pmtLoginPw + ", pmtName="
				+ pmtName + ", pmtMail=" + pmtMail + ", pmtCellularPhone="
				+ pmtCellularPhone + ", pmtPhone=" + pmtPhone
				+ ", pmtAddrFlag=" + pmtAddrFlag + ", pmtZipcod=" + pmtZipcod
				+ ", pmtAddress=" + pmtAddress + ", pmtJobType=" + pmtJobType
				+ ", pmtFindingId=" + pmtFindingId + ", pmtFindingA="
				+ pmtFindingA + ", pmtSsn1=" + pmtSsn1 + ", pmtSsn2=" + pmtSsn2
				+ ", pmtMarried=" + pmtMarried + ", pmtMarkl=" + pmtMarkl + "]";
	}

}
