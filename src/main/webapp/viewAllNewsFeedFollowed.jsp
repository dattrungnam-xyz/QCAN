<%@ page import="com.example.qcan.model.bean.Post" %>
<%@ page import="com.example.qcan.model.bean.Account" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/9/2023
  Time: 3:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>News Feed</title>
    <link rel="stylesheet" type="text/css" href="css/nologin.css">
    <link rel="stylesheet" type="text/css" href="css/header.css">
    <link rel="stylesheet" type="text/css" href="css/layout.css">
    <link rel="stylesheet" type="text/css" href="css/content.css">
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
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
    session = request.getSession();
    Boolean isLogin = (Boolean) session.getAttribute("isLogin");
    Account user = (Account) session.getAttribute("user");
    ArrayList<Post> listPost = (ArrayList<Post>) request.getAttribute("listPost");
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
<%--                    <i--%>
<%--                            style="color: black"--%>
<%--                            class="bx bxs-home header__control--button"--%>
<%--                    ></i>--%>
                    <!-- non active -->
                  <i style="color: #ccc"     class="bx bx-home-alt-2 header__control--button"></i>
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
<%--                    <i--%>
<%--                            style="color: #ccc"--%>
<%--                            class="bx bx-heart header__control--button"--%>
<%--                    ></i>--%>
                    <!-- active -->
                  <i class="bx bxs-heart header__control--button"></i>
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
                <input hidden id="header__menu--toggle" type="checkbox" />
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
            <%if(user.getNickname()!=null && user.getRole().equals("musician")){%>
            <div class="main__post">
                <img
                        class="main__post--avatar"
                        src="<%=user.getAvatar()%>"
                        alt=""
                />
                <button class="main__post--link">Bắt đầu đăng bài...</button>
                <button class="main__post--button">Đăng</button>
            </div>
            <%}%>
            <% for (Post post : listPost) { %>
            <div class="main__status">
                <a href="UserController?Id=<%=post.getIdUser()%>" class="main__status--ava-contain">
                    <img
                            class="main__post--avatar"
                            src="<%=post.getAvatar()%>"
                            class="main__status--ava"
                            alt=""
                    />

                </a>

                <div class="main__status--content">
                    <div class="main__status--header">
                        <a href="UserController?Id=<%=post.getIdUser()%>" style="text-decoration: none; color:black" class="main__status--username"><%=post.getFullname()%></a>
                        <div  style="text-decoration: none" class="main__status--time"><%=post.getPostTime()%></div>
                        <!-- <div class="main__status--action">
                          <i class="bx bx-dots-horizontal-rounded"></i>
                        </div> -->
                    </div>
                    <div>
                        <div class="main__status--text">
                            Song Name: <%=post.getSongName()%> <br>
                            Song Type: <%=post.getSongType()%> <br>
                            Musician: <%=post.getMusician()%> <br>
                            <%=post.getPostContent()%>
                        </div>
                        <div class="main__status--image-contain">
                            <video style="width: 100%;max-height: 500px" src="<% if(post.getVideoUrl()!= null ){%><%=post.getVideoUrl()%><%}%>" style="width: 100%" id="displayVideo" controls></video>
                        </div>
                        <div class="main__status--action">

                            <!-- active -->
                            <!-- <i style="color:#ff3040" class="bx bxs-heart main__status--heart"></i> -->
                        </div>
                    </div>
                </div>
            </div>
            <%}%>

        </div>
    </section>
</div>
</body>
</html>
