package net.mwav.common.module;

import static org.junit.Assert.assertEquals;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class XmlLibTest {

	private static final Logger logger = LoggerFactory.getLogger(XmlLibTest.class);

	@Test
	public void test() throws Exception {
		String path = "./src/main/webapp/xConfig/general.xml.config";
		GeneralConfig generalConfig = (GeneralConfig) XmlLib.getInstance().unmarshal(path, GeneralConfig.class);

		Map<String, CompanyInfo> map = new HashMap<>();

		map.put("general", generalConfig.getCompanyInfo());

		// CompanyInfo of address verification
		String address = generalConfig.getCompanyInfo().getAddress();
		String expectedAddress = "GV-4F, 5-5, Ttukseom-ro 46-gil, Gwangjin-gu, Seoul , Korea [05099]";
		assertEquals(expectedAddress, address);

		logger.debug(map.get("general").getAddress());

		// CompanyInfo of tel verification
		String tel = generalConfig.getCompanyInfo().getTel();
		String expectedTel = "+82-70-4655-4777";
		assertEquals(expectedTel, tel);

		// TechCompanyInfo of TechFirmName verification
		String techFirmName = generalConfig.getTechCompanyInfo().getTechFirmName();
		String expectedTechFirmName = "Mwav Co., Ltd.";
		assertEquals(expectedTechFirmName, techFirmName);

		// TechCompanyInfo of TechSite verification
		String techSite = generalConfig.getTechCompanyInfo().getTechSite();
		String expectedTechSite = "https://www.mwav.net";
		assertEquals(expectedTechSite, techSite);

		// WebSiteInfo of Keywords verification
		//String keywords = generalConfig.getWebSiteInfo().getKeywords();
		//String expectedKeywords = "Digital Marketing, E-Consulting, IT Consulting, WebSite Building, Cloud, AI, MR, VR, AR, IoT Platform, Deep Learning, Agile, DevOps, Domain, Web Hosting, Server Hosting, Hosting, HomePage, IT Solution, IT Product, DataBase, Maintenance, EC, Shopping Mall, Web Mail, News Solution, 디지털마케팅, E-컨설팅, IT컨설팅, 웹사이트 제작, 클라우드, 인공지능, 증강현실, 혼합현실, 가상현실, IOT 플랫폼, 딥 러닝, 에자일, 데브옵스, 도메인, 웹호스팅, 서버호스팅, 호스팅, 홈페이지, 웹사이트, 솔루션개발, 데이터베이스, 유지보수, 전자상거래, 쇼핑몰, 웹메일, 뉴스솔루션";
		//assertEquals(expectedKeywords, keywords);

		// WebSiteInfo of Description verification
		//String description = generalConfig.getWebSiteInfo().getDescription();
		//String expectedDescription = "This is the website for Mwav.net. We are an IT development company possessing total E-Commerce platform based on the fancy technologies. You can contact at https://www.mwav.net/CustomerService/Contact/Contact.mwav?modal=Q&A if you have a question or an inquiry on the site.";
		//assertEquals(expectedDescription, description);
	}

}
