<%@page import="java.io.InputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script src="autocompleter.js"></script>

<script type="text/javascript">
function toggle(dd) {
	alert("jjj"+dd);
	document.getElementById('actFb').submit();
}


function OnSubmitForm(itemVal)
{
  if(document.getElementById('search').value=="s")
  {
    document.myform.action ="insert.html";
  }
  else
  if(document.myform.operation[1].checked == true)
  {
    document.myform.action ="update.html";
  }
  return true;
}




</script>

</head>
<body>
<form action="SearchController" id="actFb" onsubmit="return OnSubmitForm();">
	<div id='cssmenu'>
		<ul>
			
			<div id='cssmenu' style="float: right;">
				<ul>
					<li><a href='#' style="float: right;">Search Items</a></li>
					<li><a href='#'><input type="search" name="serch"
							id="search" size="50" onChange="toggle(this)"></a></li>
							<li><a href='#'><input type="submit" name="serch"
							 size="50"></a></li>
				</ul>
			
			</div>
		</ul>

	</div>
	</form>
	
</body>

</html>
