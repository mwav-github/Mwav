<%@ Page language="c#" Codebehind="ForumList.aspx.cs" AutoEventWireup="false" Inherits="KistelSite.CommonApps.Boards.Forum.ForumList" trace="false" %>
<!doctype HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
  <HEAD>
<title>글 목록</title>
<meta content=http://schemas.microsoft.com/intellisense/ie5 name=vs_targetSchema>
<LINK href="/StyleSheets/Objects.css" type=text/css rel=stylesheet >
<LINK href="/StyleSheets/OverallPage.css" type=text/css rel=stylesheet >
<LINK href="board.css" type=text/css rel=stylesheet >
<!--LINK href="/style.css" type="text/css" rel="stylesheet"-->
  </HEAD>
<body>
<form id="frmForum" method=post runat="server">
<base href='<%= Application["BaseHref"] %>CommonApps/Boards/Forum/' target=_self>
<table cellSpacing=0 cellPadding=0 width=600 align=center border=0>
  <tr>
    <td align=right>&nbsp;<IMG height=22 src="Images/tit_03.gif" width=136 ></td></tr>
  <tr>
    <td height=30>&nbsp;</td></tr>
  <tr>
    <td>
      <table cellSpacing=0 cellPadding=0 width="100%" border=0 
      >
        <tr>
          <td>&nbsp; <asp:label id=SearchLabel runat="server" ForeColor="Red"></asp:label></td>
          <td>&nbsp;</td>
          <td align=right>&nbsp; <asp:label id=PageCountLabel runat="server"></asp:label></td></tr></table></td></tr>
  <tr>
    <td><asp:datalist id=BoardList runat="server" DESIGNTIMEDRAGDROP="248" CellSpacing="0" CellPadding="0" enableviewstate="False">
          <headertemplate>
            <table border="0" cellpadding="0" cellspacing="0" class="Board">
              <tr class="Board_ItemLine1">
                <td height="1" colspan="9"></td>
              </tr>
              <tr class="Board_ItemLine2">
                <td height="1" colspan="9"></td>
              </tr>
              <tr class="Board_Header">
                <td class="Board_ItemNum"><img src="Images/item_id.gif"></td>
                <td width="1"><img src="Images/line.gif" width="1" height="34"></td>
                <td class="Board_ItemSubject"><img src="Images/item_subject.gif"></td>
                <td width="1"><img src="Images/line.gif" width="1" height="34"></td>
                <td class="Board_ItemWriter"><img src="Images/item_writer.gif"></td>
                <td width="1"><img src="Images/boards/line.gif" width="1" height="34"></td>
                <td class="Board_ItemRegDate"><img src="Images/item_regdate.gif"></td>
                <td width="1"><img src="Images/line.gif" width="1" height="34"></td>
                <td class="Board_ItemVisited"><img src="Images/item_visit.gif"></td>
              </tr>
              <tr class="Board_ItemLine2">
                <td height="1" colspan="9"></td>
              </tr>
              <tr class="Board_ItemLine1">
                <td height="2" colspan="9"></td>
              </tr>
            </table>
          </headertemplate>
          <itemtemplate>
            <table cellspacing="1" cellpadding="0" border="0" class="Board">
              <tr class="Board_Item">
                <td class="Board_ItemNum"><asp:label id="Label1" runat="server"> <%# ListNum((int)DataBinder.Eval(Container, "DataItem.ListNum")) %> </asp:label>
                </td>
                <td class="Board_ItemSubject"><asp:hyperlink id="HyperLink1" runat="server" NavigateUrl='<%# PageLinkURL((int)DataBinder.Eval(Container, "DataItem.ID"))%>'> <%# ReplyList( Convert.ToInt16(DataBinder.Eval(Container, "DataItem.RELEVEL")) ) %> <%# GetSubject(DataBinder.Eval(Container, "DataItem.SUBJECT").ToString())%> </asp:hyperlink>
                  <font color="#CC6600"> 
                  <%# GetCommentCount((int)DataBinder.Eval(Container, "DataItem.ID")) %> 
                  </font>&nbsp; 
                  <%# GetNewItem(Convert.ToDateTime(DataBinder.Eval(Container, "DataItem.RegDate")))%> 
                  </td>
                <td class="Board_ItemWriter"><asp:hyperlink id="HyperLink2" runat="server"> <%# DataBinder.Eval(Container, "DataItem.WRITER")%> </asp:hyperlink>
                </td>
                <td class="Board_ItemRegDate"><asp:label id="Label2" runat="server"> <%# DataBinder.Eval(Container, "DataItem.REGDATE", "{0:yyyy-MM-dd}")%> </asp:label>
                </td>
                <td class="Board_ItemVisited"><asp:label id="Label3" runat="server"> <%# DataBinder.Eval(Container, "DataItem.VISITED").ToString()%> </asp:label>
                </td>
              </tr>
            </table>
          </itemtemplate>
          <alternatingitemtemplate>
            <table cellspacing="1" cellpadding="0" border="0" class="Board">
              <tr class="Board_AlternatingItem">
                <td class="Board_ItemNum"><asp:label id="Label4" runat="server"> <%# ListNum((int)DataBinder.Eval(Container, "DataItem.LISTNUM")) %> </asp:label>
                </td>
                <td class="Board_ItemSubject"><asp:hyperlink id="HyperLink3" runat="server" NavigateUrl='<%# PageLinkURL((int)DataBinder.Eval(Container, "DataItem.ID"))%>'> <%# ReplyList( Convert.ToInt16(DataBinder.Eval(Container, "DataItem.RELEVEL")) ) %> <%# GetSubject(DataBinder.Eval(Container, "DataItem.SUBJECT").ToString())%> </asp:hyperlink>
                  <font color="#CC6600"> <%# GetCommentCount((int)DataBinder.Eval(Container, "DataItem.ID")) %> </font>&nbsp; <%# GetNewItem(Convert.ToDateTime(DataBinder.Eval(Container, "DataItem.RegDate")))%> </td>
                <td class="Board_ItemWriter"><asp:hyperlink id="HyperLink4" runat="server"> <%# DataBinder.Eval(Container, "DataItem.WRITER")%> </asp:hyperlink>
                </td>
                <td class="Board_ItemRegDate"><asp:label id="Label5" runat="server"> <%# DataBinder.Eval(Container, "DataItem.REGDATE", "{0:yyyy-MM-dd}")%> </asp:label>
                </td>
                <td class="Board_ItemVisited"><asp:label id="Label6" runat="server"> <%# DataBinder.Eval(Container, "DataItem.VISITED").ToString()%> </asp:label>
                </td>
              </tr>
            </table>
          </alternatingitemtemplate>
        </asp:datalist></td></tr>
		<tr>
			<td height="1" background="Images/img/dot1.gif"> </td>
		</tr>		
  <tr>
    <td align=center height=35><asp:label id=PageListLabel runat="server"></asp:label></td></tr>
  <tr class=Board_ItemLine1>
    <td></td></tr>
  <tr class=Board_ItemLine2>
    <td></td></tr>
  <tr>
    <td height=30>&nbsp;&nbsp;&nbsp; <asp:textbox id=KeyWordTextBox runat="server" CssClass="textbox"></asp:textbox><asp:dropdownlist id=KeyFieldList runat="server" CssClass="textbox">
          <asp:listitem Value="subject" Selected="True">제 목</asp:listitem>
          <asp:listitem Value="content">내 용</asp:listitem>
          <asp:listitem Value="writer">작성자</asp:listitem>
        </asp:dropdownlist><asp:imagebutton id=SearchButton runat="server" AlternateText="Search" ToolTip="Search" ImageUrl="Images/img/search.gif" ImageAlign="AbsMiddle"></asp:imagebutton></td></tr>
  <tr class=Board_ItemLine1>
    <td></td></tr>
  <tr class=Board_ItemLine2>
    <td></td></tr>
  <tr>
    <td>&nbsp;</td></tr>
  <tr>
    <td align=center>&nbsp; <asp:hyperlink id=HomeLink runat="server" ImageUrl="Images/img/home1.gif" EnableViewState="False">List</asp:hyperlink><asp:hyperlink id=BackLink runat="server" ImageUrl="Images/img/back1.gif" EnableViewState="False">Back</asp:hyperlink><asp:hyperlink id=NextLink runat="server" ImageUrl="Images/img/next1.gif" EnableViewState="False">Next</asp:hyperlink><A href="ForumWrite.aspx?db=<%=db%>" ><IMG alt=Write src="Images/Img/write1.gif" border=0 ></A></td></tr></table></form>
</body>
</HTML>
