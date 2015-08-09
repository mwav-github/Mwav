<%@ Page language="c#" Codebehind="ForumView.aspx.cs" AutoEventWireup="false" Inherits="KistelSite.CommonApps.Boards.Forum.ForumView" %>
<!--% @ Register TagPrefix="uc1" TagName="BoardsLeftMenu" Src="../../Controls/BoardsLeftMenu.ascx" %-->
<!--% @ Register TagPrefix="uc1" TagName="AspNetLeftMenu" Src="../../Controls/AspNetLeftMenu.ascx" %-->
<!--% @ Register TagPrefix="uc1" TagName="HeaderMenu" Src="../../Controls/HeaderMenu.ascx" %-->
<!--% @ Register TagPrefix="uc1" TagName="Header" Src="../../Controls/Header.ascx" %-->
<!--% @ Register TagPrefix="uc1" TagName="Footer" Src="../../Controls/Footer.ascx" %-->
<!doctype HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
  <HEAD>
		<title>글 보기</title>
		<meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="/StyleSheets/Objects.css" type=text/css rel=stylesheet />
		<LINK href="/StyleSheets/OverallPage.css" type=text/css rel=stylesheet >
		<LINK href="board.css" type="text/css" rel="stylesheet">
  </HEAD>
	<body MS_POSITIONING="FlowLayout">
	<base href='<%= Application["BaseHref"] %>CommonApps/Boards/Forum/' target=_self>
    <form id="frmForum" method="post" runat="server">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
              <tr valign="top">
                <td height="57" align="right" style="PADDING-RIGHT:30px"><img src="Images/tit_03.gif" width="136" height="22"></td>
              </tr>
              <tr>
                <td align="center"><table class="Board" align="center" cellspacing="0" cellpadding="5" border="0">
                    <tr class="Board_ItemLine1">
                    <td colSpan="2" height="1"></td>
                  </tr>
                    <tr class="Board_ItemLine2">
                    <td colSpan="2" height="1"></td>
                  </tr>
                    <tr height="30">
                    <td align="left"><img src="Images/item_id.gif"> :
                        <asp:label id="IDLabel" runat="server"></asp:label>
                        &nbsp; <img src="Images/item_writer.gif"> :
                        <asp:label id="WriterLabel" runat="server"></asp:label>
                        &nbsp; <img src="Images/item_regdate.gif"> :
                        <asp:label id="RegDateLabel" runat="server"></asp:label></td>
                    <td align="right"><img src="Images/item_visit.gif"> :
                        <asp:label id="VisitedLabel" runat="server"></asp:label></td>
                  </tr>
                    <tr class="Board_Footer">
                    <td background="Images/img/dot1.gif" colSpan="2"></td>
                  </tr>
                    <tr height="30">
                    <td class="Board_Header" colspan="2"><asp:label id="SubjectLabel" runat="server"></asp:label></td>
                  </tr>
                    <tr class="Board_ItemLine2">
                    <td colSpan="2" height="1"></td>
                  </tr>
                    <tr class="Board_ItemLine1">
                    <td colSpan="2" height="2"></td>
                  </tr>
                  </table>
                  <table class="Board" align="center" border="0">
                    <tr height="120">
                      <td vAlign="top"><asp:label id="ContentLabel" runat="server"></asp:label></td>
                    </tr>
                    <tr class="Board_ItemLine2">
                      <td height="1"></td>
                    </tr>
                  </table>
                  <br>
                  <table class="Board" align="center" border="0">
                    <tr>
                      <td align="center"><asp:hyperlink id="ListLink" runat="server" imageurl="Images/img/home1.gif"></asp:hyperlink>
                        &nbsp;
                        <asp:hyperlink id="BackLink" runat="server" imageurl="Images/img/back1.gif"></asp:hyperlink>
                        &nbsp;
                        <asp:hyperlink id="NextLink" runat="server" imageurl="Images/img/next1.gif"></asp:hyperlink>
                        <asp:hyperlink id="ReplyLink" runat="server" ImageUrl="Images/img/reply.gif"></asp:hyperlink>
                        &nbsp;
                        <asp:hyperlink id="EditLink" runat="server" imageurl="Images/img/edit.gif"></asp:hyperlink>
                        <asp:imagebutton id="DeleteButton" runat="server" ImageUrl="Images/img/delete.gif"></asp:imagebutton>
                      </td>
                    </tr>
                  </table>
                  <br>
                  <table class="Board" align="center" border="0">
                    <tr>
                      <td><asp:datalist id="CommentList" runat="server" EnableViewState="False">
                          <ItemTemplate>
                          <TABLE class="Board" cellSpacing="1" cellPadding="0" border="0">
                              <TR class="Board_Item">
                              <TD class="Comment_ItemUserName"><asp:label id="Label9" runat="server"> <%# DataBinder.Eval(Container, "DataItem.UserName") %> </asp:label></TD>
                              <TD class="Comment_Item"><asp:label id="Label8" runat="server"> <%# DataBinder.Eval(Container, "DataItem.Comment") %> </asp:label></TD>
                              <TD class="Comment_ItemRegDate"><asp:label id="Label7" runat="server"> <%# DataBinder.Eval(Container, "DataItem.RegDate", "{0:yyyy-MM-dd}")%> </asp:label></TD>
                              <TD class="Comment_ItemAdmin">
                              <%# GetCommentEdit(int.Parse(DataBinder.Eval(Container, "DataItem.CID").ToString()), DataBinder.Eval(Container, "DataItem.UserID").ToString()) %>&nbsp;
                              <%# GetCommentDelete(int.Parse(DataBinder.Eval(Container, "DataItem.CID").ToString()), DataBinder.Eval(Container, "DataItem.UserID").ToString()) %></TD>
                            </TR>
                              <tr class="Board_ItemLine2">
                              <td colspan="4"></td>
                            </tr>
                            </TABLE>
                        </ItemTemplate>
                        </asp:datalist></td>
                    </tr>
                  </table>
                  <table class="Board" cellSpacing="0" cellPadding="0" align="center" border="0">
                    <tr>
                      <td class="Comment_Header">코멘트</td>
                      <td><asp:TextBox id="Comment" runat="server" CssClass="Comment_Content" TextMode="MultiLine"></asp:TextBox>
                      </td>
                      <td><asp:imagebutton id="CommentButton" runat="server" ImageUrl="Images/img/register.gif"></asp:imagebutton>
                      </td>
                    </tr>
                  </table>
                  <br>
                  <table class="Board" align="center" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><asp:datalist id="BoardList" runat="server" visible="False">
                          <HeaderTemplate>
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
                              <td width="1"><img src="Images/img/line.gif" width="1" height="34"></td>
                              <td class="Board_ItemRegDate"><img src="Images/item_regdate.gif"></td>
                              <td width="1"><img src="Images/line.gif" width="1" height="34"></td>
                              <td class="Board_ItemVisited"><img src="Images/item_visit.gif"> </td>
                            </tr>
                              <tr class="Board_ItemLine2">
                              <td height="1" colspan="9"></td>
                            </tr>
                              <tr class="Board_ItemLine1">
                              <td height="2" colspan="9"></td>
                            </tr>
                            </table>
                        </HeaderTemplate>
                          <ItemTemplate>
                          <table cellspacing="1" cellpadding="0" border="0" class="Board">
                              <tr class="Board_Item">
                              <td class="Board_ItemNum"><asp:label id="Label1" runat="server"> <%# ListNum((int)DataBinder.Eval(Container, "DataItem.ListNum")) %> </asp:label>
                                </td>
                              <td class="Board_ItemSubject"><asp:hyperlink id="HyperLink1" runat="server" NavigateUrl='<%# PageLinkURL((int)DataBinder.Eval(Container, "DataItem.ID"))%>'> <%# ReplyList( Convert.ToInt16(DataBinder.Eval(Container, "DataItem.ReLevel")) ) %> <%# GetSubject( (int)DataBinder.Eval(Container, "DataItem.ID"), (string)DataBinder.Eval(Container, "DataItem.Subject") )%> </asp:hyperlink>
                                </td>
                              <td class="Board_ItemWriter"><asp:hyperlink id="HyperLink2" runat="server"> <%# DataBinder.Eval(Container, "DataItem.Writer")%> </asp:hyperlink>
                                </td>
                              <td class="Board_ItemRegDate"><asp:label id="Label2" runat="server"> <%# DataBinder.Eval(Container, "DataItem.RegDate", "{0:yyyy-MM-dd}")%> </asp:label>
                                </td>
                              <td class="Board_ItemVisited"><asp:label id="Label3" runat="server"> <%# DataBinder.Eval(Container, "DataItem.Visited").ToString()%> </asp:label>
                                </td>
                            </tr>
                            </table>
                        </ItemTemplate>
                          <AlternatingItemTemplate>
                          <table cellspacing="1" cellpadding="0" border="0" class="Board">
                              <tr class="Board_AlternatingItem">
                              <td class="Board_ItemNum"><asp:label id="Label4" runat="server"> <%# ListNum((int)DataBinder.Eval(Container, "DataItem.ListNum")) %> </asp:label>
                                </td>
                              <td class="Board_ItemSubject"><asp:hyperlink id="HyperLink3" runat="server" NavigateUrl='<%# PageLinkURL((int)DataBinder.Eval(Container, "DataItem.ID"))%>'> <%# ReplyList( Convert.ToInt16(DataBinder.Eval(Container, "DataItem.ReLevel")) ) %> <%# GetSubject( (int)DataBinder.Eval(Container, "DataItem.ID"), (string)DataBinder.Eval(Container, "DataItem.Subject") )%> </asp:hyperlink>
                                </td>
                              <td class="Board_ItemWriter"><asp:hyperlink id="HyperLink4" runat="server"> <%# DataBinder.Eval(Container, "DataItem.Writer")%> </asp:hyperlink>
                                </td>
                              <td class="Board_ItemRegDate"><asp:label id="Label5" runat="server"> <%# DataBinder.Eval(Container, "DataItem.RegDate", "{0:yyyy-MM-dd}")%> </asp:label>
                                </td>
                              <td class="Board_ItemVisited"><asp:label id="Label6" runat="server"> <%# DataBinder.Eval(Container, "DataItem.Visited").ToString()%> </asp:label>
                                </td>
                            </tr>
                            </table>
                        </AlternatingItemTemplate>
                        </asp:datalist></td>
                    </tr>
                    <tr class="Board_Footer">
                      <td colSpan="2" background="Images/img/dot1.gif"></td>
                    </tr>
                  </table></td>
            </td>
            
            </tr>
            
          </table>
    </form>
    <script lang="Javascript">
		function EditComment(URL)
		{
			window.open(URL, 'CEdit','width=400,height=250,marginwidth=0,marginheight=0,resizable=1,scrollbars=1');
		}
		
		function DeleteComment(db, id, cid, pageno)
		{
			if (confirm('코멘트를 삭제하시겠습니까?')) {
				document.location.href = 'ForumCmt_delete.aspx?db='+db+'&id='+id+"&cid="+cid+"&pageno="+pageno;
			}
		}
		</script>
	</body>
</HTML>
