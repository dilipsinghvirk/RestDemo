<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home Page</title>
</head>
<body>

	<div id="tabDiv">
	<a href="/addproduct">Add Prodcut</a>
	</div>
	<div id="productDiv">
		<h2>Product List</h2>
		<table id="countTable" border="2">
			<thead>
				<th scope="row">Product_Id</th>
				<th scope="row">Product_Name</th>
				<th scope="row">Action Edit</th>
				<th scope="row">Action Delete</th>
			</thead>
			<tbody>
				<c:forEach var="prod" items="${productList}" >
					<tr>
						<td>${prod.id}</td>
						<td>${prod.name}</td>
						<td><a href="/edit/${prod.id}" />Edit</td>
						<td><a href="/delete/${prod.id}"/>Delete</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div><hr>
</body>
</html>