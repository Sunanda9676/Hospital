
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>OSMD</title>
<style>
a {
	font-size: 18px;
	text-decoration: none;
}

a:hover {
	color: red;
}
</style>
</head>
<body>
	<div style="background-color: yellow; color: #104E8B">

		<%-- <%
			String uname = session.getAttribute("uname1").toString();
			System.out.println(uname);
		%> --%>
		<table width="100%">
			<tr>
				<td><a href="UserProfile.jsp">My Profile</a></td>
				<td><a href="maliciousUsers.jsp">Users Messages </a></td>
				<td><a href="AddPost.jsp<%-- ?uname=<%=uname%> --%>">Add Post</a></td>
				<td><a href="menu.html">Log Out</a></td>
			</tr>
		</table>
	</div>
</body>
</html>
