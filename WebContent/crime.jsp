<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script src="autocompleter1.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<!-- User defied css -->
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="cssmenu/styles.css">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js">
	
</script>
<script type="text/javascript" src="jquery.simplyscroll.js"></script>
<link rel="stylesheet" href="jquery.simplyscroll.css" media="all"
	type="text/css">

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js">
	
</script>
<!--<script type="text/javascript" src="/js/common.js"></script>-->
<script type="text/javascript" src="js/jquery.simplyscroll.js"></script>
<link rel="stylesheet" href="css/jquery.simplyscroll.css" media="all"
	type="text/css">
</script>
<script type="text/javascript">
	function reg() {
		var a = document.f2.username.value;
		if (a == "") {
			alert("Enter for Search");
			document.f2.username.focus();
			return false;
		}
	}
</script>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script src="autocompleter1.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<!-- User defied css -->
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="cssmenu/styles.css">
<script type="text/javascript">
	//Date Time Picker script- by TengYong Ng of http://www.rainforestnet.com
	//Script featured on JavaScript Kit (http://www.javascriptkit.com)
	//For this script, visit http://www.javascriptkit.com
</script>
</head>
<body>
	<br>
	<br>
<title>OSMD</title>
<script type="text/javascript">
	function validation() {
		var userid = document.form.userid.value;

		var pass = document.form.pass.value;
		if (userid == null || userid == "") {
			alert("Name is Mandatory");
			return false;
		}
		if (pass == null || pass == "") {
			alert("PassWord is Mandatory");
			return false;
		}
	}
</script>
<head>
  <script>
      history.forward();
   </script>
</head> 
</head>
<body>
	<%@include file="Header.jsp"%>
	<%@include file="menu1.jsp"%>
	<div align="center"
		style="color: royalblue; background-color: #DCDCDC; min-height: 460px">
		<br>
		<h2>
			<img src="images/login-here-button.png">
		</h2>
		<form action="crimeLogin.jsp" method="post" name="form"
			onsubmit="return validation() ">
			<table cellpadding="7">
				<tr>
					<td>User Name:</td>
					<td><input type="text" name="userid" autofocus="autofocus"
						placeholder="Enter User Name Here" id="search"></td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><input type="password" name="pass" autofocus="autofocus"
						placeholder="Enter User PassWord Here"></td>
				</tr>

				<tr>
					<td align="center" colspan="2"><input type="submit"
						value="Submit"
						style="padding: 5px; width: 140px; background-color: #00aeef; border-radius: 8px; color: white">
						&nbsp;&nbsp;&nbsp;&nbsp; <input type="Reset" value="Clear"
						style="padding: 5px; width: 140px; background-color: #00aeef; border-radius: 8px; color: white">


					</td>
				</tr>

			</table>
		</form>
		<br>
	</div>
	<%@include file="Footer.jsp"%>
</html>
