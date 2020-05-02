package net.mwav.common.module;

import static org.junit.Assert.assertEquals;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;

public class XmlLibTest {

	@Test
	public void test() throws Exception {
		String path = "./src/main/webapp/xConfig/footer.xml";
		GeneralConfig generalConfig = (GeneralConfig) XmlLib.getInstance().unmarshal(path, GeneralConfig.class);
		List<CompanyInfo> list = new ArrayList<CompanyInfo>();

		Map<String, CompanyInfo> map = new HashMap<>();

		map.put("general", generalConfig.getCompanyInfo());
		
		// CompanyInfo of address verification
		String address = generalConfig.getCompanyInfo().getAddress();
		String expectedAddress = "GV-4F, 5-5, Ttukseom-ro 46-gil, Gwangjin-gu, Seoul , Korea [05099]";
		assertEquals(expectedAddress, address);
		
		System.out.println(map.get("general").getAddress());

		// CompanyInfo of tel verification
		String tel = generalConfig.getCompanyInfo().getTel();
		String expectedTel = "+82-70-4655-4777";
		assertEquals(expectedTel, tel);

		// TechCompanyInfo of TechFirmName verification
		String techFirmName = generalConfig.getTechCompanyInfo().getTechFirmName();
		String expectedTechFirmName = "엠웨이브";
		assertEquals(expectedTechFirmName, techFirmName);

		// TechCompanyInfo of TechSite verification
		String techSite = generalConfig.getTechCompanyInfo().getTechSite();
		String expectedTechSite = "http://www.Mwav.net";
		assertEquals(expectedTechSite, techSite);

		// WebSiteInfo of Keywords verification
		String keywords = generalConfig.getWebSiteInfo().getKeywords();
		String expectedKeywords = "E-컨설팅, 도메인, 웹호스팅, 서버호스팅, 호스팅, 홈페이지, 웹사이트, 솔루션개발, 데이터베이스, 유지보수, 전자상거래, 쇼핑몰, 웹메일, 뉴스솔루션, 서버, 파이어월, 스토리지, 네트워크, 하드웨어, e-consulting, domain, web hosting, server hosting, hosting, homepage, web solution, database, maintenance, EC, shopping mall, web mail, news solution, server, firewall, storage, network, h/w";
		assertEquals(expectedKeywords, keywords);

		// WebSiteInfo of Description verification
		String description = generalConfig.getWebSiteInfo().getDescription();
		String expectedDescription = "This is the website for Mwav.net and has been developed by Nam Jin, Cho. You can contact him at webmaster@mwav.net if you have a question or an inquiry on the site.";
		assertEquals(expectedDescription, description);
	}

}
