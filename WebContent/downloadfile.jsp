<%@page import="java.sql.*"%>
<%@ page import="com.mega.database.DB"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>IBE - User</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="bootstrap/bootstrap.min.css">
<script src="jquery/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</head>
<body>
	<!-- start header -->
	<jsp:include page="header.jsp" />

	<h1 class="pageTitle">User</h1>
	<div class="container" style="height: 50%">

		<div class="row">

			<div class="col-sm-3">
				<h3>
					<a href="downloadfile.jsp"> Download File </a>
				</h3>
			</div>
			<br /> <br />
			<div>
				<%
					String message = (String) request.getAttribute("message");
					if (message != null) {
						out.println("Status: "+message);
					}
				%>
			</div>
			<br />
			<div>
				<form action="DownloadFile" method="get">
					<input type="text" name="filename" required="required"
						placeholder="Enter the file name"><br /> <br /> <input
						type="text" name="filekey" required="required"
						placeholder="Enter the sec key"><br /> <br /> <input
						type="submit" value="Download">
				</form>
			</div>
		</div>
	</div>
	<div class="backButton button1">
		<a href="userpage.jsp">Go Back</a>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>