<!DOCTYPE HTML>
<html>
<head>
<title>IBE - TPA Login</title>
<link href="css/megastyle.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="bootstrap/bootstrap.min.css">
<script src="jquery/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="header.jsp" />

	<h1 class="pageTitle">Third Party Auditor</h1>
	<form name="dataownerForm" action="authLoginCheck.jsp" method="post">
		<div align="center">
			<div>
				<%
					String message = (String) request.getAttribute("msg");
					if (message != null) {
						out.println(message);
					}
				%>
			</div>
			<table class="login_style">
				<tr>
					<td>Login Name</td>
					<td><input type="text" name="username" id="username"
						required="required" /></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="password" name="password" id="password"
						MaxLength="8" required="required" /></td>
				</tr>
				<tr>
					<td><input type="reset" name="reset" value="Reset" /></td>
					<td><input type="submit" name="Submit" value="Submit" /></td>
				</tr>
			</table>
		</div>
	</form>
	<br />
	<br />
	<jsp:include page="footer.jsp" />
</body>
</html>