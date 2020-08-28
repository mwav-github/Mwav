package net.bizLogin.good.vo;

public class PromoterAccount_VO extends Promoter  {
	 private String paBankName;
	 private String paBankAccout;
	 private String paBankbookImgUrl;
	public String getPaBankName() {
		return paBankName;
	}
	public void setPaBankName(String paBankName) {
		this.paBankName = paBankName;
	}
	public String getPaBankAccout() {
		return paBankAccout;
	}
	public void setPaBankAccout(String paBankAccout) {
		this.paBankAccout = paBankAccout;
	}
	public String getPaBankbookImgUrl() {
		return paBankbookImgUrl;
	}
	public void setPaBankbookImgUrl(String paBankbookImgUrl) {
		this.paBankbookImgUrl = paBankbookImgUrl;
	}
	@Override
	public String toString() {
		return "PromoterAccount_VO [paBankName=" + paBankName
				+ ", paBankAccout=" + paBankAccout + ", paBankbookImgUrl="
				+ paBankbookImgUrl + "]";
	}
	 
	
}
