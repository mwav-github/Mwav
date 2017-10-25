<html>
<body>
<center><h2>ServerVariable All</h2></center>
<Table border="1" width="70%">
<tr>
<th><center>Key</center></th>
<th><center>Value</center></th>
</tr>
<% For Each key in Request.ServerVariables %>
<tr>
<tr>
<td><center><font face="±¼¸²Ã¼" size="2"><%= key%></font></center></td>
<td><font face="±¼¸²Ã¼" size="2">
<%
if Request.ServerVariables(key)="" Then Response.Write "&nbsp" else Response.Write (Request.ServerVariables(key)) end if
%>

</font></td></tr>
<% Next %>
</table>
<% Response.Write "HTTP_REFERER : " & Request.ServerVariables("HTTP_REFERER") %>
</body>
</html>
        