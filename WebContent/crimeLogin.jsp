
<%@page import="java.sql.ResultSet"%>
<%@page import="com.google.Dbconn"%>
<%@page import="java.sql.Statement"%>
<%@ page import="java.util.Date"%>
<%
	String username = request.getParameter("userid");
	System.out.println(username);
	String Password = request.getParameter("pass");
	System.out.println(Password);
	HttpSession session3 = request.getSession(true);
	session.setAttribute("crime", username);
	
	try {
		if (username.equalsIgnoreCase("crime")) {
			application.setAttribute("user", username);
			String sql = "SELECT * FROM crime where username='" + username + "' and password='" + Password
					+ "'";
			Statement stmt = Dbconn.getConnection().createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			String utype = "";
			if (rs.next()) {

				response.sendRedirect("CrimeMain.jsp");
			} else {
				response.sendRedirect("LoginFail.jsp");
			}
		} else {
			application.setAttribute("uname", username);
			String sql = "SELECT * FROM user where username='" + username + "' and password='" + Password + "'";
			Statement stmt = Dbconn.getConnection().createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			String utype = "";
			if (rs.next()) {

				int i = rs.getInt(1);
				application.setAttribute("uid", i);
				response.sendRedirect("UserMain.jsp");
			} else {
				response.sendRedirect("LoginFail.jsp");
			}
		}
	} catch (Exception e) {
		out.print(e);
	}
%>