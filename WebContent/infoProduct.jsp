<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Information</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resource/styleSheet.css">
<link
	href="https://fonts.googleapis.com/css2?family=Hurricane&family=Inspiration&family=Open+Sans:ital,wght@0,300;0,800;1,300&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
</head>
<body>
	<%@include file="header.jsp"%>
	<div id="content">
			<h2 style="padding-left: 20px;"> <c:out value="${product.name}" /></h2>
			<hr>
			<div class="row">
				<div class="col-sm-12 col-md-4">
					<img style="width: 400px;" src="<c:out value="${product.src}" />"
						alt="<c:out value="${p.name}" />" />
				</div>
					<div id="phone-info" class="col-sm-12 col-md-3">
				<h2 style="color: red; margin-top: 10px;">
					<c:out value="${product.price}" />0.000 VND
				</h2>
				<b>Product Description:</b>
				<c:out value="${product.description}" />
				<form action="/PRJ321x_A3/AddToCartController" method="post">
					<input type="hidden" name="action" value="add" /> <input
						type="hidden" name="id" value="<c:out value="${product.id}"/>" />
					<input class="btn btn-success" type="submit" value="Add to cart" />
				</form>
			</div>
		

		</div>
	</div>
	<%@include file="footer.jsp"%>
	<!-- 	private int id;
	private String name;
	private String description;
	private float price;
	private String src;
	private String type;
	private String brand; -->
</body>
</html>