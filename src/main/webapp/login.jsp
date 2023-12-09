<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/3/2023
  Time: 11:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="css/login.css">
    <link rel="stylesheet" type="text/css" href="css/nologin.css">
</head>
<body>
<%
    session = request.getSession();
    Boolean isLogin = (Boolean) session.getAttribute("isLogin");
    if (isLogin != null && isLogin == true) {
%>
<div class="nologin">
    <span class="nologin__title" >oops!</span>
    <span class="nologin__detail"> You are logged in.</span>

</div>
<%
} else {
%>

<section class="login__container">
    <form onsubmit="return handleSubmit()" method="post" action="CheckLoginController" class="login">
            <span class="login__title">
                Login
            </span>
        <input id="username" class="login__input" onchange="handleChange()" type="text" name="username" placeholder="Username">
        <input id="password" class="login__input" onchange="handleChange()" type="password" name="password" placeholder="Password">
<%--        <span class="login__error"> </span>--%>
        <span class="login__error"> <% if(request.getParameter("error")!= null ){%><%=(String) request.getParameter("error")%><%}%> </span>
<%--        <%--%>
<%--            if (session.getAttribute("warning")!=null){--%>
<%--        %>--%>
<%--        <label style="color: red; text-align: center; margin-bottom: 5px;">Yêu cầu nhập đúng thông tin</label>--%>
<%--        <%}--%>
<%--        %>--%>
        <button class="login__button">Login</button>

        <span class="login__navigate">Not a member? <a href="SignUpController">Sign up now</a></span>
    </form>
</section>
<script>
    function handleSubmit()
    {
        let username = document.querySelector("#username")
        let password = document.querySelector("#password")
        let p_text_error = document.querySelector(".login__error")
        if(username.value =="" || password.value =="")
        {
            p_text_error.innerHTML = "Username and password cannot be empty!"
            return false
        }
        return true
    }
    function handleChange()
    {
        let p_text_error = document.querySelector(".login__error")
        p_text_error.innerHTML = "";
    }
</script>
<%
    }
%>



</body>
</html>
