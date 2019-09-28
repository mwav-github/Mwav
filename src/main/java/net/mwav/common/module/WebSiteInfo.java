package net.mwav.common.module;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "WebSiteInfo")
@XmlAccessorType(XmlAccessType.PROPERTY)
public class WebSiteInfo implements Serializable {

	private static final long serialVersionUID = -6007532528842669902L;

	@XmlElement(name = "Keywords")
	private String keywords;
	@XmlElement(name = "Description")
	private String description;

	public WebSiteInfo() {
		super();
	}

	public String getKeywords() {
		return this.keywords;
	}

	public String getDescription() {
		return this.description;
	}

}
