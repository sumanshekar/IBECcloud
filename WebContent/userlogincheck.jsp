<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="getcon.jsp"%>
<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	PreparedStatement ps = null;
	if ((username != "") && (password != "")) {
		if ((username.equals("admin")) && (password.equals("admin"))) {
			System.out.println("Welcome to Admin!");
		} else {
			String query = "Select uid, uname,pass from userdetails where uname='" + username + "' and pass='"
					+ password + "' and userstatus = '1'";
			try {
				ps = con.prepareStatement(query);
				ResultSet rs = ps.executeQuery();
				if (rs.next()) {
					String id = String.valueOf(rs.getInt(1));
					session.setAttribute("user", "user");
					session.setAttribute("userId", id);
					response.sendRedirect("userpage.jsp");
				} else {
					request.setAttribute("msg", "Wrong User Name/Password/User Blocked!");
					String queryUpdate = "UPDATE USERDETAILS SET USERSTATUS = '0' WHERE UNAME = '" + username
							+ "'";
					ps = con.prepareStatement(queryUpdate);
					ps.executeUpdate();
					RequestDispatcher rd = request.getRequestDispatcher("user.jsp");
					rd.forward(request, response);
				}
			} catch (Exception e) {
				System.out.println("Exception " + e);
			}

		}
	}

	else {
		request.setAttribute("msg", "Enter User Details!");
		RequestDispatcher rd = request.getRequestDispatcher("user.jsp");
		rd.forward(request, response);
	}
%>
