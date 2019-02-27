package net.mwav.common.module;

import java.util.regex.Pattern;

/**
 * 
 * 포맷 및 유효성체크 에 대한 Util 클래스 
 * @author Mwav 김주성
 * @since 2017.08.24
 * @version 1.0
 * @see
 *
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2017.08.24  김주성          최초 생성
 *   2019.02.25	  남동희	   유효성 검증에 필요한 기본 메서드 추가
 *
 * </pre>
 */

public class ValidationLib {
	private enum status {
		INVALID_LENGTH, INVALID_INPUT, INVALID_FORMAT, ERROR, VALID
	}

	/**
	@method name : isLength @author : 남동희
	@since : 2019. 2. 25. @version : v1.0
	@Description : 문자열의 길이가 최소값 이상인지 검사
	@history :
	
	DATE AUTHOR DESCRIPTION
	2019. 2. 25. 남동희 최초 작성
	@param : input - 길이 검사 대상 문자열 <br>
			 min - 길이 최소값
	@return : true - 대상 문자열의 길이가 최소값 이상인 경우
	*/
	public boolean isLength(CharSequence input, int min) {
		if (min < 0)
			throw new ArithmeticException("Must be greater than or equal to zero. min : " + min);
		if (input.length() >= min)
			return true;
		return false;
	}

	/** 
	@method name : isLength @author : 남동희
	@since : 2019. 2. 25. @version : v1.0
	@Description : 문자열의 길이가 기준값 이상(이하)인지 검사
	@history :
	
	DATE AUTHOR DESCRIPTION
	2019. 2. 25. 남동희 최초 작성
	@param : input - 길이 검사 대상 문자열 <br>
			 boundary - 길이 기준값 <br>
			 flag - true : 기준값 이상인지 검사/ false : 기준값 이하인지 검사
	@return : true - 대상 문자열의 길이가 기준값 이상(이하)인 경우 
	*/
	public boolean isLength(CharSequence input, int boundary, boolean flag) {
		if (boundary < 0)
			throw new ArithmeticException("Must be greater than or equal to zero. boundary : " + boundary);
		if (flag)
			return isLength(input, boundary);
		else
			return isLength(input, 0, boundary);
	}

	/** 
	@method name : isLength @author : 남동희
	@since : 2019. 2. 25. @version : v1.0
	@Description : 문자열의 길이가 최소값과 최대값 사이에 있는지 검사
	@history :
	
	DATE AUTHOR DESCRIPTION
	2019. 2. 25. 남동희 최초 작성
	@param : input - 길이 검사 대상 문자열 <br>
			 min - 길이 최소값<br>
			 max - 길이 최대값
	@return : true - 대상 문자열의 길이가 최소값과 최대값 영역에 포함되는 경우
	*/
	public boolean isLength(CharSequence input, int min, int max) {
		if (min < 0 || max < 0 || max < min)
			throw new ArithmeticException("Must be greater than or equal to zero. min : " + min + ", max : " + max);
		if (input.length() >= min && input.length() <= max)
			return true;
		return false;
	}

	/** 
	@method name : isOnly @author : 남동희
	@since : 2019. 2. 26. @version : v1.0
	@Description : 문자열이 정규식 패턴과 일치하는지 검사
	@history :
	
	DATE AUTHOR DESCRIPTION
	2019. 2. 26. 남동희 최초 작성
	@param : input - 대상 문자열 <br>
			 regex - 정규식
	@return : true - 문자열이 정규식 패턴과 일치하는 경우
	*/
	public boolean matches(CharSequence input, String regex) {
		return Pattern.matches(regex, input);
	}

	/** 
	@method name : contains @author : 남동희
	@since : 2019. 2. 25. @version : v1.0
	@Description : 문자열이 정규식 패턴을 포함하는지 검사
	@history :
	
	DATE AUTHOR DESCRIPTION
	2019. 2. 25. 남동희 최초 작성
	@param : input - 대상 문자열 <br>
			 regex - 정규식
	@return : true - 문자열이 정규식 패턴을 포함하는 경우
	*/
	public boolean contains(CharSequence input, CharSequence regex) {
		return Pattern.compile(regex.toString()).matcher(input).find();
	}

	/** 
	@method name : hasAlpha @author : 남동희
	@since : 2019. 2. 26. @version : v1.0
	@Description : 문자열이 알파벳(대소문자)을 포함하는지 검사
	@history :
	
	DATE AUTHOR DESCRIPTION
	2019. 2. 26. 남동희 최초 작성
	@param : input - 대상 문자열
	@return : true - 문자열이 알파벳을 포함하는 경우
	*/
	public boolean hasAlpha(CharSequence input) {
		if (contains(input, "[a-zA-Z]"))
			return true;
		return false;
	}

	/** 
	@method name : hasNumber @author : 남동희
	@since : 2019. 2. 26. @version : v1.0
	@Description : 문자열이 숫자를 포함하는지 검사
	@history :
	
	DATE AUTHOR DESCRIPTION
	2019. 2. 26. 남동희 최초 작성
	@param : input - 대상 문자열
	@return : true - 문자열이 숫자를 포함하는 경우
	*/
	public boolean hasNumber(CharSequence input) {
		if (contains(input, "[0-9]"))
			return true;
		return false;
	}

	/** 
	@method name : hasSymbols @author : 남동희
	@since : 2019. 2. 26. @version : v1.0
	@Description : 문자열이 특수문자를 포함하는지 검사
	@history :
	
	DATE AUTHOR DESCRIPTION
	2019. 2. 26. 남동희 최초 작성
	@param : input - 대상 문자열
	@return : true - 문자열이 특수문자를 포함하는 경우
	*/
	public boolean hasSymbols(CharSequence input) {
		if (contains(input, "[\\{\\}\\[\\]\\/?.,;:|\\)*~`!^\\-_+<>@\\#$%&\\\\\\=\\(\\'\\\"]"))
			return true;
		return false;
	}

	/** 
	@method name : isEmail @author : 남동희
	@since : 2019. 2. 26. @version : v1.0
	@Description : 문자열이 이메일 형식과 일치하는지 검사
	@history :
	
	DATE AUTHOR DESCRIPTION
	2019. 2. 26. 남동희 최초 작성
	@param : input - 대상 문자열
	@return : Enum status <br>
			  INVALID_INPUT - id 영억에 숫자,알파벳,(.),(_),(-)을 제외한 문자가 포함된 경우 <br>
			  				- domain 영역에 숫자,알파벳,(.),(-)을 제외한 문자가 포함된 경우 <br>
			  INVALID_FORMAT - 이메일 형식이 아닌 경우 <br>
			  VALID - 유효한 이메일인 경우
	*/
	public Enum<status> isEmail(CharSequence input) {
		String[] email = input.toString().split("@");

		if (email.length != 2)
			return status.INVALID_FORMAT;

		if (!matches(email[0], "[\\w_\\.\\-]*") || !matches(email[1], "[\\w\\-\\.]*"))
			return status.INVALID_INPUT;

		if (!matches(input, "^\\w[\\w_\\.\\-]+@[\\w\\-]+\\.[A-Za-z]{2,3}")) 
			return status.INVALID_FORMAT;

		return status.VALID;
	}

	/**
	@method name : isTelephone @author : 남동희
	@since : 2019. 2. 26. @version : v1.0
	@Description : 문자열이 국내 전화번호(유선) 형식과 일치하는지 검사
	@history :
	
	DATE AUTHOR DESCRIPTION
	2019. 2. 26. 남동희 최초 작성
	@param : input - 대상 문자열
	@return : Enum status <br>
			  INVALID_INPUT - 문자열에 숫자,(-)를 제외한 문자가 포함된 경우 <br>
			  INVALID_LENGTH - 문자열의 길이가 9~11자 사이가 아닌 경우 <br>
			  INVALID_FORMAT - 휴대전화 번호 형식이 아닌 경우 <br>
			  VALID - 유효한 휴대전화 번호인 경우
	*/
	public Enum<status> isTelephone(CharSequence input) {
		// 1. 숫자와 - 만 포함하는지 검사
		if (!matches(input, "[\\d-]*"))
			return status.INVALID_INPUT;
		// 2. 길이 검사
		else if (!isLength(input.toString().replaceAll("-", ""), 9, 11))
			return status.INVALID_LENGTH;

		// 3. 형식 검사
		// -이 있을 때 형식 검사 및 국번 검사
		if (contains(input, "-")) {
			// 형식 검사
			if (!matches(input, "[\\d]{2,4}-[\\d]{3,4}-[\\d]{4}"))
				return status.INVALID_FORMAT;

			// 국번 검사
			String inputCode = input.toString().substring(0, input.toString().indexOf("-"));
			String code = "(02)|(070)|(080)|(0505)|((03)|(04)|(06))[1-3]|(05)[1-5]";

			if (!matches(inputCode, code))
				return status.INVALID_FORMAT;
		} else {
			// -이 없을 때 형식 검사 및 국번 검사
			String code = "^((02)|(070)|(080)|(0505)|((03)|(04)|(06))[1-3]|(05)[1-5])\\d*";
			if (!matches(input, code))
				return status.INVALID_FORMAT;
		}
		return status.VALID;
	}

	/**
	@method name : isCellurar @author : 남동희
	@since : 2019. 2. 26. @version : v1.0
	@Description : 문자열이 국내 휴대전화번호 형식과 일치하는지 검사 
	@history :
	
	DATE AUTHOR DESCRIPTION
	2019. 2. 26. 남동희 최초 작성
	@param : input - 대상 문자열
	@return : Enum status <br>
			  INVALID_INPUT - 문자열에 숫자,(-)를 제외한 문자가 포함된 경우 <br>
			  INVALID_LENGTH - 문자열의 길이가 10~11자 사이가 아닌 경우 <br>
			  INVALID_FORMAT - 휴대전화 번호 형식이 아닌 경우 <br>
			  VALID - 유효한 휴대전화 번호인 경우
	*/
	public Enum<status> isCellurar(CharSequence input) {
		// 1. 숫자와 - 만 포함하는지 검사
		if (!matches(input, "[\\d-]*"))
			return status.INVALID_INPUT;
		// 2. 길이 검사
		else if (!isLength(input.toString().replaceAll("-", ""), 10, 11))
			return status.INVALID_LENGTH;

		// 3. 형식 검사
		// -이 있을 때 형식 검사 및 국번 검사
		if (contains(input, "-")) {
			// 형식 검사
			if (!matches(input, "[\\d]{3}-[\\d]{3,4}-[\\d]{4}"))
				return status.INVALID_FORMAT;

			// 국번 검사
			String inputCode = input.toString().substring(0, input.toString().indexOf("-"));
			String code = "(010)|(011)|(016)|(017)|(018)|(019)";
			if (!matches(inputCode, code))
				return status.INVALID_FORMAT;
		} else {
			// -이 없을 때 형식 검사 및 국번 검사
			String code = "^((010)|(011)|(016)|(017)|(018)|(019))\\d*";
			if (!matches(input, code))
				return status.INVALID_FORMAT;
		}
		return status.VALID;
	}
}
