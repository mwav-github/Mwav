package net.mwav.common.module;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.w3c.dom.Node;
import org.w3c.dom.Element;
import org.xml.sax.SAXException;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class DomReadXMLFile {

	public static Map<String, Object> xmlParser(String fileName) throws ParserConfigurationException, IOException, SAXException {
		

			File fXmlFile = new File(fileName);
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory
					.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			Document doc = dBuilder.parse(fXmlFile);

			// optional, but recommended
			// read this -
			// http://stackoverflow.com/questions/13786607/normalization-in-dom-parsing-with-java-how-does-it-work
			doc.getDocumentElement().normalize();

			System.out.println("Root element :"
					+ doc.getDocumentElement().getNodeName());
			
			Map<String, Object> map = new HashMap<String, Object>();
			NodeList allNodes = doc.getFirstChild().getChildNodes();
				
			Node node;

			System.out.println("Sdfd"+allNodes.getLength());
			NodeList nList = doc.getElementsByTagName("CompanyInfo");
			System.out.println("Sdfd11"+nList);
			System.out.println("Sdfd11"+nList.getLength());

			int i = 0;
			while (i < nList.getLength()) {
				node = nList.item(i);
				if (node instanceof Element) {
					System.out.println("이름"+node.getNodeName());
					System.out.println("내용"+node.getTextContent());
					map.put(node.getNodeName(), node.getTextContent());
					System.out.println("출력출력");
					
				}
				i++;
			}
			
		

			/*
			 * 
			 * NodeList nList = doc.getElementsByTagName("staff");
			 * 
			 * System.out.println("----------------------------");
			 * 
			 * for (int temp = 0; temp < nList.getLength(); temp++) {
			 * 
			 * Node nNode = nList.item(temp);
			 * 
			 * System.out.println("\nCurrent Element :" + nNode.getNodeName());
			 * 
			 * if (nNode.getNodeType() == Node.ELEMENT_NODE) {
			 * 
			 * Element eElement = (Element) nNode;
			 * 
			 * System.out.println("Staff id : " + eElement.getAttribute("id"));
			 * System.out.println("First Name : " +
			 * eElement.getElementsByTagName
			 * ("firstname").item(0).getTextContent());
			 * System.out.println("Last Name : " +
			 * eElement.getElementsByTagName(
			 * "lastname").item(0).getTextContent());
			 * System.out.println("Nick Name : " +
			 * eElement.getElementsByTagName(
			 * "nickname").item(0).getTextContent());
			 * System.out.println("Salary : " +
			 * eElement.getElementsByTagName("salary"
			 * ).item(0).getTextContent());
			 * 
			 * } }
			 */
		
		return map;
	}

}