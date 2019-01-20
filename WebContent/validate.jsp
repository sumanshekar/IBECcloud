<%@page import="com.mega.database.DB"%>
<%@page import="java.sql.ResultSet"%>
<%
	int id = Integer.valueOf(request.getParameter("id"));
	//String sql = "select * from filedetails where id = '"+id+"'";
	String sql = "update filedetails set auth = '1' where id = '" + id + "'";

	DB.con().createStatement().executeUpdate(sql);

	//request.getRequestDispatcher("/validatefile.jsp").forward(request, response);
	response.sendRedirect("validatefiles.jsp");
%>



