<%@page import="com.mega.database.DB"%>
<%@page import="java.sql.ResultSet"%>
<%
	String id = (String) request.getParameter("id");
	String sql = "update userdetails set userstatus = '1' where uname = '" + id + "'";
	System.out.println("Query " + sql);
	DB.con().createStatement().executeUpdate(sql);
	response.sendRedirect("validateusers.jsp");
%>



