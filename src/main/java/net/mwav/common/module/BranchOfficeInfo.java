package net.mwav.common.module;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "BranchOfficeInfo")
@XmlAccessorType(XmlAccessType.PROPERTY)
public class BranchOfficeInfo implements Serializable {

	private static final long serialVersionUID = -4778917009872914779L;
	
	@XmlElement(name = "Address")
	private String address;
	
	@XmlElement(name = "TEL")
	private String tel;
	
	@XmlElement(name = "FirmEmail")
	private String firmEmail;
	
	public String getAddress() {
		return this.address;
	}
	
	public String getTel() {
		return this.tel;
	}
	
	public String getFirmEmail() {
		return this.firmEmail;
	}

}
