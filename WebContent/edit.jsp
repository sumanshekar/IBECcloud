<%@page import="java.sql.*"%>
<%@ page import="com.mega.database.DB"%>
<html>
<head>
<title>IBE - Attacker Attack</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="bootstrap/bootstrap.min.css">
<script src="jquery/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<h1 class="pageTitle">Attacker</h1>
	<div class="container" style="height: 50%">
		<%
			int id = Integer.valueOf(request.getParameter("id"));
			ResultSet resultset1 = DB.stmt().executeQuery("select * from filedetails where id ='" + id + "'");
			if (resultset1.next()) {
				String fContent = resultset1.getString("content");
				//System.out.println("fContent DB " + fContent);
		%>
		<input type="hidden" name="fileName" id="fileName"
			value="<%=resultset1.getString("filename")%>" /> <input
			type="hidden" id="server" value="<%=resultset1.getString("server")%>" />
		<input type="hidden" id="id" value="<%=id%>" />
		<textarea id="contentId" name="content"><%=fContent%></textarea>
		<%
			}
		%>
		<button value="Update" onclick="UpdateContent()">Update</button>
		<div class="row"></div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
<script>
	function UpdateContent() {
		var fname = document.getElementById("fileName").value;
		var fContent = document.getElementById("contentId").value;
		var server = document.getElementById("server").value;
		var id = document.getElementById("id").value;
		var url = "modifyAttackerContent.jsp?fname=" + fname + "&fContent="
				+ fContent + "&server=" + server + "&id=" + id;
		window.location.href = url;
	}
</script>
</html>