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
				String[] strurl = { "/HomePage/mbrList.mwav?mm=mbrs",
						"/HomePage/mbrOptList.mwav?mm=mbrs",
						"/HomePage/mbrValList.mwav?mm=mbrs",
						"/HomePage/MbrForm.mwav?mm=mbrs" };
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
				String[] strhEName = { "공지관리", "뉴스관리", "Q&A관리", "폴관리", "회원메일발송" };
				String[] strurl = { "/admin/boardNotice/ntmList.mwav",
						"/admin/boardNews/nsmList.mwav",
						"/admin/boardQnA/qnaList.mwav", "#", "#" };
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
				String[] strurl = { "#", "/admins/staff/stfList.mwav", "#",
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

				// .jsp는 컨트롤러를 부르지 않기 때문에, 직접 파라미터 뒤에 mm 설정해줘야 한다. !!
				String[] streName = { "gcl", "gci" };
				String[] strhKName = { "상품리스트", "상품등록" };
				String[] strhEName = { "상품리스트", "상품등록" };
				String[] strurl = { "/admins/goods/gdsList.mwav",
						"/Admins/Goods/GdsCellForm.jsp?mm=cGds", };
				String[] strmAuthority = { "1", "1" };
				String[] strdAuthority = { "*", "*" };

				for (int i = 0; i < 2; i++) {
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
			} else if (mm.equals("rel")) { // 카테고리 추가 부분!!!!!!!!!!!

				String[] streName = { "caset", "gci" };
				String[] strhName = { "카테고리등록", "릴레이션등록" };
				String[] strhEName = { "카테고리등록", "릴레이션등록" };
				String[] strurl = {
						"/Admins/Goods/GdsCaInsert.jsp?mm=category",
						"/admins/goods/categoryList.mwav",

				};
				String[] strmAuthority = { "1", "1" };
				String[] strdAuthority = { "*", "*" };

				for (int i = 0; i < 2; i++) {
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
			} else if (mm.equals("crm")) { // 카테고리 추가 부분!!!!!!!!!!!

				String[] streName = { "stati", "gci" };
				String[] strhName = { "StatisticsMgr", "릴레이션등록" };
				String[] strhEName = { "통계관리", "릴레이션등록" };
				String[] strurl = {
						"/admins/marketing/statistics/statsList.mwav",
						"/admins/goods/categoryList.mwav",

				};
				String[] strmAuthority = { "1", "1" };
				String[] strdAuthority = { "*", "*" };

				for (int i = 0; i < 2; i++) {
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
			}

			else {

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return menuList;
	}
}
