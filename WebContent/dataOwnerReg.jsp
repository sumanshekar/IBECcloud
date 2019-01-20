<!DOCTYPE HTML>
<html>
<head>
<title>Cloud Computing</title>
<link href="css/megastyle.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="bootstrap/bootstrap.min.css">
<script src="jquery/jquery.min.js"></script>

<style type="text/css">
.options {
	display: none;
	position: absolute;
	top: 100%;
	right: 0;
	left: 0;
	z-index: 999;
	margin: 0 0;
	padding: 0 0;
	list-style: none;
	border: 1px solid #ccc;
	background-color: white;
	-webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
	-moz-box-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
}
</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	<h1 class="pageTitle">Data Owner Registration</h1>
	<form name="reg" action="DORegisCheck.jsp" method="post">
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
					<td><table>
							<tr>
								<td>First Name</td>
								<td width="200"><input type="text" name="firstname"></td>
							</tr>
							<tr>
								<td>Last Name</td>
								<td><input type="text" name="lastname"></td>
							</tr>
							<tr>
								<td>User Name</td>
								<td width="110"><input type="text" name="user" size="20">
									<span id=username1></span></td>
							</tr>
							<tr>
								<td>Password</td>
								<td><input type="password" name="passwd" size="20">
									<span id=password1></span></td>
							</tr>
							<tr>
								<td>ConfirmPassword</td>
								<td><input type="password" name="CONFIRM" size="20">
									<span id=confirmpassword1></span></td>
							</tr>
							<tr>
								<td>Email</td>
								<td><input type="text" name="emailid" size="20"></td>
							</tr>

						</table></td>
					<td></td>
				</tr>
				<tr>
					<td><input name="submit" type="submit" value="Submit"></td>
					<td><input type="RESET" value="Reset"></td>
				</tr>
			</table>

		</div>
	</form>
	<br />
	<jsp:include page="footer.jsp" />

</body>
</html>
