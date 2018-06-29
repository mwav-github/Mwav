package net.common.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.maven.model.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
		System.out.println("originalURL="+originalURL);
		String shortenURL = null;
		
		try {
			shortenURL = APIGoogleShorten.getShortenUrl(originalURL);
			System.out.println("url출력"+ shortenURL);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return shortenURL;
	}
}