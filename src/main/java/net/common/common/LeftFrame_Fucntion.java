package net.common.common;

import java.util.*;

public class LeftFrame_Fucntion {

	public List<LeftFrame_VO> getMbrList(String mm) {
		List<LeftFrame_VO> menuList = null;

		try {
			menuList = new ArrayList<LeftFrame_VO>();

			if (mm.equals("mbrs")) {

				String[] streName = { "mbb", "mbo", "mbv", "mbj" };
				String[] strhName = { "회원리스트", "회원부가정보", "회원평가치", "회원가입" };
				String[] strurl = { "/HomePage/mbrList.do?mm=mbrs",
						"/HomePage/mbrOptList.do?mm=mbrs",
						"/HomePage/mbrValList.do?mm=mbrs",
						"/HomePage/MbrForm.do?mm=mbrs" };
				String[] strmAuthority = { "1", "1", "1", "1" };
				String[] strdAuthority = { "*", "*", "*", "*" };

				for (int i = 0; i < 4; i++) {
					LeftFrame_VO vo = new LeftFrame_VO();
					// 안에다가 생성할 경우 vo 라는 인스턴스 하나에 참조값 네개 가 생성된다.

					vo.seteName(streName[i]);
					vo.sethKName(strhName[i]);
					vo.seturl(strurl[i]);
					vo.setmAuthority(strmAuthority[i]); // 선택 가능 권한 (레벨)
					vo.setdAuthority(strdAuthority[i]); // 선택 가능 부서

					menuList.add(vo);
				}

				/*
				 * System.out.println(); Iterator<LeftFrame_VO> it =
				 * menuList.iterator(); while(it.hasNext()){
				 * System.out.println(it.next()); }
				 */
			} else if (mm.equals("site")) {

				String[] streName = { "ntl", "nsl", "qal", "pl", "mmail" };
				String[] strhName = { "공지관리", "뉴스관리", "Q&A관리", "폴관리", "회원메일발송" };
				String[] strhEName = { "공지관리", "뉴스관리", "Q&A관리", "폴관리", "회원메일발송"  };
				String[] strurl = { "/admin/boardNews/nsmList.do",
						"/admin/boardNotice/ntmList.do", "#", "#", "#" };
				String[] strmAuthority = { "1", "1", "1", "1", "1" };
				String[] strdAuthority = { "*", "*", "*", "*", "*" };

				for (int i = 0; i < 5; i++) {
					LeftFrame_VO vo = new LeftFrame_VO();
					// 안에다가 생성할 경우 vo 라는 인스턴스 하나에 참조값 네개 가 생성된다.

					vo.seteName(streName[i]);
					vo.sethKName(strhName[i]);
					vo.sethEName(strhEName[i]);
					vo.seturl(strurl[i]);
					vo.setmAuthority(strmAuthority[i]); // 선택 가능 권한 (레벨)
					vo.setdAuthority(strdAuthority[i]); // 선택 가능 부서

					menuList.add(vo);
				}
			} else if (mm.equals("firms")) {

				String[] streName = { "docs", "staff", "asset", "pds", "mmail",
						"accut" };
				String[] strhKName = { "문서자료", "직원리스트", "자산리스트", "FTP자료실",
						"계좌관리" };
				String[] strhEName = { "문서자료", "StaffList", "자산리스트", "FTP자료실",
				"계좌관리" };
				String[] strurl = { "#", "/admins/staff/stfList.do", "#",
						"#", "#" };
				String[] strmAuthority = { "1", "1", "1", "1", "1" };
				String[] strdAuthority = { "*", "*", "*", "*", "*" };

				for (int i = 0; i < 5; i++) {
					LeftFrame_VO vo = new LeftFrame_VO();
					// 안에다가 생성할 경우 vo 라는 인스턴스 하나에 참조값 네개 가 생성된다.

					vo.seteName(streName[i]);
					vo.sethKName(strhKName[i]);
					vo.sethEName(strhEName[i]);
					vo.seturl(strurl[i]);
					vo.setmAuthority(strmAuthority[i]); // 선택 가능 권한 (레벨)
					vo.setdAuthority(strdAuthority[i]); // 선택 가능 부서

					menuList.add(vo);
				}
			}

			else if (mm.equals("cGds")) {

				String[] streName = { "gcl", "gci" };
				String[] strhName = { "상품리스트", "상품등록" };
				String[] strurl = { "/HomePage/GdsCellList.do?mm=cGds",
						"/HomePage/GdsCellForm.do?mm=cGds", };
				String[] strmAuthority = { "1", "1" };
				String[] strdAuthority = { "*", "*" };

				for (int i = 0; i < 2; i++) {
					LeftFrame_VO vo = new LeftFrame_VO();
					// 안에다가 생성할 경우 vo 라는 인스턴스 하나에 참조값 네개 가 생성된다.

					vo.seteName(streName[i]);
					vo.sethKName(strhName[i]);
					vo.seturl(strurl[i]);
					vo.setmAuthority(strmAuthority[i]); // 선택 가능 권한 (레벨)
					vo.setdAuthority(strdAuthority[i]); // 선택 가능 부서

					menuList.add(vo);
				}
			} else if (mm.equals("category")) { // 카테고리 추가 부분!!!!!!!!!!!

				String[] streName = { "gcl", "gci" };
				String[] strhName = { "카테고리등록", "릴레이션등록" };
				String[] strurl = { "/HomePage/GdsCaInsert.do?mm=category",
						"/HomePage/GdsCaRelation.do?mm=category",

				};
				String[] strmAuthority = { "1", "1" };
				String[] strdAuthority = { "*", "*" };

				for (int i = 0; i < 2; i++) {
					LeftFrame_VO vo = new LeftFrame_VO();
					// 안에다가 생성할 경우 vo 라는 인스턴스 하나에 참조값 네개 가 생성된다.

					vo.seteName(streName[i]);
					vo.sethKName(strhName[i]);
					vo.seturl(strurl[i]);
					vo.setmAuthority(strmAuthority[i]); // 선택 가능 권한 (레벨)
					vo.setdAuthority(strdAuthority[i]); // 선택 가능 부서

					menuList.add(vo);
				}
			}
			else{
			
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return menuList;
	}
}
