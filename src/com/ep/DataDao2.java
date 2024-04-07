package com.ep;


import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.google.Dbconn;



public class DataDao2 {


	public DataDao2() throws Exception {

	}

	public ArrayList<String> getItems(String from) {
		ArrayList<String> list = new ArrayList<String>();
		Statement ps = null;
		String data;
		try {
			ps = Dbconn.getConnection().createStatement();
			String query = "SELECT * FROM admin WHERE username LIKE '" + from + "%' ";
			System.out.println(query);

			// ps.setString(1, from + "%");
			ResultSet rs = ps.executeQuery(query);
			while (rs.next()) {
				data = rs.getString("username");
				list.add(data);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return list;
	}
	

	
}
