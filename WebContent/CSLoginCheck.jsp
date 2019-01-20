<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="getcon.jsp"%>
<%
	String username = request.getParameter("username");
	session.setAttribute("username", username);
	String password = request.getParameter("password");

	if ((username != "") && (password != "")) {
		if ((username.equals("cloud")) && (password.equals("cloud"))) {
			session.setAttribute("user", "cloud");
			response.sendRedirect("cloudServerPage.jsp");
		}
	} else {
		response.sendRedirect("cloudServer.jsp");
	}
%>
