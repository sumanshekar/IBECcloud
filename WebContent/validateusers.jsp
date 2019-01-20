<%@page import="java.sql.*"%>
<%@ page import="com.mega.database.*"%>
<html>
<head>
<title>IBE - TPA Validate</title>
<link rel="stylesheet" href="bootstrap/bootstrap.min.css">
<script src="jquery/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</head>
<link href="css/megastyle.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<jsp:include page="header.jsp" />
	<%
		String redirectPage = "";
	%>
	<h1 class="pageTitle">File Details</h1>
	<div class="table-responsive" style="height: 40%">
		<table class="display_table">
			<%
				try {
					int i = 1;
					ResultSet resultset1 = DB.stmt().executeQuery("select * from userdetails");
					redirectPage = "authorityPage.jsp";
					ResultSet rs = null;
			%>
			<tr style="font-size: large; color: brown; font-family: serif">
				<th style="text-align: center">SL No.</th>
				<th style="text-align: center">First Name</th>
				<th style="text-align: left">Last Name</th>
				<th style="text-align: left">User Name</th>
				<th style="text-align: left">Email</th>
				<th style="text-align: left">Phone</th>
				<th style="text-align: left">Status</th>
			</tr>
			<%!boolean isEmpty = true;%>
			<%
				while (resultset1.next()) {
						boolean isEmpty = false;
						String id = resultset1.getString(3);
						String auth = resultset1.getString(11);
			%>

			<tr style="font-size: large; color: slateblue; font-family: serif">
				<td style="text-align: left"><%=i++%></td>
				<td style="text-align: left"><%=resultset1.getString(2)%></td>
				<td style="text-align: left"><%=resultset1.getString(3)%></td>
				<td style="text-align: left"><%=resultset1.getString(4)%></td>
				<td style="text-align: left"><%=resultset1.getString(6)%></td>
				<%
					if (auth.equals("1")) {
				%>
				<td style="text-align: left">Validated</td>
				<%
					} else {
				%>
				<td style="text-align: left"><a
					href="validate_user.jsp?id=<%=resultset1.getString(4)%>">Validate</a></td>
				<%
					}
							if (auth.equals("0")) {
				%>
				<td style="text-align: left">Attacked</td>
				<%
					} else {
				%>
				<td style="text-align: left">Safe</td>
				<%
					}
				%>
			</tr>
			<%
				}
					if (!isEmpty) {
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
		<br />
		<div class="backButton button1">
			<a href="<%=redirectPage%>">Go Back</a>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>