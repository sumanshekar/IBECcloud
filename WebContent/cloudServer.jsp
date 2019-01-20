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
	<h1 class="pageTitle">Cloud Server Login</h1>
	<div id="contentdiv"></div>
	<form name="dataownerForm" action="CSLoginCheck.jsp" method="post">
		<div align="center">
			<table class="login_style">
				<tr>
					<td><b>Login Name</b></td>
					<td><input type="text" name="username" id="username" /></td>
				</tr>
				<tr>
					<td><b>Password</b></td>
					<td><input type="password" name="password" id="password"
						MaxLength="8" /></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" name="Submit" value="Submit" /></td>
				</tr>

			</table>
		</div>
	</form>
	<br />
	<br />
	<jsp:include page="footer.jsp" />
</html>