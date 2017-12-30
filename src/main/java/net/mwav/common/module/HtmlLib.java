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

		try {
			// 테스트 모바일 : SAMSUNG-SGH-E250/1.0
			// Profile/MIDP-2.0Configuration/CLDC-1.1 UP.Browser/6.2.3.3.c.1.101
			// (GUI) MMP/2.0
			// ios : Mozilla/5.0 (iPhone; CPU iPhone OS 10_3 like Mac OS X)
			// AppleWebKit/602.1.50 (KHTML, like Gecko) CriOS/56.0.2924.75
			// Mobile/14E5239e Safari/602.1
			// 구글 bot : Mozilla/5.0 (compatible; Googlebot/2.1;
			// +http://www.google.com/bot.html)

			log.info("userAgent" + userAgent);
			UserAgentDetectionResult res = new UserAgentDetector()
					.parseUserAgent(userAgent);

			// http://pieroxy.net/user-agent/ 참고하여 호출

			// 봇이아닌 경우
			if (res.getBot().getFamily().toString().equals("NOT_A_BOT")) {

				log.info(res.getDevice().getDeviceType().getLabel());
				log.info(res.getDevice().toString());
				vo.setStDeviceType(res.getDevice().getDeviceType().getLabel());
				// 컴퓨터인 경우.
				if (res.getDevice().getDeviceType().equals("COMPUTER")) {
					//res.getBrowser().getFamily().getLabel()
					vo.setStBrowserInfo(res.getBrowser().getFullVersion());
				} else {
					vo.setStDeviceInfo("("
							+ res.getDevice().getBrand().getLabel() + ")");
					// 
					vo.setStBrowserInfo(res.getBrowser().getFamily().getLabel()+"("+res.getBrowser().getFullVersion()+")");
				}
			} else {
				vo.setStDeviceType(res.getBot().getFamily().getLabel());
				// res.getBot().getVendor().getLabel()
				vo.setStDeviceInfo("(" + res.getBot().getDescription() + ")");
				vo.setStBrowserInfo(res.getBrowser().getFamily().getLabel()+"("+res.getBrowser().getFullVersion()+")");
			}

			log.info("DeviceType" + res.getDevice().getDeviceType());
			vo.setStDeviceType(res.getDevice().getDeviceType().getLabel());

			vo.setStCountryInfo(res.getLocale().getCountry().getLabel());
			vo.setStHTTP_UA_CPU(res.getOperatingSystem().getVendor().getLabel()
					+ "(" + res.getOperatingSystem().getDescription() + "_"
					+ res.getOperatingSystem().getVersion() + ")");

			log.info("The operating system is "
					+ res.getOperatingSystem().getDescription()
					+ res.getOperatingSystem().getVersion());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return statisticsVO;
	}

}
