package net.mwav.common.module;

import org.apache.log4j.Logger;

import net.mwav.statistics.vo.StatisticsVO;
import net.pieroxy.ua.detection.*;

/**
 * @author student
 *
 */
public class HtmlLib {
	Logger log = Logger.getLogger(this.getClass());
	StatisticsVO statisticsVO;

	private static HtmlLib htmlLib;

	private HtmlLib() {
	}

	public static synchronized HtmlLib getInstance() {
		if (htmlLib == null) {
			htmlLib = new HtmlLib();
		}
		return htmlLib;
	}

	/**
	 * UserAgent 분석.
	 * 
	 * @param vo
	 * 
	 * @param UserAgent
	 *            날짜
	 * @return 계산된 일자의 요일(DAY_OF_WEEK)
	 * @brief You can parse the user-agent using the static
	 *        UserAgent.parseUserAgentString() method. This returns information
	 *        about the browser and operating system.
	 * 
	 *        String macChrome =
	 *        "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36"
	 *        ; printUa(UserAgent.parseUserAgentString(macChrome));
	 * 
	 *        API Document :
	 *        http://pieroxy.net/user-agent/doc/net/pieroxy/ua/detection
	 *        /package-summary.html
	 */
	public StatisticsVO getParseUserAgent(String userAgent, StatisticsVO vo) {
		
		//* 중요 우리기준으로 가져가야한다. 라이브러리 만약 바꾸게되면 대문자 띄어쓰기 다달라지니. 특히 PC, Mobile 구분은 
		//http://www.webapps-online.com/online-tools/user-agent-strings/dv/operatingsystem51849/ios

		try {
			// PC : Mozilla/5.0 (Windows; U; Windows NT 6.1; ko; rv:1.9.2.8) Gecko/20100722 Firefox/3.6.8 IPMS/A640400A-14D460801A1-000000426571
			// 테스트 모바일 : SAMSUNG-SGH-E250/1.0 Profile/MIDP-2.0Configuration/CLDC-1.1 UP.Browser/6.2.3.3.c.1.101(GUI) MMP/2.0
			// ios : Mozilla/5.0 (iPhone; CPU iPhone OS 10_3 like Mac OS X)AppleWebKit/602.1.50 (KHTML, like Gecko) CriOS/56.0.2924.75 Mobile/14E5239e Safari/602.1
	        // 아이폰 7 : Mozilla/5.0 (iPhone; CPU iPhone OS 7_0_6 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) CriOS/33.0.1750.14 Mobile/11B651 Safari/9537.53 (47328A61-EB88-4D99-88BD-42F1D5BB7BE0)
			// edge : Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36 Edge/16.16299
			/*
			구글 bot : Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)
			 bing bot : Mozilla/5.0 (compatible; Bingbot/2.0; +http://www.bing.com/bingbot.htm)
            facebook bot : facebookexternalhit/1.0 (+http://www.facebook.com/externalhit_uatext.php)
            
            국가 : Mozilla/5.0 (Linux; Android 4.2.2; nl-nl; SAMSUNG GT-I9505 Build/JDQ39) AppleWebKit/535.19 (KHTML, like Gecko) Version/1.0 Chrome/18.0.1025.308 Mobile Safari/535.19
 */
			

			log.info("userAgent" + userAgent);
			UserAgentDetectionResult res = new UserAgentDetector()
					.parseUserAgent(userAgent);

			// http://pieroxy.net/user-agent/ 참고하여 호출

			// 봇이아닌 경우
			if (res.getBot().getFamily().toString().equals("NOT_A_BOT")) {
				vo.setStDeviceType(res.getDevice().getDeviceType().getLabel());
				// 컴퓨터인 경우.
				if (res.getDevice().getDeviceType().getLabel()
						.equals("COMPUTER")) {
					// res.getBrowser().getFamily().getLabel()
					vo.setStDeviceInfo(res.getDevice().getBrand().getLabel()
							+ "(" + res.getDevice().getDevice() + ")");
					//
					vo.setStBrowserInfo(res.getBrowser().getDescription()
							+ "(" + res.getBrowser().getFullVersion() + ")");
				} else {
					//아이폰인 경우 
					if (res.getDevice().getDevice().equals("iPhone")) {
						vo.setStDeviceInfo(res.getDevice().getBrand().getLabel()
								+ "(" + res.getDevice().getDevice() + res.getOperatingSystem().getVersion() + ")");
					
						vo.setStBrowserInfo(res.getBrowser().getFamily().getLabel()
								+ "(" + res.getBrowser().getFullVersion() + ")");
					}
					else{
					vo.setStDeviceInfo(res.getDevice().getBrand().getLabel()
							+ "(" + res.getDevice().getDevice() + ")");
					//
					vo.setStBrowserInfo(res.getBrowser().getFamily().getLabel()
							+ "(" + res.getBrowser().getFullVersion() + ")");
					}
				}
			} else {
				// 로봇인 경우
				vo.setStDeviceType(res.getBot().getFamily().toString());
				// res.getBot().getVendor().getLabel()
				vo.setStDeviceInfo(res.getBot().getDescription() + "("
						+ res.getBot().getVersion() + ")");
				vo.setStBrowserInfo(null);
			}


			vo.setStDeviceType(res.getDevice().getDeviceType().getLabel());

			if(!(res.getLocale().getCountry().getLabel().equals("Unknown"))){
			vo.setStCountryInfo(res.getLocale().getCountry().getLabel());
			}
			vo.setStHTTP_UA_CPU(res.getOperatingSystem().getVendor().getLabel()
					+ "(" + res.getOperatingSystem().getDescription() + "_"
					+ res.getOperatingSystem().getVersion() + ")");

			
			//DeviceType : PHONE / TABLET / COMPUTER / SDK / UNKNOWN/ CONSOLE / UNKNOWN_MOBILE
			//DeviceInfo : PC / Galaxy S4, Exhibit 4G	
			//Iphone 버전 구분안되는 이슈. 아이폰은 다 똑같아서 스크린사이즈로 구분해야한다. 
			// 7까지는 useragent-detetor 에 버전 구분.
			// 8, 8S, X 모두 iPhone OS 11_0 iPhone 8 - (750px x 1334px)  / iPhone 8 Plus - (1242px x 2208px)/ iPhone X - (1125px x 2436px)
			//https://stackoverflow.com/questions/46261031/what-would-be-the-user-agent-string-for-iphone-8-iphone-8-plus-and-iphone-x
			// -> As far as I know, user agent for iPhone 8, iPhone 8 plus and iPhone X are same. To detect device we need to check screen size of the device.
			log.info("DeviceType = " + vo.getStDeviceType());
			log.info("DeviceInfo = " + vo.getStDeviceInfo());
			log.info("BrowerInfo = " + vo.getStBrowserInfo());
			log.info("CountryInfo = " + vo.getStCountryInfo());
			log.info("CPU" + vo.getStHTTP_UA_CPU());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return statisticsVO;
	}

}
