

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
	<%@include file="crimemenu.jsp"%>
	<div style="height: 60px;"></div>
	<%
		if (request.getParameter("rights") != null) {
			out.println("<script>alert('Updated...')</script>");
		}
	%>
	<%
		String user = session.getAttribute("crime").toString();
		System.out.println(user);
	%><h1 align="center">
		Welcome To
		<%=user%>
		<div id="site_content">

			<%
				ResultSet rt = Dbconn.getConnection().createStatement().executeQuery("select * from malicious_admin");
			%>
			<form action="" method="get">
				<table class="hovertable" align="center">
					<tr>
						<th colspan="6">Users Details</th>
					</tr>
					<tr
						style="background-color: #999999; font-size: 18px; font-family: monospace; font-weight: bold;">
						<td style="text-align: center">sno</td>
						<td style="text-align: center">ipdtls</td>
						<td style="text-align: center">message</td>
						<td style="text-align: center">username</td>


					</tr>
					<%
						while (rt.next()) {
							String sno = rt.getString("sno");
							String ipdtls = rt.getString("ipdtls");
							String message = rt.getString("message");
							String username = rt.getString("username");
					%>
					<TR>
						<%-- <td><img alt="" src="./Gallery/=<%=img%>"></td> --%>
						<td><%=sno%></td>
						<td><%=ipdtls%></td>
						<td><%=message%></td>
						<td><%=username%></td>



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
