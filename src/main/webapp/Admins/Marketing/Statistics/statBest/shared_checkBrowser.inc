<%
	Set objBrowsCap=Server.CreateObject("MSWC.BrowserType")
    	sAppName=objBrowsCap.Browser
    	sAppVer=objBrowsCap.Version
    	HandlesJScript=objBrowsCap.javascript
    	HandlesCookies=objBrowsCap.Cookies
	set objBrowsCap=nothing
%>
