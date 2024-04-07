package com.google;

import java.sql.Connection;
import java.sql.DriverManager;

public class Dbconn {
	public static Connection connection = null;

	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/project2", "root", "Sunanda@123");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return connection;

	}
}
