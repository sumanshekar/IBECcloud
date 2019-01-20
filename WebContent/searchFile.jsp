<%@page import="java.sql.*"%>
<%@ page import="com.mega.database.DB"%>
<html>
<head>
<title>Cloud Computing</title>
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
	<h1 class="pageTitle">File Details</h1>
	<div class="table-responsive" style="height: 40%">
		<table class="display_table">
			<%
				String redirectPage = "";
				try {
					String fileName = (String) request.getParameter("fileName");
					String uid = session.getAttribute("userId").toString();
					boolean isEmpty = true;
					String query = "select id,filename,filekey,server from filedetails where filename = '" + fileName
							+ "' and auth in (1)";
					//System.out.println("query " + query);
					if (fileName != null && uid != null && !fileName.equals("")) {
						ResultSet resultset1 = DB.stmt().executeQuery(query);
						redirectPage = "userpage.jsp";
			%>
			<tr style="font-size: large; color: brown; font-family: serif">
				<th style="text-align: center">Id</th>
				<th style="text-align: center">FileName</th>
				<th style="text-align: left">Server</th>
				<th style="text-align: left">SecretKey</th>
			</tr>
			<%
				while (resultset1.next()) {
							isEmpty = false;
			%>
			<tr style="font-size: large; color: slateblue; font-family: serif">
				<td style="text-align: left"><%=resultset1.getInt(1)%></td>
				<td style="text-align: left"><%=resultset1.getString(2)%></td>
				<td style="text-align: left"><%=resultset1.getString(4)%></td>
				<td style="text-align: left"><a
					href="sendEmail.jsp?id=<%=uid%>&filekey=<%=resultset1.getString(3)%>">ReqForSecretKey</a></td>
			</tr>
			<%
				}
					}
					if (isEmpty) {
			%>
			<tr align="center">
				<td colspan="8" class="empty_table_text">No Records Found</td>
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