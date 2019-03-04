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
	@method name : isOnly @author : 남동희
	@since : 2019. 2. 26. @version : v1.0
	@Description : 
	@history :
	
	DATE AUTHOR DESCRIPTION
	2019. 2. 26. 남동희 최초 작성
	@param :
	@return :
	*/
	public boolean matches(CharSequence input, String regex) {
		return Pattern.matches(regex, input);
	}

	/** 
	@method name : contains @author : 남동희
	@since : 2019. 2. 25. @version : v1.0
	@Description : 
	@history :
	
	DATE AUTHOR DESCRIPTION
	2019. 2. 25. 남동희 최초 작성
	@param :
	@return :
	*/
	public boolean contains(CharSequence input, CharSequence regex) {
		return Pattern.compile(regex.toString()).matcher(input).find();
	}

	/** 
	@method name : hasAlpha @author : 남동희
	@since : 2019. 2. 26. @version : v1.0
	@Description : 
	@history :
	
	DATE AUTHOR DESCRIPTION
	2019. 2. 26. 남동희 최초 작성
	@param :
	@return :
	*/
	public boolean hasAlpha(CharSequence input) {
		if (contains(input, "[a-zA-Z]"))
			return true;
		return false;
	}

	/** 
	@method name : hasNumber @author : 남동희
	@since : 2019. 2. 26. @version : v1.0
	@Description : 
	@history :
	
	DATE AUTHOR DESCRIPTION
	2019. 2. 26. 남동희 최초 작성
	@param :
	@return :
	*/
	public boolean hasNumber(CharSequence input) {
		if (contains(input, "[0-9]"))
			return true;
		return false;
	}

	/** 
	@method name : hasSymbols @author : 남동희
	@since : 2019. 2. 26. @version : v1.0
	@Description : 
	@history :
	
	DATE AUTHOR DESCRIPTION
	2019. 2. 26. 남동희 최초 작성
	@param :
	@return :
	*/
	public boolean hasSymbols(CharSequence input) {
		if (contains(input, "[\\{\\}\\[\\]\\/?.,;:|\\)*~`!^\\-_+<>@\\#$%&\\\\\\=\\(\\'\\\"]"))
			return true;
		return false;
	}

	/**
	@method name : hasBlank @author : 남동희
	@since : 2019. 3. 4. @version : v1.0
	@Description : 
	@history :
	
	DATE AUTHOR DESCRIPTION
	2019. 3. 4. 남동희 최초 작성
	@param :
	@return :
	*/
	public boolean hasBlank(CharSequence input) {
		if (contains(input, "\\s"))
			return true;
		return false;
	}
	
	/**
	@method name : isKor @author : 남동희
	@since : 2019. 3. 4. @version : v1.0
	@Description : 
	@history :
	
	DATE AUTHOR DESCRIPTION
	2019. 3. 4. 남동희 최초 작성
	@param :
	@return :
	*/
	public boolean isKor(CharSequence input) {
		if(matches(input, "[가-힣]*"))
			return true;
		return false;
	}

	/**
	@method name : isId @author : 남동희
	@since : 2019. 3. 4. @version : v1.0
	@Description : 
	@history :
	
	DATE AUTHOR DESCRIPTION
	2019. 3. 4. 남동희 최초 작성
	@param :
	@return :
	*/
	public Enum<VALID_STATUS> isId(CharSequence input, int min, int max) {

		/*ID 생성정책
		4 ~ 20 자 사이의 문자길이 첫 문자는 영어로 시작
		특수문자 사용금지 (제외문자: . _ -) 공백문자 사용금지
		* 대소문자는 식별이 가능하나 구분 및 구별을 하지 않음*/
		if (min < 0 || max < 0)
			throw new ArithmeticException("Must be greater or equal than zero. min : " + min + ", max : " + max);
		else if (max < min)
			throw new ArithmeticException("Max must be greater or equal than min. min : " + min + ", max : " + max);

		if (!isLength(input, min, max))
			return VALID_STATUS.INVALID_LENGTH;
		else if(!matches(input, "[\\w_\\.\\-]*"))
			return VALID_STATUS.INVALID_INPUT;
		else if(!matches(input, "^[a-zA-Z][\\w_\\.\\-]*"))
			return VALID_STATUS.INVALID_FORMAT;
		
		return VALID_STATUS.VALID;
	}

	/**
	@method name : isPassword @author : 남동희
	@since : 2019. 3. 4. @version : v1.0
	@Description : 
	@history :
	
	DATE AUTHOR DESCRIPTION
	2019. 3. 4. 남동희 최초 작성
	@param :
	@return :
	*/
	public Enum<VALID_STATUS> isPassword(CharSequence input, int min, int max) {
		if (min < 0 || max < 0)
			throw new ArithmeticException("Must be greater or equal than zero. min : " + min + ", max : " + max);
		else if (max < min)
			throw new ArithmeticException("Max must be greater or equal than min. min : " + min + ", max : " + max);
		/*PW 생성정책
		8~255자 사이의 문자길이 (8자의 경우 문자, 숫자, 기호로 구성 ; 12자의 경우 문자, 숫자로 구성) 영문, 숫자, 특수문자 중 2가지 이상으로 구현 (문자길이확인)
		특수문자 한 개 이상 꼭 포함 공백문자 사용금지
		영문 대문자와 소문자의 구분 (즉 Boy와 boy는 다른 암호) 암호 변경시 바로 이전 암호 사용 금지*/

		if (!isLength(input, min, max))
			return VALID_STATUS.INVALID_LENGTH;
		else if (!hasAlpha(input) || !hasNumber(input) || !hasSymbols(input))
			return VALID_STATUS.INVALID_INPUT;
		else if(!matches(input, "[\\{\\}\\[\\]\\/?.,;:|\\)*~`!^\\-_+<>@\\#$%&\\\\\\=\\(\\'\\\"0-9a-zA-Z]*"))
			return VALID_STATUS.INVALID_FORMAT;
		
		return VALID_STATUS.VALID;
	}
	
	/** 
	@method name : isEmail @author : 남동희
	@since : 2019. 2. 26. @version : v1.0
	@Description : 
	@history :
	
	DATE AUTHOR DESCRIPTION
	2019. 2. 26. 남동희 최초 작성
	@param :
	@return :
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
	@Description : 
	@history :
	
	DATE AUTHOR DESCRIPTION
	2019. 2. 26. 남동희 최초 작성
	@param :
	@return : Enum VALID_STATUS <br>
			  INVALID_INPUT - 문자열에 숫자, - 를 제외한 문자가 포함된 경우 <br>
			  INVALID_LENGTH - 문자열의 길이가 9~11자 사이가 아닌 경우 <br>
			  INVALID_FORMAT - 전화번호 형식이 아닌 경우 <br>
			  VALID - 유효한 휴대전화 번호인 경우
	*/
	public Enum<?> isTelephone(CharSequence input) {
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
	@Description : 
	@history :
	
	DATE AUTHOR DESCRIPTION
	2019. 2. 26. 남동희 최초 작성
	@param :
	@return : Enum VALID_STATUS <br>
			  INVALID_INPUT - 문자열에 숫자, - 를 제외한 문자가 포함된 경우 <br>
			  INVALID_LENGTH - 문자열의 길이가 10~11자 사이가 아닌 경우 <br>
			  INVALID_FORMAT - 휴대전화 번호 형식이 아닌 경우 <br>
			  VALID - 유효한 휴대전화 번호인 경우
	*/
	public Enum<?> isCellurar(CharSequence input) {
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
