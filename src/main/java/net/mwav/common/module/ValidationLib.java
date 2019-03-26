package net.mwav.common.module;

import java.util.regex.Pattern;

import org.springframework.stereotype.Component;

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
@Component
public class ValidationLib {
	public enum VALID_STATUS {
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
	@return : 대상 문자열의 길이가 최소값 이상인지 여부
	*/
	public boolean isLength(CharSequence input, int min) {
		if (min < 0)
			throw new ArithmeticException("Must be greater or equal than zero. min : " + min);
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
	@return : 대상 문자열의 길이가 기준값 이상(이하)인지 여부
	*/
	public boolean isLength(CharSequence input, int boundary, boolean flag) {
		if (boundary < 0)
			throw new ArithmeticException("Must be greater or equal than zero. boundary : " + boundary);
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
	@return : 대상 문자열의 길이가 최소값과 최대값 영역에 포함되는지 여부
	*/
	public boolean isLength(CharSequence input, int min, int max) {
		if (min < 0 || max < 0)
			throw new ArithmeticException("Must be greater or equal than zero. min : " + min + ", max : " + max);
		else if (max < min)
			throw new ArithmeticException("Max must be greater or equal than min. min : " + min + ", max : " + max);
		if (input.length() >= min && input.length() <= max)
			return true;
		return false;
	}

	/** 
	@method name : matches @author : 남동희
	@since : 2019. 2. 26. @version : v1.0
	@Description : 문자열이 대상과 일치하는지 검사
	@history :
	
	DATE AUTHOR DESCRIPTION
	2019. 2. 26. 남동희 최초 작성
	@param : CharSequence input - 검사할 문자열 <br>
			 CharSequence regex - 대상 정규표현식 문자열
	@return : 문자열이 대상과 일치하는지 여부
	*/
	public boolean matches(CharSequence input, String regex) {
		return Pattern.matches(regex, input);
	}

	/** 
	@method name : contains @author : 남동희
	@since : 2019. 2. 25. @version : v1.0
	@Description : 문자열이 대상을 포함하는지 검사
	@history : 
	
	DATE AUTHOR DESCRIPTION
	2019. 2. 25. 남동희 최초 작성
	@param : CharSequence input - 검사할 문자열 <br>
			 CharSequence regex - 대상 정규표현식 문자열
	@return : 문자열이 대상을 포함하는지 여부
	*/
	public boolean contains(CharSequence input, CharSequence regex) {
		return Pattern.compile(regex.toString()).matcher(input).find();
	}

	/** 
	@method name : hasAlpha @author : 남동희
	@since : 2019. 2. 26. @version : v1.0
	@Description : 문자열이 영어를 포함하는지 검사
	@history :
	
	DATE AUTHOR DESCRIPTION
	2019. 2. 26. 남동희 최초 작성
	@param : CharSequence input - 검사 대상 문자열
	@return : 문자열이 영어를 포함하는지 여부
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
	@param : CharSequence input - 검사 대상 문자열
	@return : 문자열이 숫자를 포함하는지 여부
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
	@param : CharSequence input - 검사 대상 문자열
	@return : 문자열이 특수문자를 포함하는지 여부
	*/
	public boolean hasSymbols(CharSequence input) {
		if (contains(input, "[\\{\\}\\[\\]\\/?.,;:|\\)*~`!^\\-_+<>@\\#$%&\\\\\\=\\(\\'\\\"]"))
			return true;
		return false;
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
	public boolean hasBlank(CharSequence input) {
		if (contains(input, "\\s"))
			return true;
		return false;
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
	public boolean isKor(CharSequence input) {
		if (matches(input, "[가-힣]*"))
			return true;
		return false;
	}

	/**
	@method name : isId @author : 남동희
	@since : 2019. 3. 4. @version : v1.0
	@Description : 문자열이 유효한 아이디 형식인지 mwav의 아이디 정책에 의거하여 검사
	@history :
	
	DATE AUTHOR DESCRIPTION
	2019. 3. 4. 남동희 최초 작성
	@param : CharSequence input - 아이디 문자열 <br>
		     int min - 아이디 최소 길이 <br>
		     int max - 아이디 최대 길이 <br>
	@return : Enum VALID_STATUS <br>
			  INVALID_LENGTH - 아이디 길이가 최소값과 최대값 영역에 포함되지 않는 경우 <br>
			  INVALID_INPUT - 아이디에  숫자, 영어, -, ., - 의외에 문자가 포함된 경우 <br>
			  INVALID_FORMAT - 아이디의 첫 글자가 영어가 아닌 경우<br>
			  VALID_INPUT - 유효한 아이디인 경우
	*/
	public Enum<VALID_STATUS> isId(CharSequence input, int min, int max) {
		if (min < 0 || max < 0)
			throw new ArithmeticException("Must be greater or equal than zero. min : " + min + ", max : " + max);
		else if (max < min)
			throw new ArithmeticException("Max must be greater or equal than min. min : " + min + ", max : " + max);

		if (!isLength(input, min, max))
			return VALID_STATUS.INVALID_LENGTH;
		else if (!matches(input, "[\\w_\\.\\-]*"))
			return VALID_STATUS.INVALID_INPUT;
		else if (!matches(input, "^[a-zA-Z][\\w_\\.\\-]*"))
			return VALID_STATUS.INVALID_FORMAT;

		return VALID_STATUS.VALID;
	}

	/**
	@method name : isPassword @author : 남동희
	@since : 2019. 3. 4. @version : v1.0
	@Description : 문자열이 유효한 비밀번호 형식인지 mwav의 비밀번호 정책에 의거하여 검사 
	@history :
	
	DATE AUTHOR DESCRIPTION
	2019. 3. 4. 남동희 최초 작성
	@param : CharSequence input - 비밀번호 문자열 <br>
			 int min - 비밀번호 최소 길이 <br>
			 int max - 비밀번호 최대 길이
	@return : Enum VALID_STATUS <br>
			  INVALID_LENGTH - 비밀번호 길이가 최소값과 최대값 영역에 포함되지 않는 경우 <br>
			  INVALID_FORMAT - 비밀번호가 숫자, 영어, 특수문자로 구성되어있지 않는 경우 <br>
			  INVALID_INPUT - 숫자,영어,특수문자 외  문자가 포함된 경우<br>
			  VALID_INPUT - 유효한 비밀번호인 경우
	*/
	public Enum<VALID_STATUS> isPassword(CharSequence input, int min, int max) {
		if (min < 0 || max < 0)
			throw new ArithmeticException("Must be greater or equal than zero. min : " + min + ", max : " + max);
		else if (max < min)
			throw new ArithmeticException("Max must be greater or equal than min. min : " + min + ", max : " + max);

		if (!isLength(input, min, max))
			return VALID_STATUS.INVALID_LENGTH;
		else if (!hasAlpha(input) || !hasNumber(input) || !hasSymbols(input))
			return VALID_STATUS.INVALID_FORMAT;
		else if (!matches(input, "[\\{\\}\\[\\]\\/?.,;:|\\)*~`!^\\-_+<>@\\#$%&\\\\\\=\\(\\'\\\"0-9a-zA-Z]*"))
			return VALID_STATUS.INVALID_INPUT;
		return VALID_STATUS.VALID;
	}

	/**
	@method name : isKorName @author : 남동희
	@since : 2019. 3. 14. @version : v1.0
	@Description : 문자열이 내국인 이름 형식과 일치하는지 검사
	@history :
	
	DATE AUTHOR DESCRIPTION
	2019. 3. 14. 남동희 최초 작성
	@param : CharSequence input - 한글 이름 문자열
	@return : Enum VALID_STATUS <br>
			  INVALID_INPUT - 한글이 아닌 경우
			  VALID_INPUT - 유효한 한글 이름인 경우
	*/
	public Enum<VALID_STATUS> isKorName(CharSequence input) {
		if (!isKor(input))
			return VALID_STATUS.INVALID_INPUT;
		return VALID_STATUS.VALID;
	}

	/**
	@method name : isKorName @author : 남동희
	@since : 2019. 3. 5. @version : v1.0
	@Description : 문자열이 한글 이름 형식과 일치하는지 검사
	@history : 
	
	DATE AUTHOR DESCRIPTION
	2019. 3. 5. 남동희 최초 작성
	@param : CharSequence firstName - 한글 이름 문자열<br> 
			 CharSequence lastName - 한글 성 문자열
	@return : Enum VALID_STATUS <br>
			  INVALID_LENGTH - firstName 혹은 lastName이 null인 경우 <br>
			  INVALID_INPUT - 한글이 아닌 경우
			  VALID_INPUT - 유효한 한글 이름인 경우
	*/
	public Enum<VALID_STATUS> isKorName(CharSequence firstName, CharSequence lastName) {
		if (firstName.toString().isEmpty() || lastName.toString().isEmpty())
			return VALID_STATUS.INVALID_LENGTH;
		return isKorName(firstName.toString() + lastName.toString());
	}

	/**
	@method name : isName @author : 남동희
	@since : 2019. 3. 5. @version : v1.0
	@Description : 문자열이 이름 형식과 일치하는지 검사 <br>
	 			       내국인, 외국인의 이름 형식 및 SNS 가입 시 얻게되는 이름 DATA까지 포괄적으로 검증할 수 있는 메서드(개발 중)<br> 
	@history : 현재는 NULL 체크만 수행
	
	DATE AUTHOR DESCRIPTION
	2019. 3. 5. 남동희 최초 작성
	@param : CharSequence firstName - 이름 문자열 <br> 
			 CharSequence lastName - 성 문자열
	@return : Enum VALID_STATUS <br>
			  INVALID_LENGTH - firstName 혹은 lastName이 null인 경우
			  VALID - firstName과 lastName이 not null인 경우
	*/
	public Enum<VALID_STATUS> isName(CharSequence firstName, CharSequence lastName) {
		if (firstName.toString().isEmpty() || lastName.toString().isEmpty())
			return VALID_STATUS.INVALID_LENGTH;
		return VALID_STATUS.VALID;
	}

	/** 
	@method name : isEmail @author : 남동희
	@since : 2019. 2. 26. @version : v1.0
	@Description : 문자열이 이메일 형식과 일치하는지 검사
	@history :
	
	DATE AUTHOR DESCRIPTION
	2019. 2. 26. 남동희 최초 작성
	@param : CharSequence input - 이메일 문자열
	@return : Enum VALID_STATUS <br>
			  INVALID_INPUT - 문자열에 숫자, -, ., _ 를 제외한 문자가 포함된 경우 <br>
			  INVALID_FORMAT - id@domain 형식과 일치하지 않는 경우 <br>
			  VALID - 유효한 이메일인 경우
	*/
	public Enum<VALID_STATUS> isEmail(CharSequence input) {
		String[] email = input.toString().split("@");

		if (email.length != 2)
			return VALID_STATUS.INVALID_FORMAT;

		if (!matches(email[0], "[\\w_\\.\\-]*") || !matches(email[1], "[\\w\\-\\.]*"))
			return VALID_STATUS.INVALID_INPUT;

		if (!matches(input, "^\\w[\\w_\\.\\-]+@[\\w\\-]+\\.[A-Za-z]{2,3}"))
			return VALID_STATUS.INVALID_FORMAT;

		return VALID_STATUS.VALID;
	}

	/**
	@method name : isTelephone @author : 남동희
	@since : 2019. 2. 26. @version : v1.0
	@Description : 문자열이 국내 전화번호(무선) 형식과 일치하는지 검사
	@history :
	
	DATE AUTHOR DESCRIPTION
	2019. 2. 26. 남동희 최초 작성
	@param : CharSequence input - 전화번호 문자열
	@return : Enum VALID_STATUS <br>
			  INVALID_INPUT - 문자열에 숫자, - 를 제외한 문자가 포함된 경우 <br>
			  INVALID_LENGTH - 문자열의 길이가 9~11자 사이가 아닌 경우 <br>
			  INVALID_FORMAT - 전화번호 형식이 아닌 경우 <br>
			  VALID - 유효한 휴대전화 번호인 경우
	*/
	public Enum<VALID_STATUS> isTelephone(CharSequence input) {
		// 1. 숫자와 - 만 포함하는지 검사
		if (!matches(input, "[\\d-]*"))
			return VALID_STATUS.INVALID_INPUT;
		// 2. 길이 검사
		else if (!isLength(input.toString().replaceAll("-", ""), 9, 11))
			return VALID_STATUS.INVALID_LENGTH;

		// 3. 형식 검사
		// -이 있을 때 형식 검사 및 국번 검사
		if (contains(input, "-")) {
			// 형식 검사
			if (!matches(input, "[\\d]{2,4}-[\\d]{3,4}-[\\d]{4}"))
				return VALID_STATUS.INVALID_FORMAT;

			// 국번 검사
			String inputCode = input.toString().substring(0, input.toString().indexOf("-"));
			String code = "(02)|(070)|(080)|(0505)|((03)|(04)|(06))[1-3]|(05)[1-5]";

			if (!matches(inputCode, code))
				return VALID_STATUS.INVALID_FORMAT;
		} else {
			// -이 없을 때 형식 검사 및 국번 검사
			String code = "^((02)|(070)|(080)|(0505)|((03)|(04)|(06))[1-3]|(05)[1-5])\\d*";
			if (!matches(input, code))
				return VALID_STATUS.INVALID_FORMAT;
		}
		return VALID_STATUS.VALID;
	}

	/**
	@method name : isCellurar @author : 남동희
	@since : 2019. 2. 26. @version : v1.0
	@Description : 문자열이 국내 휴대 전화번호 형식과 일치하는지 검사
	@history :
	
	DATE AUTHOR DESCRIPTION
	2019. 2. 26. 남동희 최초 작성
	@param : CharSequence input - 휴대 전화번호 형식의 문자열
	@return : Enum VALID_STATUS <br>
			  INVALID_INPUT - 문자열에 숫자, - 를 제외한 문자가 포함된 경우 <br>
			  INVALID_LENGTH - 문자열의 길이가 10~11자 사이가 아닌 경우 <br>
			  INVALID_FORMAT - 휴대전화 번호 형식이 아닌 경우 <br>
			  VALID - 유효한 휴대전화 번호인 경우
	*/
	public Enum<VALID_STATUS> isCellurar(CharSequence input) {
		// 1. 숫자와 - 만 포함하는지 검사
		if (!matches(input, "[\\d-]*"))
			return VALID_STATUS.INVALID_INPUT;
		// 2. 길이 검사
		else if (!isLength(input.toString().replaceAll("-", ""), 10, 11))
			return VALID_STATUS.INVALID_LENGTH;

		// 3. 형식 검사
		// -이 있을 때 형식 검사 및 국번 검사
		if (contains(input, "-")) {
			// 형식 검사
			if (!matches(input, "[\\d]{3}-[\\d]{3,4}-[\\d]{4}"))
				return VALID_STATUS.INVALID_FORMAT;

			// 국번 검사
			String inputCode = input.toString().substring(0, input.toString().indexOf("-"));
			String code = "(010)|(011)|(016)|(017)|(018)|(019)";
			if (!matches(inputCode, code))
				return VALID_STATUS.INVALID_FORMAT;
		} else {
			// -이 없을 때 형식 검사 및 국번 검사
			String code = "^((010)|(011)|(016)|(017)|(018)|(019))\\d*";
			if (!matches(input, code))
				return VALID_STATUS.INVALID_FORMAT;
		}
		return VALID_STATUS.VALID;
	}
}
