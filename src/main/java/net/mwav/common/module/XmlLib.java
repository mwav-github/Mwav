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

	public static XmlLib getInstance() {
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
	public Object unmarshal(final String path, final Class<?> cls) throws Exception {

		JAXBContext jaxbContext = null;
		Unmarshaller unmarshaller = null;
		Object unmarshallerObj = null;

		jaxbContext = JAXBContext.newInstance(cls);
		unmarshaller = jaxbContext.createUnmarshaller();
		unmarshallerObj = unmarshaller.unmarshal(new FileReader(path));

		return unmarshallerObj;
	}

}
