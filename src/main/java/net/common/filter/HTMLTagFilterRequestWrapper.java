package net.common.filter;

/*
 * Copyright 2008-2009 MOPAS(MINISTRY OF SECURITY AND PUBLIC ADMINISTRATION).
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.log4j.Logger;

public class HTMLTagFilterRequestWrapper extends HttpServletRequestWrapper {

	Logger log = Logger.getLogger(this.getClass());

	public HTMLTagFilterRequestWrapper(HttpServletRequest request) {
		super(request);
	}

	//치환만하며, 변환하질 않는다. 즉 param 값은 다시 뿌려줄때는 <param> 과 동일.
	//만약 아닌 경우
	/*
	 @Override public String getParameter(String name) { String value = super.getParameter(name); if(value == null) value = ""; return value.replaceAll("[<>]", ""); }
     url : http://pentode.tistory.com/85
	 * */
	@Override
	public String getParameter(String parameter) {

		String value = super.getParameter(parameter);
		//log.info("테스트1" + value);

		if (value == null) {
			return null;
		}

		StringBuffer strBuff = new StringBuffer();

		for (int i = 0; i < value.length(); i++) {
			char c = value.charAt(i);
			switch (c) {
			case '<':
				strBuff.append("&lt;");
				break;
			case '>':
				strBuff.append("&gt;");
				break;
			case '&':
				strBuff.append("&amp;");
				break;
			case '"':
				strBuff.append("&quot;");
				break;
			case '\'':
				strBuff.append("&apos;");
				break;
			default:
				strBuff.append(c);
				break;
			}
		}

		value = strBuff.toString();
		//log.info("테스트1_" + value);
		/*
		 * 결과: http://localhost:8080/filter.mwav?param=%3Ctest%3Esdfs
		 * 테스트1<test>sdfs 테스트2&lt;test&gt;sdfs
		 */
		return value;
	}

	@Override
	public String[] getParameterValues(String parameter) {

		String[] values = super.getParameterValues(parameter);
		//log.info("테스트2" + values);
		if (values == null) {
			return null;
		}

		for (int i = 0; i < values.length; i++) {
			if (values[i] != null) {
				StringBuffer strBuff = new StringBuffer();
				for (int j = 0; j < values[i].length(); j++) {
					char c = values[i].charAt(j);
					switch (c) {
					case '<':
						strBuff.append("&lt;");
						break;
					case '>':
						strBuff.append("&gt;");
						break;
					case '&':
						strBuff.append("&amp;");
						break;
					case '"':
						strBuff.append("&quot;");
						break;
					case '\'':
						strBuff.append("&apos;");
						break;
					default:
						strBuff.append(c);
						break;
					}
				}
				values[i] = strBuff.toString();
			} else {
				values[i] = null;
			}
		}
		//log.info("테스트2_" + values);
		return values;
	}

}