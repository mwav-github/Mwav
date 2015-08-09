<%@ Page language="c#" Codebehind="Movies.aspx.cs" AutoEventWireup="false" Inherits="KistelSite.CommonApps.Movies.Movies" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
  <HEAD>
    <title>Movies</title>
    <meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" Content="C#">
    <meta name=vs_defaultClientScript content="JavaScript">
    <meta name=vs_targetSchema content="http://schemas.microsoft.com/intellisense/ie5">
  </HEAD>
  <body MS_POSITIONING="FlowLayout" onLoad='window_onload2();return false' oncontextmenu="return false">
	
    <form id="Form1" method="post" runat="server"><FONT face="굴림">
<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="565" border="0">
  <TR>
    <TD><IMG height="50" src="Images/top.gif" width="565"></TD></TR>
  <TR>
    <TD style="PADDING-BOTTOM: 20px; PADDING-TOP: 20px" vAlign="top" 
    background="Images/pop_bg.gif" height="379">
      <TABLE id="Table2" cellSpacing="0" cellPadding="0" width="525" align=center 
      border=0>
        <TR class="body18">
          <TD colSpan="2" height="25">tit : 동영상보기입니다</TD></TR>
        <TR class="body18">
          <TD style="PADDING-BOTTOM: 15px; PADDING-TOP: 15px" align=center 
          width=20>&nbsp;</TD>
          <TD 
          style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 15px; PADDING-TOP: 15px" 
          width="505">
            <TABLE id="Table3" cellSpacing="0" cellPadding="0" width="456" border="0">
              <TR>
                <TD><IMG height="21" src="Images/skin_01.gif" width="11"></TD>
                <TD width="434" background="Images/skin_bg01.gif">&nbsp;</TD>
                <TD><IMG height="21" src="Images/skin_02.gif" width="11"></TD></TR>
              <TR>
                <TD background="Images/skin_bg02.gif">&nbsp;</TD>
                <TD align=center background=Images/skin_bg05.gif height=240>
                    <!-- 동영상 플레이 Start -->
					<!--IMG start="fileopen" loop="3" dynsrc="mmst://NJCHO/ScreenCapture.wmv" border="0" loopdelay="2"-->
                  <OBJECT id=MediaPlayer1 
                  codeBase="http://activex.microsoft.com/activex/controls/mplayer/en/ &#13;&#10;nsmp2inf.cab#Version=5,1,52,701" 
                  type=application/x-oleobject height=280 
                  standby="Loading Microsoft Windows Media Player components..." 
                  width=500 classid=CLSID:22D6f312-B0F6-11D0-94AB-0080C74C7E95 
                  VIEWASTEXT loop="10">
                  <Param Name="FileName" Value='<asp:Literal id="litPlayList" runat="server">mms://211.238.38.238/ScreenCapture.wmv</asp:Literal>' /> 
	</OBJECT>

					<!-- 동영상 플레이 End --></TD>
                <TD background="Images/skin_bg03.gif">&nbsp;</TD></TR>
              <TR>
                <TD><IMG height="31" src="Images/skin_03.gif" width="11"></TD>
                <TD background="Images/skin_bg04.gif">&nbsp;</TD>
                <TD><IMG height="31" src="Images/skin_04.gif" 
              width="11"></TD></TR></TABLE></TD></TR>
        <TR class="body18">
          <TD style="PADDING-BOTTOM: 15px; PADDING-TOP: 15px" align=center>&nbsp;</TD>
          <TD 
          style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 15px; PADDING-TOP: 15px">&nbsp;<asp:LinkButton id="lbTermi" runat="server">터미네이터</asp:LinkButton></TD>
        </TR>
      </TABLE></TD></TR></TABLE>
<TABLE id="Table4" cellSpacing="0" cellPadding="0" width="565" border="0">
  <TR>
    <TD width="167" height="96"><IMG src="Images/pop_2.gif"></TD>
    <TD 
background="Images/pop_bg2.gif">&nbsp;</TD></TR></TABLE><BR></FONT>

     </form>



<!-- meta http-equiv='refresh' content='60;URL=CCTV.jsp?flag=1&ip=211.252.223.175&ch=14&sub=-&mode=2&loc=영동대교 남단&dir1=김포방향&dir2=미사리방향&cctvid=CCL1000220'-->
<base href='http://www.smartway.seoul.kr/roadInfor/' target=_self>
<TABLE WIDTH=370 BORDER=0 align="center" CELLPADDING=0 CELLSPACING=0>
  <TR>
    <TD colspan="3"><TABLE WIDTH="100%" BORDER=0 CELLPADDING=0 CELLSPACING=0>
        <TR>
          <TD width="327"> <IMG SRC="images/cctv_05_1.gif" WIDTH=327 HEIGHT=67></TD>
          <TD background="images/cctv_05_2.gif">&nbsp; </TD>
          <TD width="46"> <img src="images/cctv_05_4.gif" width=46 height=67 USEMAP='' border="0"></TD>
        </TR>
      </TABLE></TD>
  </TR>
  <TR>
    <TD width="9" height="5" background="images/cctvskin-04_01.gif"></TD>
    <TD width="880" height="5" background="images/cctvskin-04_02.gif"><img src="images/sp.gif" width="1" height="5"></TD>
    <TD width="11" height="5" background="images/cctvskin-04_03.gif"></TD>
  </TR>
  <TR>
    <TD background="images/cctvskin-04_01.gif"> <IMG SRC="images/cctvskin-04_01.gif" WIDTH=9 HEIGHT=100 ALT=""></TD>
    <TD background="images/cctvskin-04_02.gif"><TABLE WIDTH=330 BORDER=0 align="center" CELLPADDING=0 CELLSPACING=0>
        <TR>
          <TD width="5"> <IMG SRC="images/cctv_01_01.gif" WIDTH=5 HEIGHT=5 ALT=""></TD>
          <TD background="images/cctv_01_02.gif"> <IMG SRC="images/cctv_01_02.gif" WIDTH=5 HEIGHT=5 ALT=""></TD>
          <TD width="5"> <IMG SRC="images/cctv_01_03.gif" WIDTH=5 HEIGHT=5 ALT=""></TD>
        </TR>
        <TR>
          <TD width="5" background="images/cctv_01_04.gif"> <IMG SRC="images/cctv_01_04.gif" WIDTH=5 HEIGHT=240 ALT=""></TD>
<!-- 여기부터 동영상 들어갈 곳 -->

          <TD WIDTH="320" HEIGHT="240" ALIGN="center" VALIGN="middle">
            <OBJECT id=DVRView 
            codeBase=http://smartway.seoul.go.kr/roadInfor/WebDVR.cab#version=5,0,5,2 
            height=240 width=320 
            classid=clsid:C575F980-64EA-4D0A-8D2B-2BB611E4602B>
	<PARAM NAME="_cx" VALUE="8467">
	<PARAM NAME="_cy" VALUE="6350">
	</OBJECT>
          </TD>

<!-- 동영상 들어가는 곳 끝 -->
          <TD width="5" background="images/cctv_01_06.gif"> <IMG SRC="images/cctv_01_06.gif" WIDTH=5 HEIGHT=240 ALT=""></TD>
        </TR>
        <TR>
          <TD width="5"> <IMG SRC="images/cctv_01_07.gif" WIDTH=5 HEIGHT=25 ALT=""></TD>
          <TD><TABLE WIDTH="100%" height="25" BORDER=0 CELLPADDING=0 CELLSPACING=0>
              <TR>
                <TD width="60"> <IMG SRC="images/cctv_06_1.gif" WIDTH=60 HEIGHT=25 ALT=""></TD>
                <TD background="images/cctv_06_2.gif"><font color="#ffffff" size="2" face="돋움"><strong>영동대교 남단</strong></font> </TD>
                <TD width="30"> <IMG SRC="images/cctv_06_3.gif" WIDTH=30 HEIGHT=25 ALT=""></TD>
              </TR>
            </TABLE></TD>
          <TD width="5"> <IMG SRC="images/cctv_01_09.gif" WIDTH=5 HEIGHT=25 ALT=""></TD>
        </TR>
      </TABLE>

<TABLE WIDTH=330 BORDER=0 align="center" CELLPADDING=0 CELLSPACING=0>
  <tr>
    <TD>&nbsp;</TD>
  </tr>
</TABLE>
    </TD>
    <TD background="images/cctvskin-04_03.gif"> <IMG SRC="images/cctvskin-04_03.gif" WIDTH=11 HEIGHT=100 ALT=""></TD>
  </TR>
  <TR>
    <TD> <IMG SRC="images/cctvskin-04_04.gif" WIDTH=9 HEIGHT=23 ALT=""></TD>
    <TD background="images/cctvskin-04_05.gif"> <div align="right"><IMG SRC="images/cctvskin-04_05.gif" WIDTH=5 HEIGHT=23 ALT=""></div></TD>
    <TD> <IMG SRC="images/cctvskin-04_06.gif" WIDTH=11 HEIGHT=23 ALT=""></TD>
  </TR>
</TABLE>
<script language="JavaScript">
function window_onload2() {

  DVRView.ShowStatus(1,1,0,0);

  DVRView.ChangeCamera(13);
  DVRView.SetViewStyle(0);
  DVRView.Connect("211.252.223.175",7942,"guest","guest");
}
</script>

<map name='__Map'>
  <AREA SHAPE="RECT" COORDS="5,12,42,30" HREF="/roadInfor/CCTV_pass_200.jsp?cctvid=CCL1000220&amp;selectcode=2" target='cctvHidden'>
</map>
	
  </body>
</HTML>
