package net.promoter.vo;

import java.util.Date;

public class PromoterValue_VO extends Promoter{
	private int staff_id;
	private int pmtUpperPromo_id;
	private String pmtRcmderId;
	private int pmtLevel;
	private int pmtVisitNbr;
	private int pmtEffects;
	private int pmtProfits;
	private String pmtGdsGroup;
	private Date pmtJoinDt;
	private Date pmtUpdatDt;
	private Date pmtLeaveDt;
	private String pmtMark;
	private Date pmtRecentLoginDt;
	private String pmtIpAddress;
	public int getStaff_id() {
		return staff_id;
	}
	public void setStaff_id(int staff_id) {
		this.staff_id = staff_id;
	}
	public int getPmtUpperPromo_id() {
		return pmtUpperPromo_id;
	}
	public void setPmtUpperPromo_id(int pmtUpperPromo_id) {
		this.pmtUpperPromo_id = pmtUpperPromo_id;
	}
	public String getPmtRcmderId() {
		return pmtRcmderId;
	}
	public void setPmtRcmderId(String pmtRcmderId) {
		this.pmtRcmderId = pmtRcmderId;
	}
	public int getPmtLevel() {
		return pmtLevel;
	}
	public void setPmtLevel(int pmtLevel) {
		this.pmtLevel = pmtLevel;
	}
	public int getPmtVisitNbr() {
		return pmtVisitNbr;
	}
	public void setPmtVisitNbr(int pmtVisitNbr) {
		this.pmtVisitNbr = pmtVisitNbr;
	}
	public int getPmtEffects() {
		return pmtEffects;
	}
	public void setPmtEffects(int pmtEffects) {
		this.pmtEffects = pmtEffects;
	}
	public int getPmtProfits() {
		return pmtProfits;
	}
	public void setPmtProfits(int pmtProfits) {
		this.pmtProfits = pmtProfits;
	}
	public String getPmtGdsGroup() {
		return pmtGdsGroup;
	}
	public void setPmtGdsGroup(String pmtGdsGroup) {
		this.pmtGdsGroup = pmtGdsGroup;
	}
	public Date getPmtJoinDt() {
		return pmtJoinDt;
	}
	public void setPmtJoinDt(Date pmtJoinDt) {
		this.pmtJoinDt = pmtJoinDt;
	}
	public Date getPmtUpdatDt() {
		return pmtUpdatDt;
	}
	public void setPmtUpdatDt(Date pmtUpdatDt) {
		this.pmtUpdatDt = pmtUpdatDt;
	}
	public Date getPmtLeaveDt() {
		return pmtLeaveDt;
	}
	public void setPmtLeaveDt(Date pmtLeaveDt) {
		this.pmtLeaveDt = pmtLeaveDt;
	}
	public String getPmtMark() {
		return pmtMark;
	}
	public void setPmtMark(String pmtMark) {
		this.pmtMark = pmtMark;
	}
	public Date getPmtRecentLoginDt() {
		return pmtRecentLoginDt;
	}
	public void setPmtRecentLoginDt(Date pmtRecentLoginDt) {
		this.pmtRecentLoginDt = pmtRecentLoginDt;
	}
	public String getPmtIpAddress() {
		return pmtIpAddress;
	}
	public void setPmtIpAddress(String pmtIpAddress) {
		this.pmtIpAddress = pmtIpAddress;
	}
	@Override
	public String toString() {
		return "PromoterValue_VO [:promoter_id="+super.getPromoter_id()+"staff_id=" + staff_id + ", pmtUpperPromo_id="
				+ pmtUpperPromo_id + ", pmtRcmderId=" + pmtRcmderId
				+ ", pmtLevel=" + pmtLevel + ", pmtVisitNbr=" + pmtVisitNbr
				+ ", pmtEffects=" + pmtEffects + ", pmtProfits=" + pmtProfits
				+ ", pmtGdsGroup=" + pmtGdsGroup + ", pmtJoinDt=" + pmtJoinDt
				+ ", pmtUpdatDt=" + pmtUpdatDt + ", pmtLeaveDt=" + pmtLeaveDt
				+ ", pmtMark=" + pmtMark + ", pmtRecentLoginDt="
				+ pmtRecentLoginDt + ", pmtIpAddress=" + pmtIpAddress + "]";
	}

}
