<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HomeLanguages.ascx.cs" Inherits="WebRoot.PartsOfContents.HomeLanguages.HomeLanguages" %>
<table border="0" cellpadding="0" cellspacing="0" width="248">
    <tr>
        <td colspan="3" height="3">
        </td>
    </tr>
    <tr>
        <td width="58" height="40" align="center">
            <asp:HyperLink ID="hlHome" runat="server" CssClass="bb">HOME</asp:HyperLink>
        </td>
        <td width="150" align="center">
            <!--select id="sltLanguage" name="sltLanguage">
                <option selected="selected" value="Select your language version!!">Languages Selector</option>
                <option value="en">English (International)</option>
                <option value="ja">Japanese (にほんご)</option>
                <option value="ch">Chinese (中國語)</option>
                <option value="kr">Korean (한국어)</option>
            </select-->
            <asp:DropDownList ID="ddlLanguages" runat="server" OnSelectedIndexChanged="ddlLanguages_SelectedIndexChanged">
                <asp:ListItem Selected="True" Value="Select your language version!!">Languages Selector</asp:ListItem>
            </asp:DropDownList>
</td>
        <td width="17">&nbsp;</td>
    </tr>
</table>