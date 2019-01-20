/**
 * 
 */
package com.megainfo.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

public class FileEncryptionContent {

	public String fileUpload(String content, String outputPath) throws Exception {
		String uploadStatus = "";

		// Upload file
		File file = new File(outputPath);
		try (FileOutputStream fop = new FileOutputStream(file)) {
			// if file doesn't exists, then create it
			if (!file.exists()) {
				file.createNewFile();
			}
			// get the content in bytes
			byte[] contentInBytes = content.getBytes();

			fop.write(contentInBytes);
			uploadStatus = "success";
			fop.flush();
			fop.close();

			System.out.println("Done");

		} catch (IOException e) {
			uploadStatus = "fail";
			e.printStackTrace();
		}
		return uploadStatus;
	}

	public String fileUploadEnc(String content, String outputPath) throws Exception {
		String uploadStatus = "";
		// Encrypt data
		AESUtility obj = new AESUtility();
		content = obj.encrypt(content);

		// Upload file
		File file = new File(outputPath);
		try (FileOutputStream fop = new FileOutputStream(file)) {
			// if file doesn't exists, then create it
			if (!file.exists()) {
				file.createNewFile();
			}
			// get the content in bytes
			byte[] contentInBytes = content.getBytes();

			fop.write(contentInBytes);
			uploadStatus = "success";
			fop.flush();
			fop.close();

			System.out.println("Done");

		} catch (IOException e) {
			uploadStatus = "fail";
			e.printStackTrace();
		}
		return uploadStatus;
	}

	public static void main(String[] args) throws Exception {
		FileEncryptionContent fileEncObj = new FileEncryptionContent();
		fileEncObj.fileUpload("ramesh testing", "C:/DEV/bin/aspect/cloud_computing/WebContent/downloads/c.txt");
		//fileEncObj.fileUploadEnc("ramesh testing", "C:/IOFILES/test1.des");
		System.out.println("Success");
	}
}