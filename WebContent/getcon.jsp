<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cloud Computing</title>
</head>
<body>
	<%!Connection con, conn, connection = null;
	Statement st, stat, statement = null;%>
	<%
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String DB_URL = "jdbc:mysql://localhost/identitybased";
			String USER = "root";
			String PASS = "";
			con = DriverManager.getConnection(DB_URL, USER, PASS);
			st = con.createStatement();
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
			stat = conn.createStatement();
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>

</body>
</html>
