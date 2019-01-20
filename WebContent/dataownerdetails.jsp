<%@page import="java.sql.*"%>
<%@ page import="com.mega.database.DB"%>
<html>
<head>
<title>IBE - Cloud Server</title>
<link rel="stylesheet" href="bootstrap/bootstrap.min.css">
<script src="jquery/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<link href="css/megastyle.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<jsp:include page="header.jsp" />

	<!--------start-blog----------->
	<%
		String redirectPage = "";
	%>

	<h1 class="pageTitle">Data Owner Details</h1>
	<div class="table-responsive" style="height: 40%">
		<table class="display_table">
			<%
				try {
					int i = 1;
					ResultSet resultset1 = DB.stmt().executeQuery("select uid,fname,uname,email,phone from dataowner");
					redirectPage = "cloudServerPage.jsp";
			%>
			<tr style="font-size: large; color: brown; font-family: serif">
				<th style="text-align: center">FirstName</th>
				<th style="text-align: left">UserName</th>
				<th style="text-align: left">Email</th>
				<th style="text-align: left">Phone</th>

			</tr>
			<%!boolean isEmpty = true;%>

			<%
				boolean isEmpty = true;
					while (resultset1.next()) {
						isEmpty = false;
			%>

			<tr style="font-size: large; color: slateblue; font-family: serif">
				<td style="text-align: left"><%=resultset1.getString(2)%></td>
				<td style="text-align: left"><%=resultset1.getString(3)%></td>
				<td style="text-align: left"><%=resultset1.getString(4)%></td>
				<td style="text-align: left"><%=resultset1.getString(5)%></td>
			</tr>
			<%
				}
					if (isEmpty) {
			%>
			<tr>
				<td colspan="5" class="empty_table_text">No Records Found</td>
			</tr>
			<%
				}
				} catch (Exception e) {
					System.out.println(e);
				}
			%>
		</table>
		<div class="backButton button1">
			<a href="<%=redirectPage%>">Go Back</a>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>