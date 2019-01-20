<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
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
	String dob = request.getParameter("dateof");
	String gender = request.getParameter("gender");
	String phone = request.getParameter("phone");
	String nationality = request.getParameter("nationality");
	System.out.println(firstname);
	System.out.println(lastname);
	System.out.println(username);
	System.out.println(password);
	System.out.println(email);
	System.out.println(dob);
	System.out.println(gender);
	System.out.println(phone);
	System.out.println(nationality);

	if ((username != "") && (password != "")) {
		try {
			PreparedStatement ps = conn.prepareStatement(
					"insert into userdetails(fname,lname,uname,pass,email,dob,gender,phone,nationality, userstatus)values (?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1, firstname);
			ps.setString(2, lastname);
			ps.setString(3, username);
			ps.setString(4, password);
			ps.setString(5, email);
			ps.setString(6, dob);
			ps.setString(7, gender);
			ps.setString(8, phone);
			ps.setString(9, nationality);
			ps.setString(10, "0");
			ps.executeUpdate();

			request.setAttribute("msg", "Register Sucessfully..");
			RequestDispatcher rd = request.getRequestDispatcher("user.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}

	} else {
		request.setAttribute("message", "Enter the valid details...");
		RequestDispatcher rd = request.getRequestDispatcher("userreg.jsp");
		rd.forward(request, response);
	}
%>