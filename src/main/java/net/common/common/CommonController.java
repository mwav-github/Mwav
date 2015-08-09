package net.common.common;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import net.common.common.CommandMap;
import net.mwav.board.service.BoardService;

@Controller
public class CommonController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "boardService")
	private BoardService boardService;

	@RequestMapping(value = "/board/testMapArgumentResolver.do")
	public ModelAndView testMapArgumentResolver(CommandMap commandMap)
			throws Exception {
		ModelAndView mv = new ModelAndView("");
	
		if (commandMap.isEmpty() == false) {
			Iterator<Entry<String, Object>> iterator = commandMap.getMap()
					.entrySet().iterator();
			Entry<String, Object> entry = null;
			while (iterator.hasNext()) {
				entry = iterator.next();
				log.debug("key : " + entry.getKey() + ",\tvalue : "
						+ entry.getValue());
			}
		}
		return mv;
	}
	
	@RequestMapping(value = "/board/HTTP.do")
	public class PrintHeader extends HttpServlet {
	    private static final long serialVersionUID = 1L;
	        
	    /**
	     * @see HttpServlet#HttpServlet()
	     */
	    public PrintHeader() {
	        super();
	        // TODO Auto-generated constructor stub
	    }
	 
	    /**
	     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	     */
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
	            throws ServletException, IOException {
	        // TODO Auto-generated method stub
	        PrintWriter out = response.getWriter();
	        out.println("<html><body>");
	        Enumeration headerNames = request.getHeaderNames();
	        while(headerNames.hasMoreElements()){
	            String name = (String)headerNames.nextElement();
	            String value = request.getHeader(name);
	            out.println(name + " : " + value + "<br>");
	        }
	        out.println("</body<</html>");
	    }
	 
	    /**
	     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	     */
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
	            throws ServletException, IOException {
	        // TODO Auto-generated method stub
	    }
	 
	}
}

/*
	*//**
 * Mapping 주소가 없는 경우 UrlBasedViewResolver 의 Prefix 있는 JSP 자동연결
 */
/*
 * @RequestMapping(value = "/Company/BusinessField/BusinessFields", method =
 * RequestMethod.GET) public String disappoint(HttpServletRequest request,
 * HttpServletResponse response, Locale locale, Model model) {
 * 
 * String view = request.getRequestURI(); System.out.println("1 "+view); String
 * ctx = request.getContextPath(); System.out.println("2 "+ctx);
 * 
 * System.out.println("3 "+view.substring(1+ctx.length(), view.length()-3));
 * 
 * return view.substring(1+ctx.length(), view.length()-3);
 * 
 * }
 */

