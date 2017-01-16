package net.mwav.member.contrloller;

import 	 java.io.BufferedReader;
import 	 java.io.InputStream;
import 	 java.io.InputStreamReader;
import 	 java.net.MalformedURLException;
import 	 java.net.URL;
import 	 java.net.URLConnection;
import 	 java.net.URLEncoder;
import 	 java.util.List;

import 	 javax.annotation.Resource;
import 	 javax.servlet.http.HttpServletRequest;
import 	 javax.servlet.http.HttpServletResponse;

import net.mwav.common.module.Paging;
import net.mwav.common.module.PagingVO;

import 	 org.springframework.stereotype.Controller;
import 	 org.springframework.ui.Model;
import 	 org.springframework.ui.ModelMap;
import 	 org.springframework.validation.BindingResult;
import 	 org.springframework.web.bind.annotation.ModelAttribute;
import 	 org.springframework.web.bind.annotation.RequestMapping;
import 	 org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import 	 org.springframework.web.bind.annotation.SessionAttributes;
import 	 org.springframework.web.bind.support.SessionStatus;
//import 	 org.springmodules.validation.commons.DefaultBeanValidator;
/*
파일명 : apiSampleXMLController.java
내  용 : 웹 ↔ Java Controller ↔ 도로명주소 검색API 방식(검색결과형식 XML)
*/
@Controller
//@SessionAttributes(types=SampleVO.class)
public class  PostController {	
//Mwav 승인키  팝업 api : U01TX0FVVEgyMDE2MTEyNTE3MDYyMjE2ODQ0
//Mwav 승인키  검색 api : U01TX0FVVEgyMDE2MTEyNTE3MjUyODE2ODQ1

/*   @Resource(name = "sampleService")
   private  EgovSampleService sampleService;    

   @Resource(name = "propertiesService")
   protected  EgovPropertyService propertiesService;

   @Resource(name = "beanValidator")
   protected  DefaultBeanValidator beanValidator;*/

   @RequestMapping(value="/sample/getAddrApi.mwav")
   public void getAddrApi(
                          HttpServletRequest req, ModelMap model, HttpServletResponse response) throws Exception {

	 //현재 페이지 
   	String currentPage = req.getParameter("currentPage");
	
   	//한페이지에 보여줄 것. 10고정일듯
   	//int countPerPage = Integer.parseInt(req.getParameter("countPerPage"));
   	String countPerPage = req.getParameter("countPerPage");
   	//16/11/26 서버사이드 페이징 처리를 위하여.
   
   	System.out.println("currentPage"+currentPage);
   	System.out.println("countPerPage"+countPerPage);
   	//System.out.println("totalRow"+totalRow);
   	//Paging paging = new Paging();
   	//PagingVO pagingVO = paging.setPagingInfo(totalRow, countPerPage, currentPage);
   	
   	String confmKey = req.getParameter("confmKey");
	String keyword = req.getParameter("keyword");
	String apiUrl = "http://www.juso.go.kr/addrlink/addrLinkApi.mwav?currentPage="+currentPage
									+"&countPerPage="+countPerPage+"&keyword="+URLEncoder.encode(keyword,"UTF-8")
									+"&confmKey="+"U01TX0FVVEgyMDE2MTEyNTE3MjUyODE2ODQ1";
   	URL url = new URL(apiUrl);
   	BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream(),"UTF-8"));
   	StringBuffer sb = new StringBuffer();
   	String tempStr = null;
   	while(true){ 
    		tempStr = br.readLine();
    		if(tempStr == null) break;
    		sb.append(tempStr);	
    	}
   	
   	System.out.println("xml전문"+sb.toString());
   	
   	//sb.append(pagingVO);
    	br.close();
    	response.setCharacterEncoding("UTF-8");
    	response.setContentType("text/xml");
    	response.getWriter().write(sb.toString());
    	
		//return pagingVO;
    }
}