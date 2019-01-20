package com.upload;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.ResourceBundle;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mega.database.DB;
import com.megainfo.queries.QueryHelper;
import com.megainfo.random.RandomNumberGenerator;
import com.megainfo.util.FileDecryptionContent;
import com.megainfo.util.FileEncryptionContent;
import com.megainfo.util.UtillMegainfo;

/**
 * Servlet implementation class DownloadFile
 */
public class DownloadFile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DownloadFile() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ResourceBundle rb = ResourceBundle.getBundle("config");
		String encryptedPath = rb.getString("encrypted.path");
		String downloadPath = rb.getString("downloads.path");

		response.getWriter().append("Served at: ").append(request.getContextPath());
		String filename = request.getParameter("filename");
		String filekey = request.getParameter("filekey");

		// Validate key from Database

		boolean flag = false;
		String fileId;
		ResultSet rs1;
		try {
			rs1 = DB.stmt().executeQuery("SELECT * FROM FILEDETAILS WHERE FILENAME = '" + filename + "'");
			while (rs1.next()) {
				String fkey = rs1.getString(3);
				if (fkey.equals(filekey)) {
					fileId = rs1.getString(1);
					System.out.println("FileId db " + fileId);
					flag = true;
					break;
				}
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		}

		// Validate key from Database ends

		FileDecryptionContent obj = new FileDecryptionContent();
		String fileContent = "";

		if (flag) {
			try {
				System.out.println("Valid Key ");

				String path = encryptedPath + UtillMegainfo.trimExtension(filename) + ".des";
				System.out.println("Path " + path);
				fileContent = obj.fileDownload(path);
				System.out.println("fileContent " + fileContent);
				if (!fileContent.isEmpty()) {
					FileEncryptionContent fileEncObj = new FileEncryptionContent();
					fileEncObj.fileUpload(fileContent, downloadPath + filename);
					System.out.println("File Download Success");
					request.setAttribute("message", ": Download  Success at : '" + downloadPath + filename + "'");
					RequestDispatcher rd = request.getRequestDispatcher("downloadfile.jsp");
					rd.forward(request, response);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			System.out.println("In Valid Key ");
			String newkey = RandomNumberGenerator.getRSAKey();

			String query = "UPDATE FILEDETAILS SET FILEKEY = '" + newkey + "' WHERE FILENAME='" + filename + "'";
			try {
				int x = DB.stmt().executeUpdate(query);
				System.out.println("Key Updated " + x);

			} catch (SQLException e) {
				e.printStackTrace();
			}

			request.setAttribute("message", ": Wrong Key");
			RequestDispatcher rd = request.getRequestDispatcher("downloadfile.jsp");
			rd.forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
