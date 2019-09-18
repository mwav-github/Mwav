package net.mwav.common.module;

import java.io.FileReader;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Unmarshaller;

public class XmlLib {

	private XmlLib() {
	}

	private static class XmlHolder {
		private static final XmlLib xmlLib = new XmlLib();
	}

	public XmlLib getInstance() {
		return XmlHolder.xmlLib;
	}

	/**
	 * JAXBException, IOException
	 * 
	 * @param path
	 * @param classObject
	 * @return
	 * @throws Exception
	 */
	public static Object unmarshal(final String path, final Class<?> classObject) throws Exception {

		JAXBContext jaxbContext = null;
		Unmarshaller unmarshaller = null;
		Object unmarshallerObj = null;

		// JAXB Context Create
		jaxbContext = JAXBContext.newInstance(classObject);
		// Unmarshaller Object Create
		unmarshaller = jaxbContext.createUnmarshaller();
		// unmarshall Create
		unmarshallerObj = unmarshaller.unmarshal(new FileReader(path));
		
		return unmarshallerObj;
	}

}
