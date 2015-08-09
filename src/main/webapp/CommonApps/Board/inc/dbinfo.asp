<%

	 dim sql_ip,sql_db,sql_id,sql_pw,strconnect,db

	 sql_ip="127.0.0.1"
	 sql_db="board"
	 sql_id="sa"
	 sql_pw="7039"

	 strconnect = "Provider=SQLOLEDB.1;Persist Security Info=False;User ID="&sql_id&";Initial Catalog="&sql_db&";Data Source="&sql_ip&";Password="&sql_pw&""
	 Set db=Server.CreateObject("ADODB.Connection") 
	 db.Open strconnect

%>
