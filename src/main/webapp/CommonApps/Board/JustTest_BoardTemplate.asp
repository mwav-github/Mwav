<%@LANGUAGE="JAVASCRIPT" CODEPAGE="949"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
</head>

<body>
<% Server.Execute(""bExecuteURL.asp") %>
bTopFilePath
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="700" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
      <tr align="left">
        <td colspan="3"><% Server.Execute(Application("SiteRoot") & bLeftFilePath) %>
      bTop1FilePath</td>
      </tr>
      <tr>
        <td align="left" valign="top"><% Server.Execute(Application("SiteRoot") & bLeftFilePath) %>
      bLeftFilePath</td>
        <td><table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="left"><!-- #include File="IncTemplates/bExecuteTemplate.asp" --></td>
            </tr>
            <tr>
              <td> 
                <!-- 게시판 시작 -->
					게시판이 들어간다
                <!-- 게시판 끝 -->
              </td>
            </tr>
            <tr>
              <td align="left"><!-- #include File="IncTemplates/bExecuteTemplate.asp" --></td>
            </tr>
        </table></td>
        <td align="left" valign="top"><% Server.Execute(Application("SiteRoot") & bLeftFilePath) %>
      bRightFilePath</td>
      </tr>
    </table></td>
  </tr>
</table>
<% Server.Execute(Application("SiteRoot") & bLeftFilePath) %>
bBottomFilePath
</body>
</html>
