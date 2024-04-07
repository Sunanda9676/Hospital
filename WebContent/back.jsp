<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<script type = "text/javascript" >
window.history.forward();
function preventBack() { window.history.forward(1); }
//setTimeout("preventBack()", 0);
//window.onunload = function () { null };
</script>
<title>
</title>
</head>
<body onload="preventBack();" onpageshow="if (event.persisted) preventBack();" onunload="">
hello
<form id="form1" runat="server">
<div>
</div>
</form>
</body>
</html>