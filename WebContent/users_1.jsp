

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
			ResultSet rt = Dbconn.getConnection().createStatement()
					.executeQuery("select * from user order by accept asc");
		%>
		<form action="" method="get">
			<table class="hovertable" align="center">
				<tr>
					<th colspan="5">Users Details</th>
				</tr>
				<tr
					style="background-color: #999999; font-size: 18px; font-family: monospace; font-weight: bold;">
					<td style="text-align: center">ID</td>
					<td style="text-align: center">USERNAME</td>
					<td style="text-align: center">PASSWORD</td>
					<td style="text-align: center">STATUS</td>
					<td style="text-align: center">ACCEPTANCE</td>

				</tr>
				<%
					while (rt.next()) {
						String uname = rt.getString("username");
						String mail = rt.getString("password");
						String id = rt.getString("id");
						String status = rt.getString("accept");
				%>
				<TR>
					<td style="text-align: center"><%=id%></td>
					<td style="text-align: center"><%=uname%></td>
					<td style="text-align: center">****</td>

					<td style="text-align: center"><%=status%></td>
					<%
						if (status.equalsIgnoreCase("no")) {
					%>
					<td><a href="activate.jsp?<%=uname%>">Activate</a></td>
					<%
						} else {
					%>

					<td><a href="deativate.jsp?<%=uname%>">Deactivate</a></td>
					<%
						}
					%>
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
