package com.eazy.brush.dao.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Locale;
import java.util.ResourceBundle;

public class DbConn {

	private static ResourceBundle db = ResourceBundle.getBundle("db", Locale.getDefault());
	
	private static String url = db.getString("db.url");
	private static String user = db.getString("db.username");
	private static String pwd = db.getString("db.password");
	private static String driver = db.getString("db.driver");

	public static Connection getConn() {
		try {
			Class.forName(driver);
			return DriverManager.getConnection(url, user, pwd);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
