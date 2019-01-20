<%@page import="com.megainfoware.mail.auth.ConfirmationMailer"%>
<%@page import="com.mega.database.DB"%>
<%@page import="com.app.mail.SendEmail"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>

<%
	String id = request.getParameter("id");
	String filekey = request.getParameter("filekey");
	String username = null;
	String mail = null;
	try {

		String sql = "select uname,email from userdetails where uid = '" + Integer.parseInt(id) + "' ";
		ResultSet rs = DB.stmt().executeQuery(sql);

		if (rs.next()) {
			username = rs.getString(1);
			mail = rs.getString(2);
		}

	} catch (Exception ex) {
		ex.printStackTrace();
	}
	ConfirmationMailer cm = new ConfirmationMailer();
	//cm.sendMailTwoParams("accademic.projects16@gmail.com", "1234");
	cm.sendMailThreeParams(mail, filekey, username);

	request.setAttribute("msg", "Mail Sent");
	RequestDispatcher rd = request.getRequestDispatcher("userpage.jsp");
	rd.forward(request, response);
%>

