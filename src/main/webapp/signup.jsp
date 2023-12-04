<%@ page import="com.example.qcan.model.bean.Account" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/4/2023
  Time: 2:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>SignUp</title>
    <link rel="stylesheet" type="text/css" href="css/login.css">
    <link rel="stylesheet" type="text/css" href="css/nologin.css">
</head>
<body>
<%
    session = request.getSession();
    Account user = (Account) request.getAttribute("user");

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
    <form onsubmit="return handleSubmit()" method="post" action="SignUpController" class="login">
            <span class="login__title">
               Sign up
            </span>
        <input class="login__input" onchange="handleChange()" id="username" name="username" type="text" placeholder="Username">
        <input class="login__input" onchange="handleChange()" id="password" name="password" type="password" placeholder="Password">
        <input class="login__input" onchange="handleChange()" id="email" name="email" type="text" placeholder="Email">
        <input class="login__input" onchange="handleChange()" id="fullname" name="fullname" type="text" placeholder="Full name">
        <input class="login__input" onchange="handleChange()" id="nickname" name="nickname" type="text" placeholder="Nick name">
        <span class="login__error"><% if(request.getParameter("error")!= null ){%><%=(String) request.getParameter("error")%><%}%> </span>
        <button class="login__button">Sign up</button>
        <span class="login__navigate">Already a member? <a href="">Log in now</a></span>
    </form>
</section>
    <script>
    let username = document.querySelector("#username")
    let password = document.querySelector("#password")
    let email = document.querySelector("#email")
    let fullname = document.querySelector("#fullname")
    let nickname = document.querySelector("#nickname")

    let p_text_error = document.querySelector(".login__error")

    const validateEmail = (email) => {
        return String(email)
            .toLowerCase()
            .match(
                /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|.(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
            );
    };

    function handleSubmit()
    {
        if(username.value =="" || password.value ==""  || email.value ==""  || fullname.value ==""  || nickname.value =="" )
        {
            p_text_error.innerHTML= "All fields cannot be empty!"
            return false
        }
        if(username.value.length <6)
        {
            p_text_error.innerHTML= "Username must have at least 6 characters!"
            return false
        }
        if(password.value.length <6)
        {
            p_text_error.innerHTML= "Password must have at least 6 characters!"
            return false
        }
        if(!validateEmail(email.value))
        {
            p_text_error.innerHTML= "Email invalid!"
            return false
        }
        return true
    }
    function handleChange()
    {
        p_text_error.innerHTML = ""
    }

    </script>
<%
    }
%>
</body>
</html>
