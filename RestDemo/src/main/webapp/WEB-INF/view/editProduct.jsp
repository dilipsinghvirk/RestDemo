<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Product</title>
</head>
<body>
	<div>
		<form action="/edit" >
		<c:if test="${ editProduct!=null}">
			<table>
			
				<tr>
					<td>ProductId:</td>
					<td><input value='<c:out value="${editProduct.id}"></c:out>' readonly="readonly" name="id">
				</tr>
				<tr>
					<td>ProductName:</td>
					<td><input type="text" value='<c:out value="${editProduct.name}"></c:out>'  name="name"></td>
				</tr>
				<tr>
					<td><input type="submit" value="Edit"></td>
				</tr>
			</table>
			</c:if>
		</form>
	</div>
</body>
</html>