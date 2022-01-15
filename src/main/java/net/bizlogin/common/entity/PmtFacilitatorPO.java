package net.bizlogin.common.entity;

public class PmtFacilitatorPO {
	/* SNS 프로모터 PK */
	private Integer snsPromoter_id;
	/* 프로모터 SNS ID */
	private String spPromoterId;
	/* 회원명 (이름) */
	private String spFirstName;
	/* 회원명 (성) */
	private String spLastName;
	/* 회원명 (중간이름) */
	private String spMiddleName;
	/* 닉네임 */
	private String spNickName;
	/* 이메일 */
	private String spEmail;
	/* 성별 */
	private String spGender;
	/* 프로필 이미지 경로 */
	private String spProfileImage;
	/* URL */
	private String spURL;
	/* 이메일 인증 여부 */
	private String isEmailVerified;
	/* 메일 인증 날짜 */
	private String spCertifyMailDt;
	/* 프로모터 PK */
	private Integer promoter_id;
	/* 간편 가입일 */
	private String spInsertDt;
	/* 간편 가입정보 수정일 */
	private String spUpdateDt;
	/* 간편 탈퇴일 */
	private String spDeleteDt;
	/* 최근IP(추적) */
	private String spIpAddress;
	/* SNS (소셜서비스) 종류 - 영문표기: Twitter, Facebook, Linkedin, Kakao, Naver */
	private String spSnsType;
	
	public Integer getSnsPromoter_id() {
		return snsPromoter_id;
	}
	public void setSnsPromoter_id(Integer snsPromoter_id) {
		this.snsPromoter_id = snsPromoter_id;
	}
	public String getSpPromoterId() {
		return spPromoterId;
	}
	public void setSpPromoterId(String spPromoterId) {
		this.spPromoterId = spPromoterId;
	}
	public String getSpFirstName() {
		return spFirstName;
	}
	public void setSpFirstName(String spFirstName) {
		this.spFirstName = spFirstName;
	}
	public String getSpLastName() {
		return spLastName;
	}
	public void setSpLastName(String spLastName) {
		this.spLastName = spLastName;
	}
	public String getSpMiddleName() {
		return spMiddleName;
	}
	public void setSpMiddleName(String spMiddleName) {
		this.spMiddleName = spMiddleName;
	}
	public String getSpNickName() {
		return spNickName;
	}
	public void setSpNickname(String spNickName) {
		this.spNickName = spNickName;
	}
	public String getSpEmail() {
		return spEmail;
	}
	public void setSpEmail(String spEmail) {
		this.spEmail = spEmail;
	}
	public String getSpGender() {
		return spGender;
	}
	public void setSpGender(String spGender) {
		this.spGender = spGender;
	}
	public String getSpProfileImage() {
		return spProfileImage;
	}
	public void setSpProfileImage(String spProfileImage) {
		this.spProfileImage = spProfileImage;
	}
	public String getSpURL() {
		return spURL;
	}
	public void setSpURL(String spURL) {
		this.spURL = spURL;
	}
	public String getIsEmailVerified() {
		return isEmailVerified;
	}
	public void setIsEmailVerified(String isEmailVerified) {
		this.isEmailVerified = isEmailVerified;
	}
	public String getSpCertifyMailDt() {
		return spCertifyMailDt;
	}
	public void setSpCertifyMailDt(String spCertifyMailDt) {
		this.spCertifyMailDt = spCertifyMailDt;
	}
	public Integer getPromoter_id() {
		return promoter_id;
	}
	public void setPromoter_id(Integer promoter_id) {
		this.promoter_id = promoter_id;
	}
	public String getSpInsertDt() {
		return spInsertDt;
	}
	public void setSpInsertDt(String spInsertDt) {
		this.spInsertDt = spInsertDt;
	}
	public String getSpUpdateDt() {
		return spUpdateDt;
	}
	public void setSpUpdateDt(String spUpdateDt) {
		this.spUpdateDt = spUpdateDt;
	}
	public String getSpDeleteDt() {
		return spDeleteDt;
	}
	public void setSpDeleteDt(String spDeleteDt) {
		this.spDeleteDt = spDeleteDt;
	}
	public String getSpIpAddress() {
		return spIpAddress;
	}
	public void setSpIpAddress(String spIpAddress) {
		this.spIpAddress = spIpAddress;
	}
	public String getSpSnsType() {
		return spSnsType;
	}
	public void setSpSnsType(String spSnsType) {
		this.spSnsType = spSnsType;
	}
}
