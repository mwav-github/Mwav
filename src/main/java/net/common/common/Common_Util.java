package net.common.common;

import java.util.Iterator;
import java.util.Random;
import java.util.Map.Entry;

import org.apache.log4j.Logger;

public class Common_Util {

	Logger log = Logger.getLogger(this.getClass());
	private static String pattern = "[a-zA-Z0-9]+$";
	private static StringBuffer returnString = null;

	public static void main(String[] args) {
		Common_Util rndStr = new Common_Util();

		System.out.println("[랜덤 문자열]");
		System.out.println("숫자 (50자리) : " + rndStr.getString(50, "1"));
		System.out.println("대문자 (16자리) : " + rndStr.getString(16, "A"));
		System.out.println("소문자 (16자리) : " + rndStr.getString(16, "a"));
		System.out.println("대문자 + 숫자 (32자리) : " + rndStr.getString(32, "A1"));
		System.out.println("소문자 + 숫자 (32자리) : " + rndStr.getString(32, "a1"));
		System.out.println("대문자 + 소문자 + 숫자 (32자리) : "
				+ rndStr.getString(15, ""));
	}

	// Overload Constructor
	public Common_Util() {
		returnString = new StringBuffer();
	}

	public Common_Util(int len) {
		returnString = new StringBuffer();
		this.setLength(len);
	}

	public Common_Util(String type) {
		returnString = new StringBuffer();
		this.setType(type);
	}

	public Common_Util(int len, String type) {
		returnString = new StringBuffer();
		this.setLength(len);
		this.setType(type);
	}

	public Common_Util(String type, int len) {
		returnString = new StringBuffer();
		this.setType(type);
		this.setLength(len);
	}

	// Get Random Character
	private static void getRndChar() {
		int r = (int) Math.round(Math.random() * 1000);

		java.util.Random random = new java.util.Random();
		int rnd = random.nextInt(1000);

		if (test(pattern, String.valueOf((char) rnd))) {
			returnString.append((char) rnd);
		} else {
			getRndChar();
		}
	}

	// Regular Express Check Function
	private static boolean test(String pattern, String value) {
		java.util.regex.Pattern p = java.util.regex.Pattern.compile(pattern);
		java.util.regex.Matcher m = p.matcher(value);
		boolean r = m.matches();

		return r;
	}

	// Set String Length
	public void setLength(int len) {
		returnString.setLength(0);
		for (int i = 0; i < Math.abs(len); i++) {
			getRndChar();
		}
	}

	// Set String Pattern Type
	public void setType(String type) {
		if (type.equals("1"))
			pattern = "[0-9]+$";
		else if (type.equals("A"))
			pattern = "[A-Z]+$";
		else if (type.equals("a"))
			pattern = "[a-z]+$";
		else if (type.equals("A1"))
			pattern = "[A-Z0-9]+$";
		else if (type.equals("a1"))
			pattern = "[a-z0-9]+$";
		else
			pattern = "[a-zA-Z0-9]+$";
	}

	// Get Random String
	public String getString() {
		return returnString.toString();
	}

	// Overload getString()
	public String getString(int len, String type) {
		this.setType(type);
		this.setLength(len);
		return this.getString();
	}

	public void selectListCommandMap(CommandMap commandMap) {
		if (commandMap.isEmpty() == false) {
			System.out.println("들어옴");
			Iterator<Entry<String, Object>> iterator = commandMap.getMap()
					.entrySet().iterator();
			Entry<String, Object> entry = null;
			while (iterator.hasNext()) {
				entry = iterator.next();
				log.debug("key : " + entry.getKey() + ",\tvalue : "
						+ entry.getValue());
				System.out.println("key : " + entry.getKey() + ",\tvalue : "
						+ entry.getValue());
			}
		}
	}
}
