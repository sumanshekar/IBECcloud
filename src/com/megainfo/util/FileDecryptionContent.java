/**
 * 
 */
package com.megainfo.util;

import java.io.FileReader;

public class FileDecryptionContent {
	public String fileDownload(String filePath) throws Exception {
		int len;
		char[] chr = new char[4096];
		final StringBuffer buffer = new StringBuffer();
		final FileReader reader = new FileReader(filePath);
		try {
			while ((len = reader.read(chr)) > 0) {
				buffer.append(chr, 0, len);
			}
		} finally {
			reader.close();
		}
		// Decrypt data
		AESUtility obj = new AESUtility();
		return obj.decrypt(buffer.toString());
	}

	public static void main(String[] args) throws Exception {

		FileDecryptionContent obj = new FileDecryptionContent();
		String fileContent = obj.fileDownload("C:/DEV/bin/aspect/cloud_computing/WebContent/encrypted/c.des");
		System.out.println("fileContent " + fileContent);

	}
}