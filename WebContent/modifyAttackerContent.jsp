<%@include file="getcon.jsp"%>
<%@page import="com.mega.database.DB"%>
<%
	String fname = (String) request.getParameter("fname");
	System.out.println("fname " + fname);
	String fContent = (String) request.getParameter("fContent");
	System.out.println("fContent " + fContent);
	String server = (String) request.getParameter("server");
	System.out.println("server " + server);
	String id = (String) request.getParameter("id");
	System.out.println("id " + id);
	String userId = (String) session.getAttribute("userId");
	try {
		String sql = "insert into  attackerdetails(filename,hashkey,server,content, attackerid) values ('"
				+ fname + "','" + fContent.hashCode() + "','" + server + "','" + fContent + "','" + userId
				+ "') ";
		String updateSql = "update filedetails set auth = 2 where id ='" + Integer.valueOf(id) + "' ";
		con.createStatement().executeUpdate(sql);
		con.createStatement().executeUpdate(updateSql);
		request.setAttribute("message", "File attacked! ");
		RequestDispatcher rd = request.getRequestDispatcher("attackerPage.jsp");
		rd.forward(request, response);
	} catch (Exception ex) {
		ex.printStackTrace();
	}
%>