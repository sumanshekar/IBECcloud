<%@page import="java.sql.*"%>
<html>
<head>
<title>IBE - Data owner</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="bootstrap/bootstrap.min.css">

<script src="jquery/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</head>
<body>
	<!-- start header -->
	<jsp:include page="header.jsp" />

	<h1 class="pageTitle">Data Owner</h1>
	<div class="container" style="height: 50%">
		<div class="row">
			<div class="alert alert-info">
				Status Update
				<%
				String message = (String) request.getAttribute("message");
				if (message == null) {
					message = "";
				}
			%>
				<%=message%>
			</div>
			<div>
				<FORM align="center" ENCTYPE="multipart/form-data"
					ACTION="UploadFile" METHOD=POST>
					<table width="500" align="center">
						<tr>
							<td><h4>Select Cloud Server And File To Upload</h4></td>
						</tr>
						<%
							Object id = session.getAttribute("userId");
						%>
						<tr>
							<td><input type="hidden" name="ownerid" value="<%=id%>" /></td>
						</tr>
						<tr>
							<td>Select Cloud Server</td>
							<td>
							<td><input type="hidden" name="cloud" value="CS1" /></td>
						</tr>

						<tr>
							<td><INPUT type="file" name="f1" /></td>
						</tr>
						<tr></tr>
						<tr>
							<td><input type="submit" name="Submit" value="Upload" /></td>
						</tr>
					</table>

				</FORM>
			</div>

		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>