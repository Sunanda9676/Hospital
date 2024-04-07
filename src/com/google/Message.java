package com.google;

import java.io.IOException;
import java.net.InetAddress;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/message")
public class Message extends HttpServlet {

	private static final long serialVersionUID = 1L;
	int i;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project2", "root", "root");
			String postType = request.getParameter("postType");
			HttpSession session = request.getSession();

			String ip = InetAddress.getLocalHost() + "";
			// String message = str;
			String userName = session.getAttribute("user").toString();
			if (postType.equals("Text")) {
				String str1 = request.getParameter("data");
				List<String> booleanstr = new ArrayList<String>();
				String str = str1;
				String[] temp;
				String delimiter = " ";
				temp = str.split(delimiter);
				Statement ps = con.createStatement();
				for (int i = 0; i < temp.length; i++) {
					System.out.println(temp[i]);
					String query = "select *  FROM  malicious where DETAILS='" + temp[i] + "'";
					System.out.println(query);
					ResultSet rs = ps.executeQuery("select *  FROM  malicious where DETAILS='" + temp[i] + "'");

					if (rs.next()) {
						booleanstr.add("true");
					} else {
						booleanstr.add("false");
					}

				}
				System.out.println("ListSize" + booleanstr.size());

				System.out.println("Liste" + booleanstr);

				boolean result = booleanstr.contains("true");
				System.out.println(result);
				// HttpSession session = request.getSession();

				// String ip = InetAddress.getLocalHost() + "";
				String message = str;
				// String userName =
				// session.getAttribute("userName").toString();
				String query;
				if (result) {

					query = "INSERT INTO malicious_admin (ipdtls,message,username) values (?,?,?) ";

				} else {

					query = "INSERT INTO malicious_user (ipdtls,message,username) values (?,?,?)";
				}

				PreparedStatement ps1 = con.prepareStatement(query);
				ps1.setString(1, ip);
				ps1.setString(2, message);
				ps1.setString(3, userName);

				i = ps1.executeUpdate();
				if (i > 0) {
					RequestDispatcher dispatcher = request.getRequestDispatcher("AddPost.jsp");
					dispatcher.forward(request, response);
				}

				else {
					RequestDispatcher dispatcher = request.getRequestDispatcher("/AddPost.jsp");
					dispatcher.forward(request, response);
				}

			} // end if

			/*
			 * else { List<String> booleanstr = new ArrayList<String>();
			 * 
			 * String str1 = request.getParameter("image"); String str2 =
			 * "D:/Old data/facebookimages/"; str2 = str2 + str1;
			 * System.out.println(str1); ResultSet rt = null;
			 * 
			 * Statement statement = con.createStatement(); rt =
			 * statement.executeQuery("select * from maliciouimages");
			 * System.out.println(rt); while (rt.next()) {
			 * 
			 * boolean s = new Compare().processImage(str2, rt.getString(2));
			 * booleanstr.add("" + s); System.out.println("Check It Them" + s);
			 * } boolean result = booleanstr.contains("true");
			 * 
			 * PreparedStatement ps = con .prepareStatement(
			 * "insert into ss(imagep,ip,Status,name)values(?,?,?,?)");
			 * ps.setString(1, str2); ps.setString(2, ip); if (result) {
			 * ps.setString(3, "Yes"); } else { ps.setString(3, "No"); }
			 * ps.setString(4, userName);
			 * 
			 * i=ps.executeUpdate();
			 * 
			 * System.out.println("what is boolean result:" + result); if (i >
			 * 0) { RequestDispatcher dispatcher =
			 * request.getRequestDispatcher("AddPost.jsp");
			 * dispatcher.forward(request, response); }
			 * 
			 * else { RequestDispatcher dispatcher =
			 * request.getRequestDispatcher("/AddPost.jsp");
			 * dispatcher.forward(request, response); }
			 */

		} catch (

		Exception e) {
			System.out.println(e);
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
	}
}