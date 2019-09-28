package net.mwav.common.module;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "TechCompanyInfo")
@XmlAccessorType(XmlAccessType.PROPERTY)
public class TechCompanyInfo implements Serializable {

	private static final long serialVersionUID = 5595051664810644365L;

	@XmlElement(name = "SolutionName")
	private String solutionName;

	@XmlElement(name = "TechFirmName")
	private String techFirmName;

	@XmlElement(name = "TechManager")
	private String techManager;

	@XmlElement(name = "TechPhone")
	private String techPhone;

	@XmlElement(name = "TechFax")
	private String techFax;

	@XmlElement(name = "TechSite")
	private String techSite;

	@XmlElement(name = "TechEmail")
	private String techEmail;

	@XmlElement(name = "TechBusinessID")
	private String techBusinessID;

	@XmlElement(name = "TechFirmAddr")
	private String techFirmAddr;

	public TechCompanyInfo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getSolutionName() {
		return this.solutionName;
	}

	public String getTechFirmName() {
		return this.techFirmName;
	}

	public String getTechManager() {
		return this.techManager;
	}

	public String getTechPhone() {
		return this.techPhone;
	}

	public String getTechFax() {
		return this.techFax;
	}

	public String getTechSite() {
		return this.techSite;
	}

	public String getTechEmail() {
		return this.techEmail;
	}

	public String getTechBusinessID() {
		return this.techBusinessID;
	}

	public String getTechFirmAddr() {
		return this.techFirmAddr;
	}
}
