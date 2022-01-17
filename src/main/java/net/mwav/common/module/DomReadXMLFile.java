package net.mwav.common.module;

import net.common.Interceptor.AuthInterceptor;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class DomReadXMLFile {

	private static final Logger logger = LoggerFactory.getLogger(DomReadXMLFile.class);

	public static Map<String, Object> xmlParser(String fileName) throws ParserConfigurationException, IOException, SAXException {
		Log log = LogFactory.getLog(AuthInterceptor.class);
			File fXmlFile = new File(fileName);
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			Document doc = dBuilder.parse(fXmlFile);

			// optional, but recommended
			// read this -
			// http://stackoverflow.com/questions/13786607/normalization-in-dom-parsing-with-java-how-does-it-work
			doc.getDocumentElement().normalize();

			logger.debug("Root element :" + doc.getDocumentElement().getNodeName());

			Map<String, Object> map = new HashMap<String, Object>();

			Node node;

			node = doc.getDocumentElement().getFirstChild();
			logger.debug("Sdfd"+node.getNodeName());

			NodeList nList = node.getChildNodes();

			logger.debug("Sdfd11"+nList.getLength());

			int i = 0;
			while (i < nList.getLength()) {
				node = nList.item(i);
				if (node instanceof Element) {
					logger.debug("이름"+node.getNodeName());
					logger.debug("내영"+node.getNodeValue());
					//logger.debug("내용"+);
					//map.put(node.getNodeName(), (Object) node.getTextContent());
					logger.debug("출력출력");

				}
				i++;
			}



			/*
			 *
			 * NodeList nList = doc.getElementsByTagName("staff");
			 *
			 * logger.debug("----------------------------");
			 *
			 * for (int temp = 0; temp < nList.getLength(); temp++) {
			 *
			 * Node nNode = nList.item(temp);
			 *
			 * logger.debug("\nCurrent Element :" + nNode.getNodeName());
			 *
			 * if (nNode.getNodeType() == Node.ELEMENT_NODE) {
			 *
			 * Element eElement = (Element) nNode;
			 *
			 * logger.debug("Staff id : " + eElement.getAttribute("id"));
			 * logger.debug("First Name : " +
			 * eElement.getElementsByTagName
			 * ("firstname").item(0).getTextContent());
			 * logger.debug("Last Name : " +
			 * eElement.getElementsByTagName(
			 * "lastname").item(0).getTextContent());
			 * logger.debug("Nick Name : " +
			 * eElement.getElementsByTagName(
			 * "nickname").item(0).getTextContent());
			 * logger.debug("Salary : " +
			 * eElement.getElementsByTagName("salary"
			 * ).item(0).getTextContent());
			 *
			 * } }
			 */

		return map;
	}

}