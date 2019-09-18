package net.mwav.common.module;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "GeneralConfig")
@XmlAccessorType(XmlAccessType.PROPERTY)
public class GeneralConfig implements Serializable {

	private static final long serialVersionUID = -5179262290367133549L;

	@XmlElement(name = "CompanyInfo")
	private CompanyInfo companyInfo;
	@XmlElement(name = "TechCompanyInfo")
	private TechCompanyInfo techCompanyInfo;
	@XmlElement(name = "WebSiteInfo")
	private WebSiteInfo webSiteInfo;

	public GeneralConfig() {
		super();
	}

	public CompanyInfo getCompanyInfo() {
		return this.companyInfo;
	}

	public TechCompanyInfo getTechCompanyInfo() {
		return this.techCompanyInfo;
	}

	public WebSiteInfo getWebSiteInfo() {
		return this.webSiteInfo;
	}
}
