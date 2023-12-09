<%@ page import="com.example.qcan.model.bean.Post" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/9/2023
  Time: 12:43 PM
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
<% ArrayList<Post> listPost = new ArrayList<>();
    listPost = (ArrayList<Post>) request.getAttribute("searchPostResult");

%>
<div class="container">
    <header class="header">
        <div class="header__container">
            <div class="header__link">
                <a style="color:black;text-decoration: none" class="header__link-logo header__transision" href="NewsFeedController">@</a>
            </div>
            <div class="header__control">
                <a style="color:#ccc; text-decoration: none" href="NewsFeedController" class="header__control--button-container">
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
                <a href="SearchController" style="color:black;text-decoration: none" class="header__control--button-container">
                    <!-- active -->
                    <i class="bx bx-search header__control--button"></i>
                    <!-- non active -->
                    <!-- <i
                      style="color: #ccc"
                      class="bx bx-search header__control--button"
                    ></i> -->
                </a>
                <a  href="NewsFeedController?Type=Followed" style="color:#ccc;text-decoration: none" class="header__control--button-container">
                    <!-- non active -->
                    <i
                            style="color: #ccc"
                            class="bx bx-heart header__control--button"
                    ></i>
                    <!-- active -->
                    <!-- <i class="bx bxs-heart header__control--button"></i> -->
                </a>
                <a href="UserController" style="color:#ccc;text-decoration: none" class="header__control--button-container">
                    <!-- active -->
                    <i
                            style="color: #ccc"
                            class="bx bx-user header__control--button"
                    ></i>
                    <!-- non active -->
                    <!-- <i class="bx bxs-user header__control--button"></i> -->
                </a>
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
            <form method="post" action="SearchController" style="display: flex; gap: 20px; align-items: center;" class="search__container">
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
                <input name="table" value="post" hidden/>
                <div>
                    <select style="outline: none; padding:4px 8px; width: 120px;" name="field">
                        <option <%if(((String) request.getAttribute("field")).equals("SongName")){%>selected<%}%> value="SongName">
                            Song Name
                        </option>
                        <option <%if(((String) request.getAttribute("field")).equals("SongType")){%>selected<%}%> value="SongType">
                            Song Type
                        </option>
                        <option <%if(((String) request.getAttribute("field")).equals("Musician")){%>selected<%}%> value="Musician">
                            Musician
                        </option>
                    </select>
                </div>
                <button style="margin-right: 20px; width: 80px; height: 40px; border-radius: 16px; outline: none; font-size: 16px; border:1px solid #ccc;cursor: pointer; background: #fafafa "> Search</button>
            </form>
            <div style="border-bottom: 1px solid #ccc; display: flex; margin-top:16px;">
                <a href="SearchController" style="flex:1; height: 100%; border-bottom: 1px solid black; text-align: center; color: black; cursor:pointer; text-decoration: none; font-weight: bold; padding-bottom: 4px" >Post</a>
                <a href="SearchController?Type=Account" style="flex:1; height: 100%; text-align: center; color: black; cursor:pointer; text-decoration: none; font-weight: bold; padding-bottom: 4px">User</a>

            </div>
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
