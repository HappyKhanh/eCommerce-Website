<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	background-image: url('https://cdn.crunchify.com/bg.png');
}
</style>
</head>
<body>

	     <a href="/PRJ321x_A3/Logout" style="float:right"> Log Out</a>
    <br>
	<div style="text-align: center">
		<h2>
			Xin chào admin <%=session.getAttribute("user") %>! <br>
		</h2>
		</div>
</body>
</html>