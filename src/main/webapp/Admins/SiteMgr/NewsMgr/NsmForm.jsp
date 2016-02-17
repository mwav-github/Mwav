<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 
 <link href="/HomePage/App_Themes/Objects.css" rel="stylesheet" type="text/css"/>
    <link href="/HomePage/App_Themes/OverallPage.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="HomePage/ckeditor/ckeditor.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>The News Management</title>
<script type="text/javascript">
function writeSave(){
	if(document.NsmForm.staff_id.value==""){
		alert("이름을 입력하십시오.");
		document.NsmForm.staff_id.focus();
		return false;
	}
	if(document.NsmForm.bnGroup.value==""){
		alert("분류를 선택하세요.");
		document.NsmForm.bnGroup.focus();
		return false;
	}
	if(document.NsmForm.bnTitle.value==""){
		alert("제목을 입력하십시요.");
		document.NsmForm.bnTitle.focus();
		return false;
	}
	if(document.NsmForm.bnContent.value==""){
		alert("내용을 입력 하십시요.");
		document.NsmForm.bnContent.focus();
		return false;
	}
}
</script>
</head>

<body>
    <form method="post" name="NsmForm" action="/HomePage/N_WritePro.do">
  <input type="hidden" name="news_id" value="${news_id}">
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
      <td bgcolor="#ffffff">&nbsp;</td>
    </tr>
       <tr>
      <td bgcolor="#ffffff">&nbsp;</td>
    </tr>
 <tr>
      <td bgcolor="#ffffff"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="160"><img src="/HomePage/Admins/SiteMgr/zImages/admin_news_002.gif" width="176" height="53" /></td>
            <td background="/HomePage/Admins/SiteMgr/zImages/admin_notice_005.gif">&nbsp;</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td bgcolor="#ffffff">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#ffffff"><table cellspacing="2" cellpadding="1" width="98%" border="0">
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td><select name="bnStatus">
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
            <td><input type="hidden" name="news_id" width="40px"/></td>
            <td><select name="bnGroup">
				<option value="전체">전체</option>
				<option value="휴대폰">휴대폰</option>
				<option value="인터넷">인터넷</option>
                <option value="영어">영어</option>
                <option value="유통">유통</option>
                <option value="SI개발">SI개발</option>
				</select>
				</td>
            <td><input type="hidden" name="bnViewCount" MaxLength="10" Width="70px"> 
            </td>
            <td><input name="bnwriteDT" Width="70px"></td>
            <td><input name="sLoginID" Width="70px"></td>
            <td><input type="text" name="bnOrder" MaxLength="3" Width="30px"></td>
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
                  <td width="484"><input type="text" Width="450px" MaxLength="200" name="bnTitle"></td>
                </tr>
                <tr bgcolor="#ffffff">
                  <td align="center" bgcolor="#3a8bb1">부제목</td>
                  <td><input type="text" name="bnSubTitle" Width="450px" rows="2"  maxlength="500"></td>
                </tr>
            </table></td>
          </tr>   
          <tr>
          	<td align="left">
            <table cellspacing="1" cellpadding="3" width="600" border="0">
                <tr>
                  <td width="101" align="center" bgcolor="#3a8bb1">내 용</td>
                  <td>
                  <textarea  name="bnContent" cols="150" rows="80"></textarea>
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
	    <td colspan="2" align="center">
		            <button type="button" name="hiList" style="border:solid 0px #FFFFFF;"  onclick="javascript:window.location.href='/HomePage/N_List.do'" >
 <img src="/HomePage/Admins/zImages/btn_view_list.gif"  border="0"> 
</button>
            <button type="button" name="hiBack" style="border:solid 0px #FFFFFF;" onclick="javascript:window.location.href='/HomePage/N_List.do'" >
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