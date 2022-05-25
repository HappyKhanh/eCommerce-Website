<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart Review</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/styleSheet.css">
<link href="https://fonts.googleapis.com/css2?family=Hurricane&family=Inspiration&family=Open+Sans:ital,wght@0,300;0,800;1,300&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
</head>
<body>
		<%@include file="header.jsp"%>
		<div id="content">
	<table id="cart">
		<tr>
			<th class="col-sm-4">Products in cart</th>
			<th class="col-sm-2">Price</th>
			<th class="col-sm-2">Quantity</th>
			<th class="col-sm-2">Amount</th>
		</tr>
		<c:forEach items="${cart.items}" var="pd">
			<c:set scope="page" var="name" value="${pd.name}"></c:set>
			<c:set scope="page" var="id" value="${pd.id}"></c:set>
			<c:set scope="page" var="price" value="${pd.price}"></c:set>
			<c:set scope="page" var="number" value="${pd.number}"></c:set>
			<fmt:formatNumber var="amount" value="${pd.price*pd.number}" maxFractionDigits="2" />
			<tr>
				<td class="col-sm-4">${name}<br/>ID: ${id}</td>
				<td class="col-sm-2">${price}</td>
				<td class="col-sm-2">${number}</td>
				<td class="col-sm-2">${amount}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="4" style="text-align: right;">Total: ${total}</td>
		</tr>
	</table>	
	<div class="row">
	<form id="form" action="/PRJ321x_A3/PayController" method="post">
		<table>
		<tr>
		<td class="col-sm-3">Customer name</td> <td class="col-sm-4"><input style="width:100%;" name="name" type="text" value=""/></td>
		</tr>
		<tr>
		<td class="col-sm-3">Customer address</td> <td class="col-sm-4"><input style="width:100%;" name="address" type="text" value=""/></td>
		</tr>
		<tr>
		<td class="col-sm-3"> Discount code(if any)</td> <td class="col-sm-4"><input style="width:100%;" name="discount" type="text" value=""/></td>
		</tr>
		</table>
		<input style="margin-top: 20px;"class="btn btn-danger" type="submit" value="Submit"/>
	</form>
	</div>
	</div>
		<%@include file="footer.jsp"%>
</body>
</html>