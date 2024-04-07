
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.io.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>OSMD</title>
</head>
<body>
	<%
		Blob image = null;

		byte[] imgData = null;
		//String w=request.getQueryString();

		String a = request.getQueryString();
		System.out.println(a);
		int id = Integer.parseInt(request.getParameter("uid"));

		System.out.println("gekki check this value" + id);

		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project2", "root", "root");
			Statement st = con.createStatement();
			String strQuery = "select image from user where id=" + id + "";
			// String strQuery = "select imagew from image where id=+id ORDER BY ";
			ResultSet rs = st.executeQuery(strQuery);
			while (rs.next()) {

				image = rs.getBlob(1);

				imgData = image.getBytes(1, (int) image.length());

			}

			response.setContentType("image/jpeg");

			OutputStream fid1 = response.getOutputStream();

			fid1.write(imgData);

			fid1.flush();

			fid1.close();

		} catch (Exception e) {

			out.println("Unable To Display image");

			out.println("Image Display Error=" + e.getMessage());

			return;

		}
	%>

</body>
</html>
