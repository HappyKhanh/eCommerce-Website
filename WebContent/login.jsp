<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/styleSheet.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body class="login">
    <img id="login-logo" src="${pageContext.request.contextPath}/resource/logo.png" >
    <form action="/PRJ321x_A3/login" method="post" >
        <div class="form-group" >
            <label for="username"><b>Username</b></label>
            <input type="text" class="form-control" id="username" placeholder="Enter Username" name="username" value="<%= session.getAttribute("user") %>">
            <label for="password"><b>Password </b></label>
            <input type="text" class="form-control" id="password" placeholder="Enter Password" name="password">
        </div>
        <h3 id="login-error"><%= session.getAttribute("error")%> </h3>
        <button id="button" class="form-control btn btn-success" type="submit" class="btn btn-primary">Login</button>
        
    </form>
</body>
</html>