<!DOCTYPE HTML>
<html>
<head>
<title>Cloud Computing</title>
<link href="css/megastyle.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="bootstrap/bootstrap.min.css">
<script src="jquery/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="header.jsp" />

	<h1 class="pageTitle">Data Owner Login</h1>
	<!-- <form name="dataownerForm" action="authLoginCheck.jsp" method="post"> -->
	<form action="DOLoginCheck.jsp" name="dataowner.jsp" method="post">
		<div align="center">
			<div>
				<%
					String message = (String) request.getAttribute("message");
					if (message != null) {
						out.println(message);
					}
				%>
			</div>
			<table class="login_style">
				<tr>
					<td>Login Name</td>
					<td><input type="text" name="username" id="USERNAME" /></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="password" name="password" id="PASSWORD"
						MaxLength="10" /></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" name="Submit" value="Submit" /></td>
				</tr>
				<tr>
					<td colspan="2"><a href="dataOwnerReg.jsp">New User?
							Register here</a></td>
				</tr>
			</table>
		</div>
	</form>
	<br />
	<jsp:include page="footer.jsp" />
</body>
<script>
	document.getElementById('contentdiv').innerHTML = '${message}';
</script>
</html>