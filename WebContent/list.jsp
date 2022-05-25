<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/styleSheet.css">
<link href="https://fonts.googleapis.com/css2?family=Hurricane&family=Inspiration&family=Open+Sans:ital,wght@0,300;0,800;1,300&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
</head>
<body>
	<%@include file="header.jsp"%>
	<div id="content">
	<div class="row">
	<c:forEach items="${products}" var="p">
	<div class=" col-sm-12 col-md-4 col-lg-3">
	<div  class="phoneDiv">
		<a href="http://localhost:8080/PRJ321x_A3//InformationProductController?id=<c:out value="${p.id}"/>"><img id="list-image" src="<c:out value="${p.src}" />" alt="<c:out value="${p.type}" />" /></a>
		<p style="text-transform: uppercase;"><c:out value="${p.type}" /></p>
		<p style="font-weight:bold; "><c:out value="${p.name}" /></p>
		<p style="color:red;" >$<c:out value="${p.price}" /></p>
		</div>
		</div>
	</c:forEach>
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