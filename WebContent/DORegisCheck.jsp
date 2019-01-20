<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@page language="java" session="true"%>
<%@include file="getcon.jsp"%>
<%
	String firstname = request.getParameter("firstname");
	String lastname = request.getParameter("lastname");
	String username = request.getParameter("user");
	String password = request.getParameter("passwd");
	String email = request.getParameter("emailid");
	String phone = request.getParameter("phone");

	System.out.println(firstname);
	System.out.println(lastname);
	System.out.println(username);

	if ((username != "") && (password != "")) {
		try {
			PreparedStatement ps = conn.prepareStatement(
					"insert into dataowner(fname,lname,uname,upass,email,phone)values (?,?,?,?,?,?)");
			ps.setString(1, firstname);
			ps.setString(2, lastname);
			ps.setString(3, username);
			ps.setString(4, password);
			ps.setString(5, email);
			ps.setString(6, phone);
			ps.executeUpdate();
			request.setAttribute("message", "Registration successful");
			RequestDispatcher rd = request.getRequestDispatcher("dataOwner.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}

	} else {
		request.setAttribute("message", "Registration Failed");
		RequestDispatcher rd = request.getRequestDispatcher("dataOwnerReg.jsp");
		rd.forward(request, response);
	}
%>