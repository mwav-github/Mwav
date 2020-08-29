package net.bizLogin.goods.vo;

import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.util.Date;
import java.util.Locale;

public class PromoterChnnel_VO extends Promoter {
	public int pChannel_id;
	public String pcType;
	public String pcBlogSNS_Title;
	public String pcBlolgSNS_URL;
	public String pcLoginId;
	public String pcNickName;
	public String pcConceptDesc;
	public String pcTargetAge;
	public int pcTargetGender;
	public String pcBenchmarkName;
	public String pcBenchmarkUrl;
	public String pcPostingsPerday;
	public int pcNeighborNbr;
	public int pcVisitorsPerDay;
	public int pcPositingsPerDay;
	public String pcKeywords;
	public int pcStfScore;
	public String pcStfMark;
	public Date pcInsertDt;
	public Date pcUpdateDt;
	public Date pcDeleteDt;
	public int getpChannel_id() {
		return pChannel_id;
	}
	public void setpChannel_id(int pChannel_id) {
		this.pChannel_id = pChannel_id;
	}
	public String getPcType() {
		return pcType;
	}
	public void setPcType(String pcType) {
		this.pcType = pcType;
	}
	public String getPcBlogSNS_Title() {
		return pcBlogSNS_Title;
	}
	public void setPcBlogSNS_Title(String pcBlogSNS_Title) {
		this.pcBlogSNS_Title = pcBlogSNS_Title;
	}
	public String getPcBlolgSNS_URL() {
		return pcBlolgSNS_URL;
	}
	public void setPcBlolgSNS_URL(String pcBlolgSNS_URL) {
		this.pcBlolgSNS_URL = pcBlolgSNS_URL;
	}
	public String getPcLoginId() {
		return pcLoginId;
	}
	public void setPcLoginId(String pcLoginId) {
		this.pcLoginId = pcLoginId;
	}
	public String getPcNickName() {
		return pcNickName;
	}
	public void setPcNickName(String pcNickName) {
		this.pcNickName = pcNickName;
	}
	public String getPcConceptDesc() {
		return pcConceptDesc;
	}
	public void setPcConceptDesc(String pcConceptDesc) {
		this.pcConceptDesc = pcConceptDesc;
	}
	public String getPcTargetAge() {
		return pcTargetAge;
	}
	public void setPcTargetAge(String pcTargetAge) {
		this.pcTargetAge = pcTargetAge;
	}
	public int getPcTargetGender() {
		return pcTargetGender;
	}
	public void setPcTargetGender(int pcTargetGender) {
		this.pcTargetGender = pcTargetGender;
	}
	public String getPcBenchmarkName() {
		return pcBenchmarkName;
	}
	public void setPcBenchmarkName(String pcBenchmarkName) {
		this.pcBenchmarkName = pcBenchmarkName;
	}
	public String getPcBenchmarkUrl() {
		return pcBenchmarkUrl;
	}
	public void setPcBenchmarkUrl(String pcBenchmarkUrl) {
		this.pcBenchmarkUrl = pcBenchmarkUrl;
	}
	public String getPcPostingsPerday() {
		return pcPostingsPerday;
	}
	public void setPcPostingsPerday(String pcPostingsPerday) {
		this.pcPostingsPerday = pcPostingsPerday;
	}
	public int getPcNeighborNbr() {
		return pcNeighborNbr;
	}
	public void setPcNeighborNbr(int pcNeighborNbr) {
		this.pcNeighborNbr = pcNeighborNbr;
	}
	public int getPcVisitorsPerDay() {
		return pcVisitorsPerDay;
	}
	public void setPcVisitorsPerDay(int pcVisitorsPerDay) {
		this.pcVisitorsPerDay = pcVisitorsPerDay;
	}
	public int getPcPositingsPerDay() {
		return pcPositingsPerDay;
	}
	public void setPcPositingsPerDay(int pcPositingsPerDay) {
		this.pcPositingsPerDay = pcPositingsPerDay;
	}
	public String getPcKeywords() {
		return pcKeywords;
	}
	public void setPcKeywords(String pcKeywords) {
		this.pcKeywords = pcKeywords;
	}
	public int getPcStfScore() {
		return pcStfScore;
	}
	public void setPcStfScore(int pcStfScore) {
		this.pcStfScore = pcStfScore;
	}
	public String getPcStfMark() {
		return pcStfMark;
	}
	public void setPcStfMark(String pcStfMark) {
		this.pcStfMark = pcStfMark;
	}
	public Date getPcInsertDt() {
		return pcInsertDt;
	}
	public void setPcInsertDt(Date pcInsertDt) {
		this.pcInsertDt = pcInsertDt;
	}
	public Date getPcUpdateDt() {
		return pcUpdateDt;
	}
	public void setPcUpdateDt(Date pcUpdateDt) {
		this.pcUpdateDt = pcUpdateDt;
	}
	public Date getPcDeleteDt() {
		return pcDeleteDt;
	}
	public void setPcDeleteDt(Date pcDeleteDt) {
		this.pcDeleteDt = pcDeleteDt;
	}
	@Override
	public String toString() {
		return "PromoterChnnel_VO [pChannel_id=" + pChannel_id + ", pcType="
				+ pcType + ", pcBlogSNS_Title=" + pcBlogSNS_Title
				+ ", pcBlolgSNS_URL=" + pcBlolgSNS_URL + ", pcLoginId="
				+ pcLoginId + ", pcNickName=" + pcNickName + ", pcConceptDesc="
				+ pcConceptDesc + ", pcTargetAge=" + pcTargetAge
				+ ", pcTargetGender=" + pcTargetGender + ", pcBenchmarkName="
				+ pcBenchmarkName + ", pcBenchmarkUrl=" + pcBenchmarkUrl
				+ ", pcPostingsPerday=" + pcPostingsPerday + ", pcNeighborNbr="
				+ pcNeighborNbr + ", pcVisitorsPerDay=" + pcVisitorsPerDay
				+ ", pcPositingsPerDay=" + pcPositingsPerDay + ", pcKeywords="
				+ pcKeywords + ", pcStfScore=" + pcStfScore + ", pcStfMark="
				+ pcStfMark + ", pcInsertDt=" + pcInsertDt + ", pcUpdateDt="
				+ pcUpdateDt + ", pcDeleteDt=" + pcDeleteDt + "]";
	}

}
