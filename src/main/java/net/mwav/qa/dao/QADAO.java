package net.mwav.qa.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.common.dao.AbstractDAO;

import org.springframework.stereotype.Repository;

@Repository("qaDAO")
public class QADAO extends AbstractDAO {

	
	// Abstrat로 변경

	/*
	 * ========================================등록================================
	 * ========
	 */

	public boolean insertQAForm(Map<String, Object> map, HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		boolean flag = true; 
		
		String check =String.valueOf(insert("qa.insertQAForm", map));
		
		System.out.println("check"+check);
		if(check.equals("1")){
			flag = true;
		}
		else{
			flag = false;
		}
		return flag;
	}

	
	/*
	 * ========================================보기================================
	 * ========
	 */

	/*
	 * ========================================수정================================
	 * ========
	 */

	/*
	 * ========================================리스트(SelectOne, SelectList
	 * 순)========================================
	 */

	/*
	 * ========================================삭제================================
	 * ========
	 */

	// ///////////////////////////////////BoardNotices/////////////////////////////////////

	/*
	 * ========================================등록================================
	 * ========
	 */

	/*
	 * ========================================보기================================
	 * ========
	 */


	/*
	 * ========================================수정================================
	 * ========
	 */

	/*
	 * ========================================리스트(SelectOne, SelectList
	 * 순)========================================
	 */


	/*
	 * ========================================삭제================================
	 * ========
	 */

}
