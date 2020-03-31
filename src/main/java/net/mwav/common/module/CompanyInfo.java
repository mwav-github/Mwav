package net.mwav.common.module;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "CompanyInfo")
@XmlAccessorType(XmlAccessType.PROPERTY)
public class CompanyInfo implements Serializable {

	private static final long serialVersionUID = 6389346497128748666L;

	@XmlElement(name = "CompanyName")
	private String companyName;
	@XmlElement(name = "FirmName")
	private String firmName;
	@XmlElement(name = "Chief_IT_BusinessAdvisor")
	private String chief_IT_BusinessAdvisor;
	@XmlElement(name = "CEO")
	private String ceo;
	@XmlElement(name = "WebSiteManager")
	private String webSiteManager;
	@XmlElement(name = "MarketingManager")
	private String marketingManager;
	@XmlElement(name = "SitePromoter")
	private String sitePromoter;
	@XmlElement(name = "TEL")
	private String tel;
	@XmlElement(name = "FAX")
	private String fax;
	@XmlElement(name = "SiteAddress")
	private String siteAddress;
	@XmlElement(name = "FirmEmail")
	private String firmEmail;
	@XmlElement(name = "BusinessID")
	private String businessID;
	@XmlElement(name = "Address")
	private String address;
	@XmlElement(name = "Copyright")
	private String copyright;
	@XmlElement(name = "BranchOfficeInfo")
	private BranchOfficeInfo branchOfficeInfo;

	public CompanyInfo() {
		super();
	}

	public String getCompanyName() {
		return this.companyName;
	}

	public String getFirmName() {
		return this.firmName;
	}

	public String getChief_IT_BusinessAdvisor() {
		return this.chief_IT_BusinessAdvisor;
	}

	public String getCeo() {
		return this.ceo;
	}

	public String getWebSiteManager() {
		return this.webSiteManager;
	}

	public String getMarketingManager() {
		return this.marketingManager;
	}

	public String getSitePromoter() {
		return this.sitePromoter;
	}

	public String getTel() {
		return this.tel;
	}

	public String getFax() {
		return this.fax;
	}

	public String getSiteAddress() {
		return this.siteAddress;
	}

	public String getFirmEmail() {
		return this.firmEmail;
	}

	public String getBusinessID() {
		return this.businessID;
	}

	public String getAddress() {
		return this.address;
	}

	public String getCopyright() {
		return this.copyright;
	}
	
	public BranchOfficeInfo getBranchOfficeInfo() {
		return branchOfficeInfo;
	}
}
