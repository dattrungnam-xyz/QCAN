<%@ page import="java.lang.reflect.Array" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.qcan.model.bean.Account" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/9/2023
  Time: 12:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search</title>
    <link rel="stylesheet" type="text/css" href="css/header.css">
    <link rel="stylesheet" type="text/css" href="css/layout.css">
    <link rel="stylesheet" type="text/css" href="css/content.css">
    <link rel="stylesheet" type="text/css" href="css/search.css">
    <link rel="stylesheet" type="text/css" href="css/profile.css">
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
<% ArrayList<Account> listUser = new ArrayList<>();
    listUser = (ArrayList<Account>) request.getAttribute("searchUserResult");

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
                    <i class="bx bx-search header__control--button"></i>
                    <!-- non active -->
                    <!-- <i
                      style="color: #ccc"
                      class="bx bx-search header__control--button"
                    ></i> -->
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
                    <i
                            style="color: #ccc"
                            class="bx bx-user header__control--button"
                    ></i>
                    <!-- non active -->
                    <!-- <i class="bx bxs-user header__control--button"></i> -->
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
            <form method="post" action="SearchController" style="display: flex; gap: 20px; align-items: center;"
                  class="search__container">
                <div style="flex:1" class="search__container--input">
                    <i class="bx bx-search search__icon"></i>
                    <input
                            class="search__input"
                            type="text"
                            placeholder="Tìm kiếm..."
                            name="value"
                            value="<%=(String) request.getAttribute("value")%>"
                    />

                </div>
                <input name="table" value="account" hidden/>
                <div>
                    <select style="width: 120px;outline: none; padding:4px 8px;" name="field">
                        <option <%if(((String) request.getAttribute("field")).equals("fullname")){%>selected<%}%>
                                value="fullname">
                            Full Name
                        </option>
                        <option <%if(((String) request.getAttribute("field")).equals("nickname")){%>selected<%}%>
                                value="nickname">
                            Nick Name
                        </option>

                    </select>
                </div>
                <button style="margin-right: 20px; width: 80px; height: 40px; border-radius: 16px; outline: none; font-size: 16px; border:1px solid #ccc;cursor: pointer; background: #fafafa ">
                    Search
                </button>
            </form>
            <div style="border-bottom: 1px solid #ccc; display: flex; margin:16px 0 24px;">
                <a style="flex:1; height: 100%; text-align: center; color: black; cursor:pointer; text-decoration: none; font-weight: bold; padding-bottom: 4px"
                   href="SearchController">Post</a>
                <a style="flex:1; height: 100%; border-bottom: 1px solid black; text-align: center; color: black; cursor:pointer; text-decoration: none; font-weight: bold; padding-bottom: 4px"
                   href="SearchController?Type=Account">User</a>

            </div>


            <% for (Account user : listUser) { %>
            <a href="UserController?Id=<%=user.getId()%>" style="display:flex; gap:16px;margin-bottom:16px; border: 1px solid #ccc;border-radius: 12px;padding:12px;text-decoration: none;color: black" >
                <div style="width: 44px; height: 44px; border-radius:50%;overflow:hidden;">
                    <img style="width: 100%;height: 100%" src="<%=user.getAvatar()%>" alt="">
                </div>
                <div style="display:flex; flex-direction:column;justify-content: space-evenly;">
                    <span style="font-size:14px;font-weight: bold;"><%=user.getFullname()%></span>
                    <span style="font-size:13px;font-weight: bold; color:#737373"><%=user.getNickname()%></span>
                </div>
            </a>
            <%}%>
        </div>
    </section>
</div>
</body>
</html>
