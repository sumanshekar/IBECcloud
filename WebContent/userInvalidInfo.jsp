<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="getcon.jsp"%>
<%@page import="com.mega.database.DB"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String filename = (String) request.getParameter("filename");
		String userId = (String) session.getAttribute("userId");
		System.out.println("filename :: " + filename);
		String sql = "insert into  attackerdetails(filename,hashkey,server,content, attackerid) values ('"
				+ filename + "','','','','" + userId + "') ";
		//String updateSql = "update filedetails set auth = 2 where filename ='" + fname + "' ";
		int x = con.createStatement().executeUpdate(sql);
		if (x > 0) {
			request.setAttribute("msg", "Wrong Key Entered, User blocked.");
			RequestDispatcher rd = request.getRequestDispatcher("user.jsp");
			rd.forward(request, response);
		}
	%>
</body>
</html>