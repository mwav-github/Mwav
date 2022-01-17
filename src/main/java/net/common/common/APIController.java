package net.common.common;

import net.mwav.common.module.Common_Utils;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class APIController {
	private static final Logger logger = LoggerFactory.getLogger(APIController.class);

	@RequestMapping(value = "/API/googleShorten.mwav")
	public @ResponseBody String insertQAFormaAjax(@RequestBody String data,
			HttpServletRequest request) throws Exception {

		String originalURL = data;
		logger.debug("originalURL=" + originalURL);
		String shortenURL = null;

		try {
			shortenURL = APIGoogleShorten.getShortenUrl(originalURL);
			logger.debug("url출력" + shortenURL);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return shortenURL;
	}

	@RequestMapping(value = "/API/NaverShorten.mwav")
	public @ResponseBody String getNaverShortenUrl(@RequestBody String data,
			HttpServletRequest request) throws Exception {

		String originalURL = data;
		String shortenURL = null;
		String dataJsonString = null;

		try {
			dataJsonString = APINaverShorten.getNaverShortenUrl(originalURL);
		
			JSONParser jsonParser = new JSONParser();

			// JSON데이터를 넣어 JSON Object 로 만들어 준다.
			JSONObject jsonObject = (JSONObject) jsonParser
					.parse(dataJsonString);
			JSONObject resultObject = (JSONObject) jsonObject.get("result");

			shortenURL = (String) resultObject.get("url");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return shortenURL;
	}
}