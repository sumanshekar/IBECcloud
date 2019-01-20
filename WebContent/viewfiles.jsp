<%@page import="java.sql.*"%>
<%@ page import="com.mega.database.*"%>
<html>
<head>
<title>IBE - Data owner</title>
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

	<h1 class="pageTitle">File Details</h1>
	<div class="table-responsive" style="height: 40%">
		<table class="display_table">
			<%
				try {
					Object userId = session.getAttribute("userId");

					//		System.out.println(userId);
					int i = 1;
					ResultSet resultset1 = DB.stmt().executeQuery(
							"select id,filename,filekey,server,auth from filedetails where userid = '" + userId + "'");
					redirectPage = "dataOwnerpage.jsp";
			%>
			<tr style="font-size: large; color: brown; font-family: serif">
				<th style="text-align: center">Id</th>
				<th style="text-align: center">FileName</th>
				<th style="text-align: left">FileKey</th>
				<th style="text-align: left">Server</th>
				<th style="text-align: left">Status</th>

			</tr>
			<%!boolean isEmpty = true;%>

			<%
				boolean isEmpty = true;
					while (resultset1.next()) {
						int auth = resultset1.getInt(5);
						isEmpty = false;
			%>

			<tr style="font-size: large; color: slateblue; font-family: serif">
				<td style="text-align: left"><%=resultset1.getInt(1)%></td>
				<td style="text-align: left"><%=resultset1.getString(2)%></td>
				<td style="text-align: left"><%=resultset1.getString(3)%></td>
				<td style="text-align: left"><%=resultset1.getString(4)%></td>
				<%
					if (auth == 2) {
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