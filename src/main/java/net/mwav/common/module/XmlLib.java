package net.mwav.common.module;

import java.io.FileReader;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Unmarshaller;

/**
 *<pre>description : Utility class to parse a XML document</pre>
 *@class name : XmlLib.java
 *@author : (정) 조도형
            (부) 남동희
 *@since : 2019. 9. 28.
 *@version : v1.0
 *@see
   javax.xml.bind
 * @history :
   ----------------------------------------
   * Modification Information(개정이력)
   ----------------------------------------
           수정일                   수정자                        수정내용
   --------    --------    ----------------
   2019. 9. 28.     78371   First commit
 */
public class XmlLib {

	private XmlLib() {
	}

	private static class XmlHolder {
		private static final XmlLib xmlLib = new XmlLib();
	}
	
	/**
	 * <pre>description : Instance method of XmlLib Class</pre>
	 * @method name : getInstance
	 * @author : (정) 조도형
	             (부) 남동희
	 * @since  : 2019. 9. 28.
	 * @version : v1.0
	 * @see :
	 * @history :
	   ----------------------------------------
	   * Modification Information(개정이력)
	   ----------------------------------------
	           수정일                  수정자                       수정내용
	   --------    --------    ----------------
	   2019. 9. 28.     78371     First commit
	 * @param :
	 * @return :
	 * @throws : 
	 <pre>
	 * {@code :
	 * ValidationLib xml = XmlLib.getInstance();
	 * } 
	 </pre>
	 */
	public static XmlLib getInstance() {
		return XmlHolder.xmlLib;
	}

	/**
	 * <pre>description : Parse a XML data to Java object</pre>
	 * @method name : unmarshal
	 * @author : (정) 조도형
	             (부) 남동희
	 * @since  : 2019. 9. 28.
	 * @version : v1.0
	 * @see :
	   javax.xml.bind.JAXBContext
	   javax.xml.bind.Unmarshaller
	 * @history :
	   ----------------------------------------
	   * Modification Information(개정이력)
	   ----------------------------------------
	           수정일                  수정자                       수정내용
	   --------    --------    ----------------
	   2019. 9. 28.     78371     First commit
	 * @param : 
	   final String   path - Path of XML document
	   final Class<?> cls  - Class to describe a XML tree structure(element and node)
	 * @return : Java object which contains the XML data
	 * @throws : Exception
	 <pre>
	 * {@code :
	 * ValidationLib xml = XmlLib.getInstance();
	 * Object xmlData = xml.unmarshal(path, xmlFormat);
	 * } 
	 </pre>
	 */
	public Object unmarshal(final String path, final Class<?> cls) throws Exception {

		JAXBContext jaxbContext = null;
		Unmarshaller unmarshaller = null;
		Object unmarshallerObj = null;

		jaxbContext = JAXBContext.newInstance(cls);
		unmarshaller = jaxbContext.createUnmarshaller();
		unmarshallerObj = unmarshaller.unmarshal(new FileReader(path));

		return unmarshallerObj;
	}
	
	public Class<?> test(final String path, final Class<?> cls) throws Exception {
		Class<?> generalConfig = (Class<?>) XmlLib.getInstance().unmarshal(path, cls);	
		
		return generalConfig;
	}

}
