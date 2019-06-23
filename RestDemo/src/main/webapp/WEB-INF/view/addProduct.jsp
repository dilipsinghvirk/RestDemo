<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Product</title>
</head>
<body>
	<div id="addProdDiv">
		<form action="/addProduct" method="post">
			<table border="1" style="color: gray">
				<tr>
					<td>Product Id:</td>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<td>ProductName:</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td><input type="submit" value="Add Product"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>