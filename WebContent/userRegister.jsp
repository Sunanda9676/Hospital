
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<title>OSMD</title>
<script type="text/javascript">
	function validateForm() {
		var userid = document.form.userid.value;
		var pass = document.form.pass.value;
		var email = document.form.email.value;

		var dob = document.form.dob.value;
		var gender = document.form.gender.value;
		var pincode = document.form.pincode.value;
		var location = document.form.location.value;
		var pic = document.form.pic.value;

		letters = /^([a-zA-Z0-9])+$/
		exp = /[a-zA-Z0-9_.]/;
		pattern1 = /^[0-9]/;
		pattern2 = /[a-zA-Z0-9_.]+@[a-zA-Z]+([.][a-zA-Z])+/;

		if (userid == null || userid == "") {
			alert("Name is Mandatory");
			return false;
		}
		if (pass == null || pass == "") {
			alert("PassWord is Mandatory");
			return false;
		}
		if (email == null || email == "") {
			alert("Email-Id Filed is Mandatory");
			document.form.email.focus();
			return false;
		} else if (pattern2.test(email)) {
		} else {
			alert("Enter a Valid Email Id");
			window.document.form.email.value = "";
			window.document.form.email.focus();
			return false;
		}
		if (dob == null || dob == "") {
			alert("Dob is Mandatory");
			return false;
		}
		if (gender == null || gender == "") {
			alert("Gender is Mandatory");
			return false;
		}
		if (pincode == null || pincode == "") {
			alert("Pincode is Mandatory");
			return false;
		}
		if (location == null || location == "") {
			alert("Location is Mandatory");
			return false;
		}
		if (pic == null || pic == "") {
			alert("Picture is Mandatory");
			return false;
		}
	}
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#gimg1").hide();
		$("#rimg1").hide();
	});

	function checkduplicateid1() {
		var mail = document.getElementById('mail').value;
		$.ajax({
			url : "DuplilcateMail?mail=" + mail,
			success : function(data) {
				if (data.trim() != "Proceed") {
					alert("mail--> " + mail + " already exist");
					$("#rimg1").show(1000);
					$("#gimg1").hide();
					document.getElementById('mail').value = "";
					return false;
				} else {
					$("#gimg1").show(1000);
					$("#rimg1").hide();
				}
			}

		});
	}
</script>
</head>
<body>
	<%@include file="Header.jsp"%>
	<%@include file="menu1.jsp"%>
	<div align="center"
		style="color: royalblue; background-color: #DCDCDC; min-height: 460px">
		<br>
		<h2>
			<img src="images/register_now.png" height="120px" width="400px">
		</h2>
		<form action="UserRegServlet" method="post" name="form"
			onsubmit="return validateForm()" enctype="multipart/form-data">
			<table class="button alt" align="center">
				<tr>
					<td>User Name</td>
					<td><input type="text" name="userid" autofocus tabindex="-1" placeholder="Enter User Name Here"></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="password" name="pass" autofocus placeholder="Enter PassWord Here"></td>
				</tr>
				<tr>
					<td>Email Address</td>
					<td><div>
							<input type="text" name="email" id="mail" autofocus placeholder="Enter Mail Here"
								onblur="return checkduplicateid1()"><img id='gimg1'
								src="images/green-checkmark.png" height="20px" width="30px">
							<img id='rimg1' src="images/wrong.gif" height="20px" width="30px">
						</div></td>
				</tr>

				<tr>
					<td>Date of Birth</td>
					<td><input type="date" name="dob" ></td>
				</tr>
				<tr>
					<td>Select Gender</td>
					<td><select name="gender">
							<option value="select">--Select--</option>
							<option value="Male">MALE</option>
							<option value="FeMale">FEMALE</option>
					</select></td>
				</tr>
				<tr>
					<td>Enter Pincode</td>
					<td><input type="text" name="pincode" autofocus placeholder="Enter Pincode Here" ></td>
				</tr>
				<tr>
					<td>Enter Location</td>
					<td><input type="text" name="location" autofocus placeholder="Enter Location Here"></td>
				</tr>
				<tr>
					<td>Select Profile</td>
					<td><input type="file" name="pic"></td>
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
