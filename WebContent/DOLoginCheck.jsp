<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="getcon.jsp"%>
<%
	String username = request.getParameter("username");
	session.setAttribute("username", username);
	String password = request.getParameter("password");

	if ((username != "") && (password != "")) {
		if ((username.equals("admin")) && (password.equals("admin"))) {
			response.sendRedirect("upload.jsp");
		} else {
			String query = "Select uid,uname,upass from dataowner where uname='" + username + "' and upass='"
					+ password + "'";
			try {
				PreparedStatement ps = con.prepareStatement(query);
				ResultSet rs = ps.executeQuery();
				if (rs.next()) {
					int userid = rs.getInt(1);
					session.setAttribute("user", "dataowner");
					session.setAttribute("userId", userid);

					RequestDispatcher rd = request.getRequestDispatcher("dataOwnerpage.jsp");
					rd.forward(request, response);
				} else {
					request.setAttribute("message", "invalid username & password");
					RequestDispatcher rd = request.getRequestDispatcher("dataowner.jsp");
					rd.forward(request, response);
				}
			} catch (Exception e) {
				System.out.println("Exception " + e);
			}
		}
	}

	else {
		request.setAttribute("message", "Enter Details");
		RequestDispatcher rd = request.getRequestDispatcher("dataOwner.jsp");
		rd.forward(request, response);
	}
%>
