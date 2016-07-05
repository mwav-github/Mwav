<%
	c = Request.QueryString("c")
	if c <> "" then 
		SCName = "SC" & c & ".gif"
	else
		SCName = "SCdefault.gif"
	end if 
%>
<base href="<%= Application("SiteURLDir") %>ShopComponents/SelectedCategory/" target="_self">
<img src="Images/<%= SCName %>" border="0">