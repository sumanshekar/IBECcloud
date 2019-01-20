<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");

	if ((username != "") && (password != "")) {
		if ((username.equals("attacker")) && (password.equals("attacker"))) {
			session.setAttribute("user", "attacker");
			session.setAttribute("userId", username);
			response.sendRedirect("attackerPage.jsp");
		} else {
			request.setAttribute("msg", "Invalid UserName/password");
			RequestDispatcher rd = request.getRequestDispatcher("attackerLogin.jsp");
			rd.forward(request, response);
		}
	} else {
		request.setAttribute("msg", "Enter Details");
		RequestDispatcher rd = request.getRequestDispatcher("attackerLogin.jsp");
		rd.forward(request, response);
	}
%>