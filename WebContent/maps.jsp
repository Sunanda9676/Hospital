

<%@page import="com.google.Dbconn"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>OSMD</title>
</head>
<body>
	<%@include file="Header.jsp"%>
	<%@include file="crimemenu.jsp"%>
	<%
		String user = session.getAttribute("crime").toString();
		System.out.println(user);
	%><h1 align="center">
		Welcome To
		<%=user%>
		<div style="height: 220px;"></div>
	<meta http-equiv="refresh" content="15;url=./index.jsp">
		<%@include file="Footer.jsp"%>
</html>
