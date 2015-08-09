		<SCRIPT language="javascript">
<!-- 
var old='';
function menu(name)
{
	submenu=eval("submenu_"+name+".style");
	if(old!=submenu)
	{
		if(old!='')
		{
				old.display='none';
		}
		submenu.display='block';
		old=submenu;
	}
	else
	{
		submenu.display='none';
		old='';
	}
}
-->
		</SCRIPT>
<%@ Register TagPrefix="uc1" TagName="InfoMessages" Src="../../InfoMessages/InfoMessages.ascx" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="BoardPR.ascx.cs" Inherits="KistelSite.CommonApps.BoardPR.BoardPR" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<base href='<%= Application["BaseHref"] %>CommonApps/BoardPR/' target="_self">
<table width="580" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td><table width="580" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="92" rowspan="3"><img src="Images/PR_002.gif" width="92" height="51"></td>
						<td height="8" background="Images/PR_003.gif"></td>
						<td width="21" rowspan="3"><img src="Images/PR_004.gif" width="21" height="51"></td>
					</tr>
					<tr>
						<td height="35" align="left">&nbsp; &nbsp;
							<asp:textbox id="tbSearchString" runat="server" Height="17px" Width="100px" MaxLength="10" ToolTip="검색 키워드를 넣으세요."></asp:textbox>
							<asp:imagebutton id="ibSearch" runat="server" imageUrl="Images/PR_search.gif" ImageAlign="AbsMiddle"></asp:imagebutton>
						</td>
					</tr>
					<tr>
						<td height="8" background="Images/PR_003.gif"></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td align="left" height="25">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
				<asp:regularexpressionvalidator id="RegularExpressionValidator1" runat="server" EnableViewState="False" ControlToValidate="tbSearchString"
					ErrorMessage="*" ValidationExpression="[0-9A-Za-z\uac00-\ud7a3]{2,10}" Display="Dynamic">공백,특수문자를 제외한 두글자 이상을 입력하세요.</asp:regularexpressionvalidator>
				<asp:requiredfieldvalidator id="RequiredFieldValidator2" runat="server" EnableViewState="False" ControlToValidate="tbSearchString"
					ErrorMessage="검색할 내용을 넣으세요." Display="Dynamic">검색할 내용을 넣으세요.</asp:requiredfieldvalidator></td>
		</tr>
		<tr>
			<td align="left">
				<asp:repeater id="rptPR" runat="server">
					<HeaderTemplate>
						<tr>
							<td>
								<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="0">
									<TR>
										<TD height="2" colspan="3" bgcolor="#dddddd"></TD>
									</TR>
									<TR>
										<TD height="30">&nbsp;</TD>
										<TD align="left">
											<asp:Literal id="litSearchResult" runat="server" Visible="False"></asp:Literal>&nbsp;</TD>
										<TD align="right">
											<asp:Literal id="litListBrief" runat="server"></asp:Literal>&nbsp;&nbsp;</TD>
									</TR>
									<TR>
										<TD height="2" colspan="3" bgcolor="#dddddd"></TD>
									</TR>
								</TABLE>
							</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>						
						<tr>
							<td align="left">
								※ 제목을 클릭하시면 내용을 다운받으실 수 있습니다.</td>
						</tr>
						<tr>
							<td height="3" bgcolor="#990099"></td>
						</tr>
					</HeaderTemplate>
					<ItemTemplate>
						<TR bgcolor="#ffffff">
							<TD height="30" align="left">
								&nbsp;&nbsp;<A style="CURSOR: hand" onclick='menu(<%# Container.ItemIndex %>);'>
									<asp:Literal id="df_id" Text='<%# DataBinder.Eval(Container.DataItem, "da_id") %>' Runat="server">
									</asp:Literal>.
									<asp:Label id="daName" Text='<%# DataBinder.Eval(Container.DataItem, "daName") %>' runat="server" class="Bbluetitle">
									</asp:Label></TD>
						</TR>
						<TR>
							<TD id='submenu_<%# Container.ItemIndex %>' style="DISPLAY: none">
								<TABLE cellSpacing="2" cellPadding="5" width="560" border="0" bgcolor="#dddddd">
									<TR>
										<TD align="left" bgcolor="#FFFFFF">
											<asp:Literal id="daDescription" Text='<%# DataBinder.Eval(Container.DataItem, "daDescription") %>' Runat="server">
											</asp:Literal>
										</TD>
									</TR>
									<TR>
										<TD align="center" class="pro_box">
											<asp:Repeater id="rptPRFile" OnItemCommand="rptPRFile_ItemCommand" runat="server">
												<HeaderTemplate>
													<table width="100%" border="0" cellspacing="2" cellpadding="1" height="25" bgcolor="#ffffff">
												</HeaderTemplate>
												<ItemTemplate>
													<tr>
														<td align="left">
															<nobr>
																<asp:Image id="imgExtIcon" runat="server" ImageUrl='<%# base.GetExtIconUrl(DataBinder.Eval(Container.DataItem, "dfOriginName")) %>' ImageAlign="AbsMiddle" AlternateText='<%# DataBinder.Eval(Container.DataItem, "dfOrder") %>'>
																</asp:Image>
																<asp:LinkButton id="dfOriginName" runat="server" CommandName="select" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "dfName") %>' Text='<%# DataBinder.Eval(Container.DataItem, "dfOriginName") %>' ToolTip='<%# DataBinder.Eval(Container.DataItem, "dfDescription") %>' CausesValidation="false">
																	<%# DataBinder.Eval(Container.DataItem, "dfOriginName") %>
																</asp:LinkButton>
																(
																<asp:Literal id="lbFS" runat="server" Text='<%# base.GetFileSize(DataBinder.Eval(Container.DataItem, "dfName")) %>'>
																</asp:Literal>) </nobr>
														</td>
												</ItemTemplate>
												<AlternatingItemTemplate>
													<td align="left">
														<nobr>
															<asp:Image id="imgExtIcon" runat="server" ImageUrl='<%# base.GetExtIconUrl(DataBinder.Eval(Container.DataItem, "dfOriginName")) %>' ImageAlign="AbsMiddle" AlternateText='<%# DataBinder.Eval(Container.DataItem, "dfOrder") %>'>
															</asp:Image>
															<asp:LinkButton id="dfOriginName" runat="server" CommandName="select" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "dfName") %>' Text='<%# DataBinder.Eval(Container.DataItem, "dfOriginName") %>' ToolTip='<%# DataBinder.Eval(Container.DataItem, "dfDescription") %>'>
																<%# DataBinder.Eval(Container.DataItem, "dfOriginName") %>
															</asp:LinkButton>
															(
															<asp:Literal id="lbFS" runat="server" Text='<%# base.GetFileSize(DataBinder.Eval(Container.DataItem, "dfName")) %>'>
															</asp:Literal>) </nobr>
													</td>
									</TR>
									</AlternatingItemTemplate>
									<FooterTemplate>
								</TABLE>
								</FooterTemplate>
							  </asp:repeater>
			</td>
</table>
</td> </tr>
<tr>
	<td height="10">
	</td>
</tr>
</ItemTemplate>
<SeparatorTemplate>
	<tr>
		<td height="1" bgcolor="#999999">
		</td>
	</tr>
</SeparatorTemplate>
<FooterTemplate>
	<tr>
		<td height="3" bgcolor="#990099"></td>
	</tr>
	<TR>
		<TD align="center" height="50"><asp:Literal id="litPaging" runat="server"></asp:Literal></TD>
	</TR>
</FooterTemplate>
</asp:repeater></TD></TR>
<tr>
	<td>
		<uc1:InfoMessages id="InfoMessages" runat="server"></uc1:InfoMessages>
	</td>
</tr>
<tr>
	<td align="right"><asp:hyperlink id="hlList" runat="server" ImageUrl="Images/btn_view_list.gif"></asp:hyperlink>
	</td>
</tr>
</TABLE>
