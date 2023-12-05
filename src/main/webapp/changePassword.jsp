<%@ page import="com.example.qcan.model.bean.Account" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/5/2023
  Time: 6:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Change Password</title>
    <link rel="stylesheet" type="text/css" href="css/nologin.css">
    <link rel="stylesheet" type="text/css" href="css/login.css">
    <link rel="stylesheet" type="text/css" href="css/header.css">
    <link rel="stylesheet" type="text/css" href="css/layout.css">
    <link rel="stylesheet" type="text/css" href="css/content.css">
    <link rel="stylesheet" type="text/css" href="css/editProfile.css">
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
    <link
            href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,100;0,300;0,700;1,100;1,300;1,400&display=swap"
            rel="stylesheet"
    />
    <link
            href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css"
            rel="stylesheet"
    />
</head>
<body>

<%
    Account user = (Account) request.getAttribute("user");
    session = request.getSession();
    Boolean isLogin = (Boolean) session.getAttribute("isLogin");
    if (isLogin != null && isLogin == true && user != null) {
%>

<div class="container">
    <header class="header">
        <div class="header__container">
            <div class="header__link">
                <a class="header__link-logo header__transision" href="">@</a>
            </div>
            <div class="header__control">
                <div class="header__control--button-container">
                    <!-- active -->
                    <!-- <i
                      style="color: black"
                      class="bx bxs-home header__control--button"
                    ></i> -->
                    <!-- non active -->
                    <i
                            style="color: #ccc"
                            class="bx bx-home-alt-2 header__control--button"
                    ></i>
                </div>
                <div class="header__control--button-container">
                    <!-- active -->
                    <!-- <i class="bx bx-search header__control--button"></i> -->
                    <!-- non active -->
                    <i
                            style="color: #ccc"
                            class="bx bx-search header__control--button"
                    ></i>
                </div>
                <div class="header__control--button-container">
                    <!-- non active -->
                    <i
                            style="color: #ccc"
                            class="bx bx-heart header__control--button"
                    ></i>
                    <!-- active -->
                    <!-- <i class="bx bxs-heart header__control--button"></i> -->
                </div>
                <div class="header__control--button-container">
                    <!-- active -->
                    <!-- <i
                      style="color: #ccc"
                      class="bx bx-user header__control--button"
                    ></i> -->
                    <!-- non active -->
                    <i class="bx bxs-user header__control--button"></i>
                </div>
            </div>
            <div class="header__menu">
                <input hidden id="header__menu--toggle" type="checkbox"/>
                <label class="header__menu--label" for="header__menu--toggle">
                    <i class="bx bx-menu-alt-right header__menu--button"></i>
                </label>
                <div class="header__menu--list">
                    <div class="header__menu--item">Đăng xuất</div>
                </div>
            </div>
        </div>
    </header>
    <section class="main">
        <div class="main__content">
            <div style="width: 100%; display: flex; justify-content: center; margin-top:20px;">


                <form style="" onsubmit="return handleSubmit()" method="post"
                      action="UserController?Action=ChangePassword&Id=<%=user.getId()%>" class="login">
            <span class="login__title">
                Change Password
            </span>
                    <input id="currentPassword" class="login__input" onchange="handleChange()" type="password"
                           name="currentPassword" placeholder="Current Password">
                    <input id="newPassword" class="login__input" onchange="handleChange()" type="password"
                           name="newPassword" placeholder="New Password">
                    <input id="confirmPassword" class="login__input" onchange="handleChange()" type="password"
                           name="confirmPassword" placeholder="Confirm Password">
                    <span class="login__error"> <% if(request.getParameter("error")!= null ){%><%=(String) request.getParameter("error")%><%}%> </span>
                    <span style="color:#16a34a!important;" class="login__error"> <% if(request.getParameter("message")!= null ){%><%=(String) request.getParameter("message")%><%}%> </span>
                    <button class="login__button">Update</button>

                </form>
            </div>
        </div>
    </section>
</div>

<script>

    let currentPassword = document.getElementById("currentPassword")
    let newPassword = document.getElementById("newPassword")
    let confirmPassword = document.getElementById("confirmPassword")
    let error = document.querySelector(".login__error")
    function handleSubmit()
    {
        if(currentPassword.value =="" || newPassword.value==""|| confirmPassword.value =="")
        {
            error.innerHTML = "Field cannot be empty!"
            return false
        }
        if(newPassword.value.length <6)
        {
            error.innerHTML = "New password must have at least 6 characters!"
            return false
        }
        if(newPassword.value != confirmPassword.value )
        {
            error.innerHTML = "Password and Confirm Password not match!"
            return false
        }
        return true
    }
    function handleChange()
    {
        error.innerHTML=""
    }
</script>
<%
} else {
%>


<div class="nologin">
    <span class="nologin__title">oops!</span>
    <span class="nologin__detail"> You are not logged in. Please log in and try again! </span>
    <a class="nologin__button" href="CheckLoginController">Login</a>
</div>
<%
    }
%>

</body>
</html>
