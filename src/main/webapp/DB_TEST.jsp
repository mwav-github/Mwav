jdbc에서는 기본적으로 localhost로는 접근 안됩니다. 
같은 서버라 하더라도 localhost 말고,, 127.0.0.1을 통해서 접속됩니다. 따라서 db user 에 127.0.0.1로 접속할수 있도록 host 필드를 설정해둬야 합니다.. 
설정후에는 반드시 flush privileges를 하세요..


<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<html>
<head>
</head> 
<body> 
<h1>JDBC JNDI Resource Test2</h1> 
<%
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
try {
Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/mwav", "mwav", "mwav201502!");
stmt = conn.createStatement(); 
rs = stmt.executeQuery("select version()");
while(rs.next()) {
out.println("mysql version ==>"+rs.getString("version()")); 
}
} catch (Exception e) {
e.printStackTrace();
} finally {
if( rs != null ) try { rs.close(); } catch(Exception ex) {}
if( stmt != null ) try { stmt.close(); } catch(Exception ex) {}
if( conn != null ) try{ conn.close(); } catch(Exception ex){}
}
%>
</body>
</html>