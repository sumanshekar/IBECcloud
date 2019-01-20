<%@page import="java.sql.*"%>
<%@ page import="com.mega.database.DB"%>
<html>
<head>
<title>IBE - Attacker Home</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="bootstrap/bootstrap.min.css">
<script src="jquery/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<h1 class="pageTitle">Attacker</h1>
	<div class="container" style="height: 50%">
		<div style="height: 40px; color: red;">
			<%
				String message = (String) request.getAttribute("message");
				if (message != null) {
					out.println(message);
				}
			%>
		</div>
		<div class="row">

			<div class="col-sm-3">
				<h3>
					<a href="viewfiles3.jsp"> View Files </a>
				</h3>
			</div>
			<div class="col-sm-3">
				<h3>
					<a href="index.jsp"> Log Out </a>
				</h3>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>