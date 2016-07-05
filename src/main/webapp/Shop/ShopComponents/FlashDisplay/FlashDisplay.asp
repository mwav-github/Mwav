<%
	c = Request.QueryString("c")
	if c <> "" then 
		fdName = "FD" & c & ".swf"
	else
		fdName = "FDdefault.swf"
	end if
%>
<base href="<%= Application("SiteURLDir") %>ShopComponents/FlashDisplay/" target="_self">
<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="800" height="131">
  <param name="movie" value="Images/<%= fdName %>">
  <param name="quality" value="high">
  <embed src="Images/<%= fdName %>" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="800" height="131"></embed>
</object>
