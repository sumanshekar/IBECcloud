<%@page import="java.sql.*"%>
<html>
	<head>	
<title>IBE - Data owner</title>
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

<h1 class="pageTitle">Data Owner</h1>
<div class="container" style="height: 50%">
<div class="row">
		
			<div class="col-sm-3">
				<h3>
					<a href="uploadFile.jsp">  Upload Files  </a>
				</h3>
			</div>
	
		<div class="col-sm-3">
				<h3>
					<a href="viewfiles.jsp?userId=<%=session.getAttribute("userId")%>">   View Files </a> 
				</h3>
			</div>
			
			<div class="col-sm-3">
				<h3>
					<a href="index.jsp">   Log Out </a>
				</h3>
			</div>

</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>