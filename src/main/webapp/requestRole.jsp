<%@ page import="com.example.qcan.model.bean.Account" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/10/2023
  Time: 12:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Request Role</title>
    <link rel="stylesheet" type="text/css" href="css/nologin.css">
    <link rel="stylesheet" type="text/css" href="css/header.css">
    <link rel="stylesheet" type="text/css" href="css/layout.css">
    <link rel="stylesheet" type="text/css" href="css/content.css">
    <link rel="stylesheet" type="text/css" href="css/editProfile.css">
    <link rel="stylesheet" type="text/css" href="css/profile.css">
    <link rel="stylesheet" type="text/css" href="css/modal.css">
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
    <link
            href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,100;0,300;0,700;1,100;1,300;1,400&display=swap"
            rel="stylesheet"
    />
    <link rel="stylesheet" href="profile.css"/>
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
    if (isLogin != null && isLogin == true && user!= null) {
%>

<div class="container">
    <header class="header">
        <div class="header__container">
            <div class="header__link">
                <a class="header__link-logo header__transision" href="NewsFeedController">@</a>
            </div>
            <div class="header__control">
                <a href="NewsFeedController" style="color:#ccc;text-decoration: none" class="header__control--button-container">
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
                </a>
                <a href="SearchController" style="color:#ccc;text-decoration: none" class="header__control--button-container">
                    <!-- active -->
                    <!-- <i class="bx bx-search header__control--button"></i> -->
                    <!-- non active -->
                    <i
                            style="color: #ccc"
                            class="bx bx-search header__control--button"
                    ></i>
                </a>
                <a href="NewsFeedController?Type=Followed" style="color:#ccc;text-decoration: none" class="header__control--button-container">
                    <!-- non active -->
                    <i
                            style="color: #ccc"
                            class="bx bx-heart header__control--button"
                    ></i>
                    <!-- active -->
                    <!-- <i class="bx bxs-heart header__control--button"></i> -->
                </a>
                <a href="UserController" style="text-decoration: none;color:black" class="header__control--button-container">
                    <!-- active -->
                    <!-- <i
                      style="color: #ccc"
                      class="bx bx-user header__control--button"
                    ></i> -->
                    <!-- non active -->
                    <i class="bx bxs-user header__control--button"></i>
                </a>
            </div>
            <div class="header__menu">
                <input hidden id="header__menu--toggle" type="checkbox"/>
                <label class="header__menu--label" for="header__menu--toggle">
                    <i class="bx bx-menu-alt-right header__menu--button"></i>
                </label>

                <div style="width: 200px!important; " class="header__menu--list">
                    <%if(isLogin!= null && isLogin==true){%>
                    <div class="header__menu--item"><a style="color: black; width: 100%;text-decoration: none" href="UserController?Action=ChangePassword">Change Password</a></div>

                    <%if(user.getRole().equals("user")){%><div class="header__menu--item"><a style="color: black; width: 100%;text-decoration: none" href="UserController?Action=RequestRole">Request Role Musician</a></div><%}%>
                    <div class="header__menu--item"><a style="color: black; width: 100%;text-decoration: none" href="LogOutController">Logout</a></div>
                    <%} else {%>
                    <div class="header__menu--item"><a style="color: black; width: 100%;text-decoration: none" href="CheckLoginController">Login</a></div>
                    <%}%>
                </div>
            </div>
        </div>
    </header>
    <section style="height: 100%" class="main">
        <div style="height: 100%" class="main__content">
            <div style="display: flex; align-items: center;justify-content: center;flex-direction: column;height: 100%; transform: translateY(-100px)">


          <span style="font-size: 24px; font-weight: bold; text-align: center">  Do you want to change your role to musician and upload a music video?</span>
            <form method="post" action="UserController?Action=RequestRole">
                <button style="cursor: pointer" class="nologin__button" >Request</button>
            </form>
                <p  style="color:#16a34a!important; margin: 8px 0;" class="edit-profile__error"> <% if(request.getParameter("message")!= null ){%><%=(String) request.getParameter("message")%><%}%> </p>
                <p  style=" margin: 8px 0;" class="edit-profile__error"><% if(request.getParameter("error")!= null ){%><%=(String) request.getParameter("error")%><%}%></p>
            </div>


        </div>
    </section>
</div>

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
