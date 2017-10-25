package net.mwav.common.module;

public class ControlLib {
	/**
	 *
	 * Date 에 대한 Util 클래스
	 * @author Mwav 김주성 작성.
	 * @since 2017.08.19
	 * @version 1.0
	 * @see
	 *
	 * <pre>
	 * << 개정이력(Modification Information) >>
	 *
	 *   수정일      수정자           수정내용
	 *  -------    --------    ---------------------------
	 *   2017.08.19  김주성          최초 생성
	 *
	 * </pre>
	 */
	/**
	 * <p>yyyyMMdd 혹은 yyyy-MM-dd 형식의 날짜 문자열을 입력 받아 년, 월, 일을
	 * 증감한다. 년, 월, 일은 가감할 수를 의미하며, 음수를 입력할 경우 감한다.</p>
	 *
	 * <pre>
	 * DateUtil.addYearMonthDay("19810828", 0, 0, 19)  = "19810916"
	 * DateUtil.addYearMonthDay("20060228", 0, 0, -10) = "20060218"
	 * DateUtil.addYearMonthDay("20060228", 0, 0, 10)  = "20060310"
	 * DateUtil.addYearMonthDay("20060228", 0, 0, 32)  = "20060401"
	 * DateUtil.addYearMonthDay("20050331", 0, -1, 0)  = "20050228"
	 * DateUtil.addYearMonthDay("20050301", 0, 2, 30)  = "20050531"
	 * DateUtil.addYearMonthDay("20050301", 1, 2, 30)  = "20060531"
	 * DateUtil.addYearMonthDay("20040301", 2, 0, 0)   = "20060301"
	 * DateUtil.addYearMonthDay("20040229", 2, 0, 0)   = "20060228"
	 * DateUtil.addYearMonthDay("20040229", 2, 0, 1)   = "20060301"
	 * </pre>
	 *
	 * @param  dateStr 날짜 문자열(yyyyMMdd, yyyy-MM-dd의 형식)
	 * @param  year 가감할 년. 0이 입력될 경우 가감이 없다
	 * @param  month 가감할 월. 0이 입력될 경우 가감이 없다
	 * @param  day 가감할 일. 0이 입력될 경우 가감이 없다
	 * @return  yyyyMMdd 형식의 날짜 문자열
	 * @throws IllegalArgumentException 날짜 포맷이 정해진 바와 다를 경우.
	 *         입력 값이 <code>null</code>인 경우.
	 */
}
