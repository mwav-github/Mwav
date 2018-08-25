<!-- #include file="db.asp" -->

<html>

<head>

<title>Web Stats</title>

<style>

body	{font: 10pt verdana}
td		{font: 10pt verdana}
a		{text-decoration: none}


</style>

</head>

<body bgcolor=white>

<h1>Web Stats</h1>

<%
makeDBConnection()

' set up sql query and write details

' total

response.Write("")
sql="SELECT count(*) as total FROM log"
makeRS(SQL)
do while not rs.EOF
response.Write("<h3>Total page views = " & rs("total") & "</h3>")
rs.movenext
loop
rs.close


sql="SELECT count(*) as total FROM log where datediff(day,datestamp,getdate()) < 1"
makeRS(SQL)
do while not rs.EOF
response.Write("<h3>Total Today " & date() & " = "& rs("total") & "</h3>")
rs.movenext
loop
rs.close

response.Write("<h3>Top 10 Days</h3>")
'top 10 days
sql="SELECT top 10 count(left(datestamp,10)) AS visitcount, left(datestamp,10) as sday FROM log GROUP BY left(datestamp,10) ORDER BY count(left(datestamp,10)) DESC , left(datestamp,10)"
makeRS(SQL)

response.Write("<table border=1>")
response.Write("<tr><td>day</td><td>visitcount</td></tr>")
do while not rs.EOF
response.Write("<tr><td>" & rs("sday") & "</td><td>" & rs("visitcount") & "</td></tr>")
rs.movenext
loop
response.Write("</table>")
rs.close

response.Write("<h3>Top 10 Most Popular Pages</h3>")
'popular pages
sql="SELECT top 10 count(page) AS visitcount, page FROM log GROUP BY page ORDER BY count(page) DESC , page"
makeRS(SQL)

response.Write("<table border=1>")
response.Write("<tr><td>page</td><td>visitcount</td></tr>")
do while not rs.EOF
response.Write("<tr><td>" & rs("page") & "</td><td>" & rs("visitcount") & "</td></tr>")
rs.movenext
loop
response.Write("</table>")

rs.close

response.Write("<h3>Top 10 Referers</h3>")
'popular referers
sql="SELECT top 10 count(referer) AS visitcount, referer FROM log GROUP BY referer ORDER BY count(referer) DESC , referer"
makeRS(SQL)

response.Write("<table border=1>")
response.Write("<tr><td>referer</td><td>visitcount</td></tr>")
do while not rs.EOF
response.Write("<tr><td>" & rs("referer") & "</td><td>" & rs("visitcount") & "</td></tr>")
rs.movenext
loop
response.Write("</table>")

rs.close

response.Write("<h3>Top 10 Browsers</h3>")
'popular browsers
sql="SELECT top 10 count(browser) AS visitcount, browser FROM log GROUP BY browser ORDER BY count(browser) DESC , browser"
makeRS(SQL)

response.Write("<table border=1>")
response.Write("<tr><td>browser</td><td>visitcount</td></tr>")
do while not rs.EOF
response.Write("<tr><td>" & rs("browser") & "</td><td>" & rs("visitcount") & "</td></tr>")
rs.movenext
loop
response.Write("</table>")

rs.close

response.Write("<h3>Top 10 Hosts</h3>")
'popular hosts
sql="SELECT top 10 count(Host) AS visitcount, Host FROM log GROUP BY Host ORDER BY count(Host) DESC , Host"
makeRS(SQL)

response.Write("<table border=1>")
response.Write("<tr><td>Host</td><td>visitcount</td></tr>")
do while not rs.EOF
response.Write("<tr><td><a href=""http://www.demon.net/cgi-bin/external/checkwi?domain=" & rs("Host") & """ target=""_blank"">" & rs("Host") & "</a></td><td>" & rs("visitcount") & "</td></tr>")
rs.movenext
loop
response.Write("</table>")

rs.close


response.Write("<h3>Last 10 Visits</h3>")
'top 10 days
sql="SELECT top 10 datestamp, host, page from log order by datestamp desc"
makeRS(SQL)

response.Write("<table border=1>")
response.Write("<tr><td>datestamp</td><td>Host</td><td>page</td></tr>")


do while not rs.EOF
response.Write("<tr><td>" & rs("datestamp") & "</td><td><a href=""http://www.demon.net/cgi-bin/external/checkwi?domain=" & rs("Host") & """ target=""_blank"">" & rs("Host") & "</a></td><td>" & rs("page") & "</td></tr>")
rs.movenext
loop
response.Write("</table>")

rs.close

%>

</body></html>