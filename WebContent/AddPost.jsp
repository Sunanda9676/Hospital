

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>OSMD</title>
</head>
<body>
	<%@include file="Header.jsp"%>
	<%@include file="usermenu.jsp"%>
	<%
		String user = session.getAttribute("user").toString();
	%>
	
	<div align="center"
		style="color: white; background-color: #DCDCDC; min-height: 460px">
		<div style="height: 120px;"></div>
		<h1 align="center">
		Welcome To
		<%=user%>
	</h1>
		<form action="message" method="post">

			<table>
				<tr>
					<td><input type="radio" name="postType" value="Text">Text
					</td>


					<!-- <td><input type="file" name="image" /></td> -->
				</tr>

				<tr>
					<td><b>Enter Message</b></td>
					<td><textarea rows="2" cols="30" name="data" required=""></textarea></td>
				</tr>
				<tr>
					<td><input type="submit" value="submit"></input></td>
				</tr>
			</table>

		</form>
		
	</div>
		<meta http-equiv="refresh" content="15;url=./index.jsp">
	<%@include file="Footer.jsp"%>
</html>
