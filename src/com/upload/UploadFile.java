package com.upload;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.util.ResourceBundle;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.mega.database.DB;
import com.megainfo.util.AESUtility;
import com.megainfo.util.FileEncryptionContent;
import com.megainfo.util.UtillMegainfo;

/**
 * Servlet implementation class uploadPatient
 */
/**
 * @author Pramod
 *
 */
@WebServlet("/uploadPatient")
public class UploadFile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final String UPLOAD_DIRECTORY = "upload";

	private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3; // 3MB
	private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
	private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ResourceBundle rb = ResourceBundle.getBundle("config");
		String uploadPath = rb.getString("uploads.path");
		String encryptedPath = rb.getString("encrypted.path");

		HttpSession session = request.getSession();
		int id = 0;
		String server = null;

		if (!ServletFileUpload.isMultipartContent(request)) {
			// if not, we stop here
			PrintWriter writer = response.getWriter();
			writer.println("Error: Form must has enctype=multipart/form-data.");
			writer.flush();
			return;
		}

		String username = (String) session.getAttribute("username");

		DiskFileItemFactory factory = new DiskFileItemFactory();
		// sets memory threshold - beyond which files are stored in disk
		factory.setSizeThreshold(MEMORY_THRESHOLD);
		// sets temporary location to store files
		factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

		ServletFileUpload upload = new ServletFileUpload(factory);

		// sets maximum size of upload file
		upload.setFileSizeMax(MAX_FILE_SIZE);

		// sets maximum size of request (include file + form data)
		upload.setSizeMax(MAX_REQUEST_SIZE);

		// constructs the directory path to store upload file
		// this path is relative to application's directory
		// String uploadPath = getServletContext().getRealPath("") +
		// File.separator + UPLOAD_DIRECTORY;

		// creates the directory if it does not exist
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			System.out.println(uploadDir.mkdir());
		}

		try {
			// parses the request's content to extract file data
			@SuppressWarnings("unchecked")
			List<FileItem> formItems = upload.parseRequest(request);

			if (formItems != null && formItems.size() > 0) {
				// iterates over form's fields
				for (FileItem item : formItems) {

					if (item.getString().contains("CS1") || item.getString().contains("CS2")
							|| item.getString().contains("CS3")) {
						server = item.getString();
						System.out.println("Cloud server = " + item.getString());
					}

					if (item.getFieldName().equalsIgnoreCase("ownerid")) {
						id = Integer.valueOf(item.getString());
					}
					// processes only fields that are not form fields
					if (!item.isFormField()) {
						String fileName = new File(item.getName()).getName();
						// String cat1=item.getString() ;
						String filePath = uploadPath + File.separator + fileName;
						File storeFile = new File(filePath);
						item.write(storeFile);

						FileInputStream fis1 = new FileInputStream(storeFile);
						byte bs1[] = new byte[fis1.available()];
						fis1.read(bs1);
						String content = new String(bs1);
						int hashCode = content.hashCode();

						// Write Encrypt file
						filePath = encryptedPath + UtillMegainfo.trimExtension(fileName) + ".des";
						FileEncryptionContent fileEncObj = new FileEncryptionContent();
						fileEncObj.fileUploadEnc(content, filePath);
						System.out.println("File Encrypt success");

						AESUtility obj = new AESUtility();
						content = obj.encrypt(content);
						// Encrypt file ends

						boolean filestatus = validateFile(hashCode, server, id, content);
						if (!filestatus) {
							String hKey = String.valueOf((String.valueOf(hashCode)).hashCode());
							Statement st = DB.stmt();
							String query = "insert into filedetails(filename,filekey,hashkey,userid,server,content) values('"
									+ fileName + "','" + hKey + "','" + hashCode
									+ "',(select uid from dataowner where uname='" + username + "' ),'" + server + "','"
									+ content + "')";
							int x = st.executeUpdate(query);

							if (x == 1) {
								System.out.println("Insert Success ");
								request.setAttribute("message", ": File Uploaded Success");
								RequestDispatcher rd = request.getRequestDispatcher("uploadFile.jsp");
								rd.forward(request, response);
							}
						} else {
							request.setAttribute("message", ": File Exist");
							RequestDispatcher rd = request.getRequestDispatcher("uploadFile.jsp");
							rd.forward(request, response);						}
					}
				}
			}
			// }
		} catch (Exception ex) {
			request.setAttribute("message", "There was an error: " + ex.getMessage());
		}
		//request.getRequestDispatcher("/uploadFile.jsp").forward(request, response);

	}

	public boolean validateFile(int hashcode, String server, int id, String contentInput) {
		boolean status = false;
		try {
			Statement stmt = DB.stmt();
			String sql = "select * from filedetails";
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				String cloud = rs.getString(6);
				System.out.println("DB cloud " + cloud);
				String content = rs.getString(7);
				System.out.println("DB content " + content);
				int ownerId = rs.getInt(5);
				System.out.println("DB ownerId " + ownerId);

				if (content.equals(contentInput) && cloud.equalsIgnoreCase(server) && ownerId == id) {
					status = true;
					break;
				}
			}
		} catch (Exception e) {
		}
		return status;
	}
}