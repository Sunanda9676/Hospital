<%@include file="Header.jsp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>::OSMD::</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" href="layout/styles/layout.css" type="text/css" />
<script type="text/javascript" src="layout/scripts/jquery.min.js"></script>
<!-- liteAccordion is Homepage Only -->
<link rel="stylesheet"
	href="layout/scripts/liteaccordion-v2.2/css/liteaccordion.css"
	type="text/css" />
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script src="autocompleter.js"></script>
<script src="Scripts/jquery-1.7.1.js"></script>

<!-- <script type="text/javascript">
	window.onbeforeunload = function() {
		return "You work will be lost.";
	};
</script> -->
<head>
  <script>
      history.forward();
   </script>
</head> 
</head>
<body onUnload="noBack()">
	
	<div class="wrapper row2">
		<div id="topnav">
			<ul>
				<li class="active"><a href="index.jsp">Home</a></li>
				<li><a href="userRegister.jsp">Register</a></li>
				<li><a href="Login.jsp">login</a></li>
				<li><a href="adminLogin.jsp">Admin Login</a></li>
				<li><a href="crime.jsp">E- Crime</a></li>
			</ul>
			<div class="clear"></div>
		</div>
	</div>
	</form>
	<div class="wrapper row3">
		<div id="featured_slide">
			<ol>
				<li>
					<h2>
						<span>Slide 1</span>
					</h2>
					<div>
						<img src="images/1.jpg" alt="" />
					</div>
				</li>
				<li>
					<h2>
						<span>Slide 2</span>
					</h2>
					<div>
						<img src="images/2.jpg" alt="" />
					</div>
				</li>
				<li>
					<h2>
						<span>Slide 3</span>
					</h2>
					<div>
						<img src="images/3.jpg" alt="" />
					</div>
				</li>
				<li>
					<h2>
						<span>Slide 4</span>
					</h2>
					<div>
						<img src="images/4.jpg" alt="" />
					</div>
				</li>
				<li>
					<h2>
						<span>Slide 5</span>
					</h2>
					<div>
						<img src="images/5.jpg" alt="" />
					</div>
				</li>
			</ol>
		</div>
	</div>
	<div class="wrapper row4">
		<div id="container" class="clear"></div>
	</div>
	<div align="center"
		style="color: white; background-color: #104E8B; height: 40px">
		All Rights @Reserved For College</div>
	<script type="text/javascript"
		src="layout/scripts/liteaccordion-v2.2/js/liteaccordion.jquery.min.js"></script>
	<script type="text/javascript">
		$("#featured_slide").liteAccordion({
			theme : "os-tpl",
			containerWidth : 960, // fixed (px)
			containerHeight : 360, // fixed (px) - overall height of the slider
			headerWidth : 48, // fixed (px) - slide spine title
			firstSlide : 1, // displays slide (n) on page load
			activateOn : "click", // click or mouseover
			autoPlay : true, // automatically cycle through slides
			pauseOnHover : true, // pause slides on hover
			rounded : false, // square or rounded corners
			enumerateSlides : true, // put numbers on slides
			slideSpeed : 800, // slide animation speed
			cycleSpeed : 2000, // time between slide cycles
		});
	</script>

</body>
</html>