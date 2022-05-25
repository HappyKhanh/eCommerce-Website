    <div class="header">
        <h1 style="font-family: 'Inspiration', cursive; font-weight:bold;">My website</h1>
        <img id="logo-img" src="${pageContext.request.contextPath}/resource/logo.png">
    </div>
    
    <div class="topnav">
        <a href="/PRJ321x_A3/">Home</a>
        <a href="#">Product</a>
        <a href="#">About us</a>
        <a href="#" style="float:right"> Register</a>
        <a href="/PRJ321x_A3/login" style="float:right"> Login</a>
        <form action="/PRJ321x_A3/SearchController2" method="post">
        <input name ="s" id="input" type ="text" />
        <input id="submit" type="submit" value="Search" />
        </form>
    </div>