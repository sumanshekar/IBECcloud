/**
 * 
 */
package com.megainfo.util;

/**
 * @author rkaruti
 *
 */
public class UtillMegainfo {

	/**
	 * @param args
	 */

	// Trim file extention
	public static String trimExtension(String fileName) {
		fileName = fileName.substring(0, fileName.lastIndexOf('.'));
		return fileName;
	}

	public static void main(String[] args) {
		UtillMegainfo um = new UtillMegainfo();
		String fileName = um.trimExtension("temp.txt");
		System.out.println("fileName " + fileName);
	}

}
