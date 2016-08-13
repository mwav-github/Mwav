package net.mwav.order.vo;

import java.sql.Date;

public class OrderPaymentVO {
	private int op_id;
	private long order_id;
	private int opSeqNbr;
	private String opMethod;
	private int opAmount;
	private String opFinancialAgency;
	private String opHolder;
	private String opAccount;
	private Date opExpireYM;
	private int opInstallment;
	private String opPgDealId;
	private String opPgAuthId;
	private Date opAuthDt;
	private String opCellularP;
	private String opSsn;
	private Date opDeleteDt;
	
	public int getOp_id() {
		return op_id;
	}
	public void setOp_id(int op_id) {
		this.op_id = op_id;
	}
	public long getOrder_id() {
		return order_id;
	}
	public void setOrder_id(long order_id) {
		this.order_id = order_id;
	}
	public int getOpSeqNbr() {
		return opSeqNbr;
	}
	public void setOpSeqNbr(int opSeqNbr) {
		this.opSeqNbr = opSeqNbr;
	}
	public String getOpMethod() {
		return opMethod;
	}
	public void setOpMethod(String opMethod) {
		this.opMethod = opMethod;
	}
	public int getOpAmount() {
		return opAmount;
	}
	public void setOpAmount(int opAmount) {
		this.opAmount = opAmount;
	}
	public String getOpFinancialAgency() {
		return opFinancialAgency;
	}
	public void setOpFinancialAgency(String opFinancialAgency) {
		this.opFinancialAgency = opFinancialAgency;
	}
	public String getOpHolder() {
		return opHolder;
	}
	public void setOpHolder(String opHolder) {
		this.opHolder = opHolder;
	}
	public String getOpAccount() {
		return opAccount;
	}
	public void setOpAccount(String opAccount) {
		this.opAccount = opAccount;
	}
	public Date getOpExpireYM() {
		return opExpireYM;
	}
	public void setOpExpireYM(Date opExpireYM) {
		this.opExpireYM = opExpireYM;
	}
	public int getOpInstallment() {
		return opInstallment;
	}
	public void setOpInstallment(int opInstallment) {
		this.opInstallment = opInstallment;
	}
	public String getOpPgDealId() {
		return opPgDealId;
	}
	public void setOpPgDealId(String opPgDealId) {
		this.opPgDealId = opPgDealId;
	}
	public String getOpPgAuthId() {
		return opPgAuthId;
	}
	public void setOpPgAuthId(String opPgAuthId) {
		this.opPgAuthId = opPgAuthId;
	}
	public Date getOpAuthDt() {
		return opAuthDt;
	}
	public void setOpAuthDt(Date opAuthDt) {
		this.opAuthDt = opAuthDt;
	}
	public String getOpCellularP() {
		return opCellularP;
	}
	public void setOpCellularP(String opCellularP) {
		this.opCellularP = opCellularP;
	}
	public String getOpSsn() {
		return opSsn;
	}
	public void setOpSsn(String opSsn) {
		this.opSsn = opSsn;
	}
	public Date getOpDeleteDt() {
		return opDeleteDt;
	}
	public void setOpDeleteDt(Date opDeleteDt) {
		this.opDeleteDt = opDeleteDt;
	}
	
	
}
