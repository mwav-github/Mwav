package net.mwav.order.vo;

import java.sql.Timestamp;

public class ChosenGoodsVO {
	private String member_id;
	private Timestamp ogChosenDt;
	private int goods_id;
	private int gcr_id;
	private int statistics_id;
	
	public ChosenGoodsVO() {}
	public ChosenGoodsVO(String member_id, Timestamp ogChosenDt, int goods_id, 
				int gcr_id) {
		this.member_id = member_id;
		this.ogChosenDt = ogChosenDt;
		this.goods_id = goods_id;
		this.gcr_id = gcr_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public Timestamp getOgChosenDt() {
		return ogChosenDt;
	}
	public void setOgChosenDt(Timestamp ogChosenDt) {
		this.ogChosenDt = ogChosenDt;
	}
	public int getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}
	public int getGcr_id() {
		return gcr_id;
	}
	public void setGcr_id(int gcr_id) {
		this.gcr_id = gcr_id;
	}
	public int getStatistics_id() {
		return statistics_id;
	}
	public void setStatistics_id(int statistics_id) {
		this.statistics_id = statistics_id;
	}
	
}
