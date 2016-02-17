<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <link href="/HomePage/App_Themes/Objects.css" rel="stylesheet" type="text/css"/>
    <link href="/HomePage/App_Themes/OverallPage.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="/HomePage/CommonLibrary/ckeditor/ckeditor.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>The Notice Management</title>
<script type="text/javascript">
function writeSave(){
	if(document.NtmForm.staff_id.value==""){
		alert("이름을 입력하십시오.");
		document.NtmForm.staff_id.focus();
		return false;
	}
	if(document.NtmForm.buGroup.value==""){
		alert("분류를 선택하세요.");
		NtmForm.buGroup.focus();
		return false;
	}
	if(document.NtmForm.buTitle.value==""){
		alert("제목을 입력하십시요.");
		document.NtmForm.buTitle.focus();
		return false;
	}
	if(document.NtmForm.buContent.value==""){
		alert("내용을 입력 하십시요.");
		document.NtmForm.buContent.focus();
		return false;
	}
}
</script>
</head>

<body>
    <form method="post" name="NtmForm" action="/HomePage/U_WritePro.do">
  <input type="hidden" name="bUser_id" value="${bUser_id}">
  <table cellspacing="0" cellpadding="0" width="600" border="0">
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="26"><img src="/HomePage/Admins/zImages/admin_top009.gif" width="26" height="27" /></td>
            <td bgcolor="#f4f4f4">현재위치 : </td>
            <td width="10"><img src="/HomePage/Admins/zImages/admin_top010.gif" width="10" height="27" /></td>
          </tr>
        </table></td>
    </tr>
        <tr>
      <td height="20" bgcolor="#ffffff">&nbsp;</td>
    </tr>
       <tr>
      <td bgcolor="#ffffff"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
            <td width="160"><img src="/HomePage/Admins/SiteMgr/zImages/admin_notice_004.gif" height="53" /></td>
            <td background="/HomePage/Admins/SiteMgr/zImages/admin_notice_005.gif">&nbsp;</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td bgcolor="#ffffff">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#ffffff">
        <table cellspacing="2" cellpadding="1" width="98%" border="0">
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td><select name="buStatus">
				<option value="0">임시저장상태</option>
				<option value="1">현재공지상태</option>
				</select>
			</td>
          </tr>
          <tr align="center" bgcolor="#3a8bb1">
            <td width="11%" height="30">공지번호</td>
            <td width="20%">분류</td>
            <td width="13%">조회수</td>
            <td width="19%">작성일</td>
            <td width="17%">작성자</td>
            <td width="20%">정렬순서</td>
          </tr>
            <tr align="center">
            <td><input type="hidden" name="bUser_id" width="40px"/></td>
            <td><select name="buGroup">
				<option value="전체">전체</option>
				<option value="휴대폰">휴대폰</option>
				<option value="인터넷">인터넷</option>
                <option value="영어">영어</option>
                <option value="유통">유통</option>
                <option value="SI개발">SI개발</option>
				</select>
				</td>
            <td><input type="hidden" name="buViewCount" MaxLength="10" Width="70px"> 
            </td>
            <td><input name="writeDT" Width="70px"></td>
            <td><input name="sLoginID" Width="70px"></td>
            <td><input type="text" name="buOrder" MaxLength="3" Width="30px"></td>
          </tr>
          </table></td>
          </tr>
          <tr>
      <td bgcolor="#ffffff">&nbsp;&nbsp;</td>
    </tr>
      <tr>
      <td align="center" bgcolor="#ffffff"><table width="98%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td align="left">
              <table cellspacing="1" cellpadding="3" width="600" border="0">
                <tr bgcolor="#ffffff">
                  <td width="101" align="center" bgcolor="#3a8bb1">제 목</td>
                  <td width="484"><input type="text" Width="450px" MaxLength="200" name="buTitle"></td>
                </tr>
                <tr bgcolor="#ffffff">
                  <td align="center" bgcolor="#3a8bb1">부제목</td>
                  <td><input type="text" name="buSubTitle" Width="450px" rows="2"  maxlength="500"></td>
                </tr>
            </table></td>
          </tr>   
          <tr>
          	<td align="left">
            <table cellspacing="1" cellpadding="3" width="800" border="0">
                <tr>
                  <td width="101" align="center" bgcolor="#3a8bb1">내 용</td>
                  <td>
                  <textarea  name="buContent" cols="150" rows="80"></textarea>
					<script type="text/javascript">
						//<![CDATA[
						CKEDITOR.replace('buContent');
						//]]
					</script>
				  </td>
                  </tr>
    		</table>
            </td>
            </tr>
        <tr>
      <td bgcolor="#ffffff">&nbsp;&nbsp;</td>
    </tr>
     <tr>
    <td align="center" bgcolor="#ffffff" height="31">
            <button type="button" name="hiList" style="border:solid 0px #FFFFFF;"  onclick="javascript:window.location.href='/HomePage/U_List.do'" >
 <img src="/HomePage/Admins/zImages/btn_view_list.gif"  border="0"> 
</button>
            <button type="button" name="hiBack" style="border:solid 0px #FFFFFF;" onclick="javascript:window.location.href='/HomePage/U_List.do'" >
 <img src="/HomePage/Admins/zImages/btn_admin_back.gif"  border="0"> 
</button>
            <button type="submit" name="iblInsert" style="border:solid 0px #FFFFFF;" >
 <img src="/HomePage/Admins/zImages/admin_btn_enter.gif"  border="0"> 
</button> 
            </td>
        </tr>
    </table>
    </td>
    </tr>
    </table>
    </form>
</body>
</html>