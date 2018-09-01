package net.common.common;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.maven.model.Model;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;

import net.common.common.CommandMap;
import net.mwav.common.module.Common_Utils;

@Controller
public class APIController {
	Logger log = Logger.getLogger(this.getClass());

	Common_Utils cou = new Common_Utils();

	@RequestMapping(value = "/API/googleShorten.mwav")
	public @ResponseBody String insertQAFormaAjax(@RequestBody String data,
			HttpServletRequest request) throws Exception {

		String originalURL = data;
		System.out.println("originalURL=" + originalURL);
		String shortenURL = null;

		try {
			shortenURL = APIGoogleShorten.getShortenUrl(originalURL);
			System.out.println("url출력" + shortenURL);
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