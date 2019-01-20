<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mega.database.DB"%>
<%@page import="java.io.*"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%
	String redirectPage = "";
	int BYTES_DOWNLOAD = 1024;
	String filename = request.getParameter("filename");
	String filekey = request.getParameter("filekey");
	System.out.println(filename + " ==== " + filekey);
	int authenticate = 0;
	if (filename.equals(null) || filekey.equals(null) || filekey.equals("") || filename.equals("")) {
		JOptionPane.showMessageDialog(null, "Fields shoud not empty....");
		response.sendRedirect("downloadfile.jsp");
	} else {
		String query = "select * from filedetails where filename = '" + filename + "' OR filekey = '" + filekey
				+ "'";
		System.out.println("query in download " + query);
		ResultSet rs = DB.stmt().executeQuery(query);
		String filen = null;
		String filek = null;
		ArrayList list = new ArrayList();
		while (rs.next()) {
			filen = rs.getString(2);
			filek = rs.getString(3);
			if (filename.equals(filen)) {
				list.add(filen);
				list.add(filek);
				break;
			}
		}

		String fn = (String)list.get(0);
		String fk = (String)list.get(1);

		if (fn.equals(filename)&&fk.equals(filekey)) {
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
				JOptionPane.showMessageDialog(null,
						"File has been attacked. You want to download from proxy ");
			} else {
				JOptionPane.showMessageDialog(null, "Downloaded Sucessfully...");
				response.sendRedirect("downloadfile.jsp");
			}
		}
		else {
			request.setAttribute("filename", filename);
			request.setAttribute("filekey", filekey);

			JOptionPane.showMessageDialog(null, "Invalid FileKey/FileName");
			//response.sendRedirect("userInvalidInfo.jsp");
			RequestDispatcher rd = request.getRequestDispatcher("userInvalidInfo.jsp");
			rd.forward(request, response);
		}
		
		
		
		
		
		
		
		if (rs.next()) {
			if (filen.equals(filename)) {
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
					JOptionPane.showMessageDialog(null,
							"File has been attacked. You want to download from proxy ");
				} else {
					JOptionPane.showMessageDialog(null, "Downloaded Sucessfully...");
					response.sendRedirect("downloadfile.jsp");
				}
			} else if (filek.equals(filekey)) {
				request.setAttribute("filename", filename);
				request.setAttribute("filekey", filekey);
				JOptionPane.showMessageDialog(null, "Invalid FileKey");
				RequestDispatcher rd = request.getRequestDispatcher("userInvalidInfo.jsp");
				rd.forward(request, response);
			} else {
				JOptionPane.showMessageDialog(null, "File Not Found!");
				response.sendRedirect("downloadfile.jsp");
			}
		} else {
			request.setAttribute("filename", filename);
			request.setAttribute("filekey", filekey);

			JOptionPane.showMessageDialog(null, "Invalid FileKey/FileName");
			//response.sendRedirect("userInvalidInfo.jsp");
			RequestDispatcher rd = request.getRequestDispatcher("userInvalidInfo.jsp");
			rd.forward(request, response);
		}
	}
%>
