<%@page import="java.sql.*"%>
<html>
	<head>	
<title>IBE - User Search</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="bootstrap/bootstrap.min.css">
<script src="jquery/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
	<body>
<!-- start header -->
<jsp:include page="header.jsp"/>

<h1 class="pageTitle">User</h1>
<div class="container" style="height: 50%">

<div class="row">
	<div class="col-sm-3">
				<h3>
					<a href="search.jsp">  Search Files  </a>
				</h3>
			</div>

<!----//End-content---->
</div>	
<br/><br/>
<form action = "searchFile.jsp">
Search File: <input type="text" name="fileName">
<input type ="submit" value="Search" value='<%=session.getAttribute("userId")%>'>
</form>
</br>
</div>
<div class="backButton button1">
			<a href="userpage.jsp">Go Back</a>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>