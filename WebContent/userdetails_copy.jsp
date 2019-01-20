<%@page import="java.sql.*"%>
<%@ page import="com.mega.database.*"%>
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

	<%
		String redirectPage = "";
	%>
	<h1 class="pageTitle">User Details</h1>
	<div class="table-responsive">
		<table class="display_table">
			<%
				try {
					int i = 1;
					ResultSet resultset1 = DB.stmt()
							.executeQuery("select uid,fname,email,phone,nationality from userdetails");
					redirectPage = "cloudServerPage.jsp";
			%>
			<tr style="font-size: large; color: brown; font-family: serif">
				<TH>SI No</TH>
				<TH>First Name</TH>
				<TH>Email</TH>
				<TH>Phone</TH>
				<TH>Nationality</TH>
			</tr>

			<%
				boolean isEmpty = true;
					while (resultset1.next()) {
						isEmpty = false;
			%>

			<tr style="font-size: large; color: slateblue; font-family: serif">
				<TD style="text-align: center"><%=i++%></TD>
				<TD style="text-align: left"><%=resultset1.getString(2)%></TD>
				<TD style="text-align: left"><%=resultset1.getString(3)%></TD>
				<TD style="text-align: left"><%=resultset1.getString(4)%></TD>
				<TD style="text-align: left"><%=resultset1.getString(5)%></TD>
			</tr>

			<%
				}
					if (isEmpty) {
			%>
			<tr align="center">
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