package com.mega.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 * @author Pramod
 *
 */
public class DB {
	static Connection con;
	static Statement stmt;
	static String DB_URL = "jdbc:mysql://Localhost/identitybased";
	static String USER = "root";
	static String PASS = "";

	public static Connection con() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(DB_URL, USER, PASS);
			return con;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

	public static Statement stmt() {
		try {
			stmt = DB.con().createStatement();
			return stmt;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

	public static int getUserId(String uname) {
		try {
			stmt = DB.con().createStatement();
			ResultSet rst = stmt.executeQuery("select uid from userdetails where username='" + uname + "' ");
			if (rst.next()) {
				int id = rst.getInt(1);
				return id;
			}
		} catch (Exception e) {
			System.out.println(e);
			return 0;
		}
		return 0;
	}

	public static boolean checkingStatus(int rid) {
		try {
			stmt = DB.con().createStatement();
			ResultSet rst = stmt.executeQuery("select * from requeststatus where rid=" + rid + "");
			if (rst.next()) {
				String spstatus = rst.getString("spstatus");
				String dostatus = rst.getString("dostatus");
				String auditingstaus = rst.getString("auditingstaus");
				if (spstatus.equals("accept") && dostatus.equals("accept") && auditingstaus.equals("accept")) {
					return true;
				} else {
					return false;
				}
			}
		} catch (Exception e) {
			System.out.println(e);
			return false;
		}
		return false;
	}

}