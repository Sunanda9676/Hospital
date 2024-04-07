

<%@page import="com.google.Dbconn"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style type="text/css">
table.hovertable {
	font-family: verdana, arial, sans-serif;
	font-size: 11px;
	color: #333333;
	border-width: 1px;
	border-color: #999999;
	border-collapse: collapse;
}

table.hovertable th {
	background-color: #c3dde0;
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #a9c6c9;
}

table.hovertable tr {
	background-color: #d4e3e5;
}

table.hovertable td {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #a9c6c9;
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>OSMD</title>
</head>
<body>
	<%@include file="Header.jsp"%>
	<%@include file="adminmenu.jsp"%>
	<div style="height: 60px;"></div>
	<%
		if (request.getParameter("rights") != null) {
			out.println("<script>alert('Updated...')</script>");
		}
	%>
	<%
		String user = session.getAttribute("admin").toString();
		System.out.println(user);
	%>
	<h1 align="center">
		Welcome To
		<%=user%>
	</h1>
	<div id="site_content">

		<%
			ResultSet rt = Dbconn.getConnection().createStatement().executeQuery("select * from user");
		%>
		<form action="" method="get">
			<table class="hovertable" align="center">
				<tr>
					<th colspan="6">Users Details</th>
				</tr>
				<tr
					style="background-color: #999999; font-size: 18px; font-family: monospace; font-weight: bold;">
					<td style="text-align: center">IMAGE</td>
					<td style="text-align: center">USERNAME</td>
					<td style="text-align: center">E-Mail</td>
					<td style="text-align: center">PassWord</td>
					<td style="text-align: center">Gender</td>
					<td style="text-align: center">Date OfBirth</td>

				</tr>
				<%
					while (rt.next()) {
					int	i = rt.getInt(1);
						String username = rt.getString("username");
						String email = rt.getString("email");
						String password = rt.getString("password");
						String gender = rt.getString("gender");
						String dob = rt.getString("dob");
				%>
				<tr>
					<td width="100" rowspan="9">
						<div style="margin: 10px 13px 10px 13px;">
							<a class="#" id="img1" href="#"> <input name="image"
								type="image" src="profilepic_image.jsp?uid=<%=i%>"
								style="width: 100px; height: 100px;" />
							</a>
						</div>
					</td>
				</tr>
				<TR>
					<%-- <td><img alt="" src="./Gallery/=<%=img%>"></td> --%>
					<%-- <td><%=id%></td> --%>
					<td><%=username%></td>
					<td><%=email%></td>
					<td><%=password%></td>
					<td><%=gender%></td>
					<td><%=dob%></td>


				</TR>
				<%
					}
				%>
			</table>
			<div style="height: 220px;"></div>
		</form>
			<meta http-equiv="refresh" content="15;url=./index.jsp">
		<%@include file="Footer.jsp"%>
</html>
