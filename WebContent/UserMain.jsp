<jsp:include page="Header.jsp"></jsp:include>
<jsp:include page="usermenu.jsp"></jsp:include>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>OSMD</title>
</head>
<body>
	<%
		String user = session.getAttribute("user").toString();
	%>

	<div align="center"
		style="color: white; background-color: #DCDCDC; min-height: 460px">
		<br>
		<h1 align="center">
			Welcome To
			<%=user%>
		</h1>
		<table>
			<tr align="center">
				<td><img src="images/searchlogo.png" height="200px"
					width="300px"></td>
				<td><img src="images/google-maps-pointer.png" height="200px"
					width="300px"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><img
					src="images/lab_voorgrond.png" height="300px" width="500px"></td>

			</tr>
		</table>
		<br>
	</div>
	<meta http-equiv="refresh" content="15;url=./menu.html">
	<%@include file="Footer.jsp"%>
</html>
