<%@page import="com.megainfo.random.RandomNumberGenerator"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.megainfo.auth.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mega.database.DB"%>
<%@page import="java.io.*"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%
	String redirectPage = "";
	int BYTES_DOWNLOAD = 1024;
	String filename = request.getParameter("filename");
	String filekey = request.getParameter("filekey");
	System.out.println(filename + " ==== " + filekey);
	int authenticate = 0;
	String fileId = "";

	boolean flag = false;
	ResultSet rs1 = DB.stmt().executeQuery("select * from filedetails where filekey = '" + filekey + "'");
	while (rs1.next()) {
		String fkey = rs1.getString(3);
		if (fkey.equals(filekey)) {
			fileId = rs1.getString(1);
			System.out.println("FileId db " + fileId);
			flag = true;
			break;
		}
	}
	if (flag == true) {
		String query = "select * from filedetails where filename = '" + filename + "' AND filekey = '" + filekey
				+ "'";
		System.out.println("Query in download " + query);
		ResultSet rs = DB.stmt().executeQuery(query);
		String filen = null;
		String filek = null;
		if (rs.next()) {
			System.out.println("File found ");
			int auth = rs.getInt(8);
			authenticate = auth;
			response.setContentType("text");
			String UPLOAD_DIRECTORY = "upload";
			String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;

			// creates the directory if it does not exist
			File uploadDir = new File(uploadPath);
			if (!uploadDir.exists()) {
				System.out.println(uploadDir.mkdir());
			}
			String filePath = uploadPath + File.separator;
			response.setContentType("text/plain");
			response.setHeader("Content-Disposition", "attachment;filename=" + filename + "");
			if (authenticate == 2) {
				request.setAttribute("message", "File is been attacked!");
				RequestDispatcher rd = request.getRequestDispatcher("downloadfile.jsp");
				rd.forward(request, response);
			} else {
				request.setAttribute("message", "Downloaded Sucessfully...");
				RequestDispatcher rd = request.getRequestDispatcher("downloadfile.jsp");
				rd.forward(request, response);
			}
		} else {
			request.setAttribute("filename", filename);
			request.setAttribute("filekey", filekey);
			request.setAttribute("msg", "Wrong File Name Entered, try Again.");
			RequestDispatcher rd = request.getRequestDispatcher("downloadfile.jsp");
			rd.forward(request, response);
		}
	} else {
		PreparedStatement ps;
		String uid = (String) session.getAttribute("userId");
		System.out.println("uid : " + uid);
		Connection con = DBConnection.getConnection();

		//Update userdetails table
		ps = con.prepareStatement("UPDATE USERDETAILS SET USERSTATUS = 0 WHERE UID = '" + uid + "'");
		int x = ps.executeUpdate();
		System.out.println("Update status " + x);

		String key = RandomNumberGenerator.getRSAKey();
		System.out.println("Key - " + key + " fileId " + fileId);

		//Update Filedetails table
		//ps = con.prepareStatement("UPDATE FILEDETAILS SET FILEKEY = '" + key + "' WHERE ID = '" + fileId + "'");
		ps = con.prepareStatement(
				"UPDATE FILEDETAILS SET FILEKEY = '" + key + "' WHERE FILENAME = '" + filename + "'");
		int x1 = ps.executeUpdate();
		System.out.println("Update Status x1 " + x1);

		request.setAttribute("msg", "Wrong Key Entered, User blocked.");
		RequestDispatcher rd = request.getRequestDispatcher("userInvalidInfo.jsp");
		rd.forward(request, response);
	}
%>
