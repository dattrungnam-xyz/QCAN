<%@ page import="com.example.qcan.model.bean.Account" %>
<%@ page import="com.example.qcan.model.bean.Follow" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.qcan.model.bean.Post" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/5/2023
  Time: 10:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Profile</title>
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
    session = request.getSession();

    Account currentUser = (Account) session.getAttribute("user");

    Account user = (Account) request.getAttribute("userOther");
    Follow isFl = (Follow) request.getAttribute("isFl");

    Follow countFl = (Follow) request.getAttribute("countFl");
    Follow countFler = (Follow) request.getAttribute("countFler");

    ArrayList<Account> listAccFler = (ArrayList<Account>) request.getAttribute("listAccFler");
    ArrayList<Account> listAccFled = (ArrayList<Account>) request.getAttribute("listAccFled");
    ArrayList<Post> listPost = (ArrayList<Post>) request.getAttribute("listPost");

    Boolean isLogin = (Boolean) session.getAttribute("isLogin");

        if (user.getNickname() == null) {
%>

<div class="nologin">
    <span class="nologin__title">oops!</span>
    <span class="nologin__detail"> User invalid. Please try again! </span>

</div>

<% } else { %>

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

                    <%if(currentUser!=null && currentUser.getRole().equals("user")){%><div class="header__menu--item"><a style="color: black; width: 100%;text-decoration: none" href="UserController?Action=RequestRole">Request Role Musician</a></div><%}%>
                    <div class="header__menu--item"><a style="color: black; width: 100%;text-decoration: none" href="LogOutController">Logout</a></div>
                    <%} else {%>
                    <div class="header__menu--item"><a style="color: black; width: 100%;text-decoration: none" href="CheckLoginController">Login</a></div>
                    <%}%>
                </div>
            </div>
        </div>
    </header>
    <section class="main">
        <div class="main__content">
            <div class="user__infor">
                <div class="user__infor--account">
                    <span class="user__name"> <%=user.getFullname()%> <%if(user.getRole().equals("musician"))%><i class='bx bx-music' ></i><%%></span>
                    <span class="user__username"> @<%=user.getNickname()%></span>
                </div>
                <div class="user__avatar">
                    <img
                            class="user__avatar--image"
                            src="<%if(user.getAvatar()!=null){%><%=user.getAvatar().replace(' ','+')%><%}%>"
                            alt=""
                    />
                </div>
            </div>
            <div class="user__bio">
                <%if (user.getBio() != null) {%><%=user.getBio()%><%}%>
            </div>
            <div class="user__social">
                <div class="user__social--follow">
                    <span style="cursor: pointer" onclick="toggleFollower()" class="user__social--follow-infor"><%=countFler.getCountFollower()%> followers </span>
                    <span style="cursor: pointer" onclick="toggleFollowed()"  class="user__social--follow-infor">
                 <%=countFl.getCountFollow()%> following
              </span>
                </div>
                <div class="user__social--link">
                    <a href="<%=user.getLinkIns()%>"><i class="bx user__social--icon bxl-instagram"></i></a>
                    <a href="<%=user.getLinkFB()%>"><i class="bx user__social--icon bxl-facebook"></i></a>
                </div>
            </div>
            <div class="profile__edit">
                <%

                    // Set the current URL in the session
                    session.setAttribute("currentUserView", user.getId());
                %>
                <%   if (isLogin != null && isLogin == true ) {%>
                <%if(isFl.isFled() ==false){%>
                <form method="post" action="FollowController?Action=Follow&Id=<%=user.getId()%>">
                <button style="cursor: pointer;color:white !important; background-color: black !important"
                        class="profile__edit--button">

                        Follow

                </button>
                </form>
                <%} else {%>
                <form method="post" action="FollowController?Action=Unfollow&Id=<%=user.getId()%>">
                <button style="cursor: pointer;color:black !important; background-color: white !important"
                        class="profile__edit--button">

                        Unfollow
                </button>
                </form>
                <%}%>
                <%}%>
            </div>

            <div class="profile__status">
                <div class="profile__status--header  profile__status--header-active">
                    Posts
                </div>

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
                            <strong> Song Name: </strong> <%=post.getSongName()%> <br>
                            <strong> Song Type:</strong> <%=post.getSongType()%> <br>
                            <strong> Musician:</strong> <%=post.getMusician()%> <br><br>
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

<div onclick="toggleFollowed()" class="modal modal1 hidden"></div>
<div class="fled followed-content hidden">
    <div class="followed-header">
        <span>Following</span>
        <div onclick="
        toggleFollowed()" class="followed-header__close">
            <i class="bx bx-x followed-header__close--icon"></i>
        </div>
    </div>
    <div class="followed-list-user">
        <% for (Account fl : listAccFled) { %>
        <a style="text-decoration: none" href="UserController?Id=<%=fl.getId()%>" class="followed-user">
            <div class="followed-user__avatar">
                <img src="<%=fl.getAvatar()%>" alt="">
            </div>
            <div class="followed-user__infor">
                <span style="font-size:14px;font-weight: bold; color:black"><%=fl.getFullname()%></span>
                <span style="font-size:13px;font-weight: bold; color:#737373"><%=fl.getNickname()%></span>
            </div>
        </a>
        <%}%>

    </div>
</div>

<div onclick="toggleFollower()" class="modal modal2 hidden"></div>
<div class="fler followed-content hidden">
    <div class="followed-header">
        <span>Followers</span>
        <div onclick="
        toggleFollower()" class="followed-header__close">
            <i class="bx bx-x followed-header__close--icon"></i>
        </div>
    </div>
    <div class="followed-list-user">
        <% for (Account fl : listAccFler) { %>
        <a style="text-decoration: none" href="UserController?Id=<%=fl.getId()%>" class="followed-user">
            <div class="followed-user__avatar">
                <img src="<%=fl.getAvatar()%>" alt="">
            </div>
            <div class="followed-user__infor">
                <span style="font-size:14px;font-weight: bold; color:black"><%=fl.getFullname()%></span>
                <span style="font-size:13px;font-weight: bold; color:#737373"><%=fl.getNickname()%></span>
            </div>
        </a>
        <%}%>

    </div>
</div>
<script>

    function toggleFollowed() {
        let modal = document.querySelector(".modal1")
        let content = document.querySelector(".fled")

        modal.classList.toggle("hidden")
        content.classList.toggle("hidden")
    }

    function toggleFollower() {
        let modal = document.querySelector(".modal2")
        let content = document.querySelector(".fler")

        modal.classList.toggle("hidden")
        content.classList.toggle("hidden")
    }
</script>

<%
    }
%>





</body>
</html>
