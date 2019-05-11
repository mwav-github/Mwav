package net.mwav.common.module;

import java.util.regex.Pattern;

/**
 * 
 * @class name : ValidationLib.java
 * @description : Utility Class for validation check.
 * 				  It is a Singleton Class so use getInstance() method to get a reference.
 * 				  Implemented by Regular Expression so this Class depends on java.utils.regex.Pattern.
 * @author : (정) 남동희
             (부)
 * @since : 2019. 4. 19.
 * @version : v1.2
 * @see
 * @history :
   ----------------------------------------
 * Modification Information(개정이력)
   ----------------------------------------
     수정일              수정자              수정내용
   --------    --------    ----------------
 * 2017.08.24     김주성          	최초 생성
 * 2019.02.25     남동희	   	유효성 검증에 필요한 기본 메서드 추가
 * 2019.04.19     남동희		isId, isPassword 삭제 및 메서드 분리			
 */
public class ValidationLib {
	private ValidationLib() {}

	private static class ValidationHolder {
		private static final ValidationLib validationLib = new ValidationLib();
	}
	
	/**
	 * 
	 * @method name : getInstance
	 * @author : (정) 남동희
	             (부)
	 * @since  : 2019. 4. 19.
	 * @version : v1.0
	 * @see :
	 * @description : Instance method of ValidationLib Class
	 * @history :
	   ----------------------------------------
	   * Modification Information(개정이력)
	   ----------------------------------------
	     수정일     		수정자        	수정내용
	   --------    --------    ----------------
	   2019. 4. 19. 남동희		최초 생성     
	 * @param :
	 * @return : ValidationLib
	 * @throws : 
	 <pre>
	 * {@code : 
	 * ValidationLib validation = ValidationLib.getInstance();
	 * } 
	 </pre>
	 */
	public static ValidationLib getInstance() {
		return ValidationHolder.validationLib;
	}

	/**
	 * 
	 * @method name : isLength
	 * @author : (정) 남동희
	             (부)
	 * @since  : 2019. 2. 25.
	 * @version : v1.1
	 * @see :
	 * @description : Returns true if length(string) >=  minimum length.
	 * @history :
	   ----------------------------------------
	   * Modification Information(개정이력)
	   ----------------------------------------
	     수정일             수정자              수정내용
	   --------    --------    ----------------
	   2019. 2. 25. 남동희     	    최초 생성
	 * @param : CharSequence input - input String <br>
	 * 			int min - minimum length
	 * @return : boolean
	 * @throws : throws ArithmeticException if minimun length <= 0 
	 <pre>
	 * {@code : example
	 * validation.isLength("1234",3) returns true
	 * validation.isLength("1234",5) returns false
	 * } 
	 </pre>
	 */
	public boolean isLength(CharSequence input, int min) {
		if (min < 0)
			throw new ArithmeticException("Must be greater or equal than zero. min : " + min);
		return input.length() >= min;
	}

	/**
	 * 
	 * @method name : isLength
	 * @author : (정) 남동희
	             (부)
	 * @since  : 2019. 2. 25.
	 * @version : v1.1
	 * @see : ValidationLib.isLength(String, int)
	 * 		  ValidationLib.isLength(String, int, int)
	 * @description : Compares legnth of input String according to mode. <br>
	 * 				  When mode is true, returns true if length(string) '>=' criteria length. <br>
	 * 				  Otherwise, returns true if length(string) '<=' criteria length. 
	 * @history :
	   ----------------------------------------
	   * Modification Information(개정이력)
	   ----------------------------------------
	     수정일     		수정자       	 수정내용
	   --------    --------    ----------------
	   2019. 2. 25. 남동희		최초 생성     
	 * @param : CharSequence input - input String <br>
	 * 			int criteria - criteria length <br>
	 * 			boolean mode - comparison mode
	 * @return : boolean
	 * @throws : throws ArithmeticException if boundary <= 0
	 <pre>
	 * {@code : 
	 * validation.isLength("1234", 2, true) returns true
	 * validation.isLength("1234", 5, false) returns true
	 * } 
	 </pre>
	 */
	public boolean isLength(CharSequence input, int criteria, boolean mode) {
		if (criteria < 0)
			throw new ArithmeticException("Must be greater or equal than zero. criteria : " + criteria);
		return mode ? isLength(input, criteria) : isLength(input, 0, criteria);
	}

	/**
	 * 
	 * @method name : isLength
	 * @author : (정) 남동희
	             (부)
	 * @since  : 2019. 2. 25.
	 * @version : v1.1
	 * @see :
	 * @description : Returns true if length(String) is in interval.
	 * @history :
	   ----------------------------------------
	   * Modification Information(개정이력)
	   ----------------------------------------
	    수정일     		수정자        	수정내용
	   --------    --------    ----------------
	   2019. 2. 25.  남동희		최초 생성     
	 * @param : CharSequence input - input String <br>
	 * 			int min - minimum length of interval <br>
	 * 			int max - maximum length of interval
	 * @return : boolean
	 * @throws : throws ArithmeticException if min, max < 0 or min > max
	 <pre>
	 * {@code : 
	 * validation.isLength("1234", 1, 3) returns true
	 * Especially validation.isLength('1234', 0, 2) = validation('1234', 2, false)
	 * } 
	 </pre>
	 */
	public boolean isLength(CharSequence input, int min, int max) {
		if (min < 0 || max < 0)
			throw new ArithmeticException("Must be greater or equal than zero. min : " + min + ", max : " + max);
		else if (max < min)
			throw new ArithmeticException("Max must be greater or equal than min. min : " + min + ", max : " + max);
		return input.length() >= min && input.length() <= max;
	}

	/**
	 * 
	 * @method name : matches
	 * @author : (정) 남동희
	             (부)
	 * @since  : 2019. 2. 25.
	 * @version : v1.1
	 * @see : java.util.regex.Pattern.matches()
	 * @description : Returns true if String matches with Regular expression
	 * @history :
	   ----------------------------------------
	   * Modification Information(개정이력)
	   ----------------------------------------
	     수정일     		수정자        	수정내용
	   --------    --------    ----------------
	   2019. 2. 25.  남동희		최초 생성     
	 * @param : CharSequence input - input String <br>
	 * 			String regex - Regular expression
	 * @return : boolean
	 * @throws : 
	 <pre>
	 * {@code 
	 * validation.matches("1234", "\\d*") returns true
	 * } 
	 </pre>
	 */
	public boolean matches(CharSequence input, String regex) {
		return Pattern.matches(regex, input);
	}

	/**
	 * 
	 * @method name : contains
	 * @author : (정) 남동희
	             (부)
	 * @since  : 2019. 2. 25.
	 * @version : v1.1
	 * @see : java.util.regex.Pattern.compile()
	 * 		  java.util.regex.Matcher.find()
	 * @description : Returns true if String contains Pattern of Regular expression.
	 * @history :
	   ----------------------------------------
	   * Modification Information(개정이력)
	   ----------------------------------------
	   수정일     수정자        수정내용
	   --------    --------    ----------------
	   2019. 4. 20.     78371     
	 * @param : CharSequence input - input String <br>
	 * 			String regex - Regular expression
	 * @return : boolean
	 * @throws : 
	 <pre>
	 * {@code : 
	 * validationLib.contains("1234", "\\d") returns true
	 * } 
	 </pre>
	 */
	public boolean contains(CharSequence input, CharSequence regex) {
		return Pattern.compile(regex.toString()).matcher(input).find();
	}

	/**
	 * 
	 * @method name : hasAlpha
	 * @author : (정) 남동희
	             (부)
	 * @since  : 2019. 2. 25.
	 * @version : v1.1
	 * @see : ValidationLib.contains(string, regexp)
	 * @description : Returns true if String contains Alphabet.
	 * @history :
	   ----------------------------------------
	   * Modification Information(개정이력)
	   ----------------------------------------
	     수정일    		 수정자       	 수정내용
	   --------    --------    ----------------
	   2019. 2. 25.  남동희		최초 생성     
	 * @param : CharSequence input - input String
	 * @return : boolean
	 * @throws : 
	 <pre>
	 * {@code :
	 *  ValidationLib.hasAlpha("a1234") returns true
	 * } 
	 </pre>
	 */
	public boolean hasAlpha(CharSequence input) {
		return contains(input, "[a-zA-Z]");
	}

	/**
	 * 
	 * @method name : hasNumber
	 * @author : (정) 남동희
	             (부)
	 * @since  : 2019. 2. 25.
	 * @version : v1.1
	 * @see : ValidationLib.contains(string, regexp)
	 * @description : Returns true if String contatins number.
	 * @history :
	   ----------------------------------------
	   * Modification Information(개정이력)
	   ----------------------------------------
	   	수정일     		수정자        	수정내용
	   --------    --------    ----------------
	   2019. 2. 25.  남동희		최초 생성     
	 * @param : CharSequence input - input String
	 * @return : boolean
	 * @throws : 
	 <pre>
	 * {@code : 예제 코드 작성
	 * ValidationLib.hasNumber("a!12") returns true
	 * } 
	 </pre>
	 */
	public boolean hasNumber(CharSequence input) {
		return contains(input, "[0-9]");
	}

	/**
	 * 
	 * @method name : hasSymbols
	 * @author : (정) 남동희
	             (부)
	 * @since  : 2019. 2. 25.
	 * @version : v1.1
	 * @see : ValidationLib.contains(string, regexp)
	 * @description : Returns true if String contains special character.
	 * @history :
	   ----------------------------------------
	   * Modification Information(개정이력)
	   ----------------------------------------
	   	수정일     		수정자        	수정내용
	   --------    --------    ----------------
	   2019. 2. 25.  남동희		최초 생성     
	 * @param : CharSequence input - input String
	 * @return : boolean
	 * @throws : 
	 <pre>
	 * {@code : 예제 코드 작성
	 * ValidationLib.hasSymbols("!12a") returns true
	 * } 
	 </pre>
	 */
	public boolean hasSymbols(CharSequence input) {
		return contains(input, "[\\{\\}\\[\\]\\/?.,;:|\\)*~`!^\\-_+<>@\\#$%&\\\\\\=\\(\\'\\\"]");
	}

	/**
	@method name : hasBlank @author : 남동희
	@since : 2019. 3. 4. @version : v1.0
	@Description : 문자열이 공백을 포함하는지 검사
	@history :
	
	DATE AUTHOR DESCRIPTION
	2019. 3. 4. 남동희 최초 작성
	@param : CharSequence input - 검사 대상 문자열
	@return : 문자열이 공백을 포함하는지 여부
	*/
	/**
	 * 
	 * @method name : hasBlank
	 * @author : (정) 남동희
	             (부)
	 * @since  : 2019. 2. 25.
	 * @version : v1.1
	 * @see : ValidationLib.contains(String, regexp)
	 * @description : Returns true if String contains all kinds of blank(e.g Enter, tab, space)
	 * @history :
	   ----------------------------------------
	   * Modification Information(개정이력)
	   ----------------------------------------
	   	수정일     		수정자        	수정내용
	   --------    --------    ----------------
	   2019. 2. 25. 남동희		최초 생성     
	 * @param : CharSequence input - input String
	 * @return : boolean
	 * @throws : 
	 <pre>
	 * {@code : 
	 * ValidationLib.hasBlank("1 2") returns true
	 * } 
	 </pre>
	 */
	public boolean hasBlank(CharSequence input) {
		return contains(input, "\\s");
	}

	/**
	@method name : isKor @author : 남동희
	@since : 2019. 3. 4. @version : v1.0
	@Description : 문자열이 한글인지 검사
	@history :
	
	DATE AUTHOR DESCRIPTION
	2019. 3. 4. 남동희 최초 작성
	@param : CharSequence input - 검사 대상 문자열
	@return : 문자열이 한글인지 여부
	*/
	/**
	 * 
	 * @method name : isKor
	 * @author : (정) 남동희
	             (부)
	 * @since  : 2019. 2. 25.
	 * @version : v1.1
	 * @see : ValidationLib.matches(String, regexp)
	 * @description : Returns true if String matches with Korean.
	 * 				  Retruns FALSE if String contains SINGLE Korean Character(e.g ㄱ,ㄷ).
	 * @history :
	   ----------------------------------------
	   * Modification Information(개정이력)
	   ----------------------------------------
	   	수정일     		수정자        	수정내용
	   --------    --------    ----------------
	   2019. 2. 25.  남동희		최초 생성     
	 * @param : CharSequence input - input String
	 * @return : boolean
	 * @throws : 
	 <pre>
	 * {@code :
	 * ValidationLib.isKor("가나다") returns true
	 * ValidationLib.isKor("ㄱㄴㄷ") returns FALSE
	 * } 
	 </pre>
	 */
	public boolean isKor(CharSequence input) {
		return matches(input, "[가-힣]*");
	}
	
	/**
	 * 
	 * @method name : isKorName
	 * @author : (정) 남동희
	             (부)
	 * @since  : 2019. 4. 20.
	 * @version : v1.1
	 * @see : ValidationLib.isKor(String)
	 * @description : Equals to isKor() method.
	 * @history :
	   ----------------------------------------
	   * Modification Information(개정이력)
	   ----------------------------------------
	   	수정일     		수정자       	수정내용
	   --------    --------    ----------------
	   2019. 4. 20.  남동희		최초 생성     
	 * @param : CharSequence input - input String
	 * @return : boolean
	 * @throws : 
	 <pre>
	 * {@code :
	 * 
	 * } 
	 </pre>
	 */
	public boolean isKorName(CharSequence input) {
		return isKor(input);
	}
	
	/**
	 * 
	 * @method name : isKorName
	 * @author : (정) 남동희
	             (부)
	 * @since  : 2019. 4. 20.
	 * @version : v1.0
	 * @see : ValidationLib.isKorName(String)
	 * @description : Returns true if String firstName and lastName are Korean.
	 * 				  If one of name String is empty, returns false.
	 * @history :
	   ----------------------------------------
	   * Modification Information(개정이력)
	   ----------------------------------------
	   	수정일     		수정자        	수정내용
	   --------    --------    ----------------
	   2019. 4. 20.  남동희		최초 생성     
	 * @param : CharSequence firstName - firstName String
	 * 			CharSequence lastName - lastName String
	 * @return : boolean
	 * @throws : 
	 <pre>
	 * {@code : 
	 * ValidationLib.isKorName("남", "동희") returns true
	 * } 
	 </pre>
	 */
	public boolean isKorName(CharSequence firstName, CharSequence lastName) {
		return (firstName.toString().isEmpty() || lastName.toString().isEmpty()) ? false : isKorName(firstName.toString() + lastName.toString());
	}
	
	/**
	 * 
	 * @method name : isEmail
	 * @author : (정) 남동희
	             (부)
	 * @since  : 2019. 4. 20.
	 * @version : v1.1
	 * @see : ValidationLib.matches(String, regexp)
	 * @description : Returns true if String matches with email format described below.
	 * 				  ================================================================
	 * 				  Most of email address format is "id@domain.com"
	 * 				  e.g)
	 * 				  ab_.-@domain.com
	 * 				  -a1_-@domain.kr
	 * @history :
	   ----------------------------------------
	   * Modification Information(개정이력)
	   ----------------------------------------
	   수정일     수정자        수정내용
	   --------    --------    ----------------
	   2019. 4. 20.     78371     
	 * @param : Charsequence input - input String
	 * @return : boolean
	 * @throws : 
	 <pre>
	 * {@code : 
	 * ValidationLib.isEmail("id@domain.com") returns true
	 * } 
	 </pre>
	 */
	public boolean isEmail(CharSequence input) {
		return matches(input, "^\\w[\\w_\\.\\-]+@[\\w\\-]+\\.[A-Za-z]{2,3}");
	}
	
	/**
	 * 
	 * @method name : isKorTelephone
	 * @author : (정) 남동희
	             (부)
	 * @since  : 2019. 4. 20.
	 * @version : v1.1
	 * @see : ValidationLib.matches()
	 * @description : Returns true if String matches with Telephone number format of Korea.
	 * 				  =====================================================================
	 * 				  02		+  3~4 numbers + 4 numbers
	 * 				  070
	 * 				  080
	 * 				  0505						
	 * 				  031-033
	 * 				  041-043 
	 * 				  061-063
	 * 				  051-055
	 * 				  
	 * @history :
	   ----------------------------------------
	   * Modification Information(개정이력)
	   ----------------------------------------
	     수정일     		수정자        	수정내용
	   --------    --------    ----------------
	   2019. 4. 20.   남동희		최초 생성    
	 * @param : CharSequence input - input String
	 * @return : boolean
	 * @throws : 
	 <pre>
	 * {@code : 
	 * ValidationLib.isKorTelephone("0531234567") returns true
	 * ValidationLib.isKorTelephone("053-123-4567") also returns true
	 * ValidationLib.isKorTelephone("053-1234567") returns false
	 * } 
	 </pre>
	 */
	public boolean isKorTelephone(CharSequence input) {
		if (input.toString().contains("-"))
			return matches(input, "^((02)|(070)|(080)|(0505)|((03)|(04)|(06))[1-3]|(05)[1-5])-[\\d]{3,4}-[\\d]{4}");
		else
			return matches(input, "^((02)|(070)|(080)|(0505)|((03)|(04)|(06))[1-3]|(05)[1-5])[\\d]{7,8}");
	}
	
	/**
	 * 
	 * @method name : iskorCellurar
	 * @author : (정) 남동희
	             (부)
	 * @since  : 2019. 4. 20.
	 * @version : v1.1
	 * @see : ValidationLib.matches(input, regexp)
	 * @description : Returns true if String matches with CellPhone number format of Korea.
	 * @history :
	   ----------------------------------------
	   * Modification Information(개정이력)
	   ----------------------------------------
	   	수정일     		수정자        	수정내용
	   --------    --------    ----------------
	   2019. 4. 20.   남동희		최초 생성     
	 * @param : CharSequence input
	 * @return : boolean
	 * @throws : 
	 <pre>
	 * {@code : 
	 * ValidationLib.isKorCellurar("01012345678") returns true
	 * ValidationLib.isKorCellurar("010-1234-5678") returns true
	 * } 
	 </pre>
	 */
	public boolean iskorCellurar(CharSequence input) {
		if (input.toString().contains("-"))
			return matches(input, "^((010)|(011)|(016)|(017)|(018)|(019))-[\\d]{3,4}-[\\d]{4}");
		else
			return matches(input, "^((010)|(011)|(016)|(017)|(018)|(019))[\\d]{7,8}");
	}
}
