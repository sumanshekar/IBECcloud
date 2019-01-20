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

input[type=text], input[type=password], input[type=email], input[type=date]
	{
	width: 100%;
	padding: 6px 10px;
	margin: 6px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	<h1 class="pageTitle">User Registration</h1>
	<form name="reg" action="regischeck.jsp" method="post">
		<div align="center">
			<div style="height: 40px; color: red;">
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
								<td width="200"><input type="text" name="firstname"
									required="required"></td>
							</tr>
							<tr>
								<td>Last Name</td>
								<td><input type="text" name="lastname"></td>
							</tr>
							<tr>
								<td>User Name</td>
								<td width="110"><input type="text" name="user" size="20"
									required="required"> <span id=username1></span></td>
							</tr>
							<tr>
								<td>Password</td>
								<td><input type="password" name="passwd" size="20"
									required="required"> <span id=password1></span></td>
							</tr>
							<tr>
								<td>ConfirmPassword</td>
								<td><input type="password" name="CONFIRM" size="20"
									required="required"> <span id=confirmpassword1></span></td>
							</tr>

						</table></td>
					<td><table>

							<tr>
								<td>Email</td>
								<td><input type="email" name="emailid" size="20"></td>
							</tr>
							<tr>
								<td>DOB</td>
								<td><input name="dateof" value="" type="date"></td>
							</tr>
							<tr>
								<td>Gender</td>
								<td><select name="gender">
										<option value="Male">Male</option>
										<option value="Female">Female</option>
								</select></td>
							</tr>
							<tr>
								<td>Phone</td>
								<td><input type="text" name="phone" size="20"><br>
									<span id=phone1></span></td>
							</tr>
							<tr>
								<td>Nationality</td>
								<td><input type="text" name="nationality" size="20">
							</tr>

						</table></td>
				</tr>
				<tr>
					<td><input type="RESET" value="Reset"> <br></td>
					<td><input name="submit" type="submit" value="Submit"></td>
				</tr>
			</table>

		</div>
	</form>
	<br />
	<jsp:include page="footer.jsp" />
</body>
</html>
