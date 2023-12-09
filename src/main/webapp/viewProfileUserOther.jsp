<%@ page import="com.example.qcan.model.bean.Account" %>
<%@ page import="com.example.qcan.model.bean.Follow" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.util.ArrayList" %>
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
    <title>Title</title>
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
    Account user = (Account) request.getAttribute("userOther");
    Follow isFl = (Follow) request.getAttribute("isFl");

    Follow countFl = (Follow) request.getAttribute("countFl");
    Follow countFler = (Follow) request.getAttribute("countFler");

    ArrayList<Account> listAccFler = (ArrayList<Account>) request.getAttribute("listAccFler");
    ArrayList<Account> listAccFled = (ArrayList<Account>) request.getAttribute("listAccFled");

    session = request.getSession();
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
            <div class="user__infor">
                <div class="user__infor--account">
                    <span class="user__name"> <%=user.getFullname()%></span>
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
                    <span style="cursor: pointer" onclick="toggleFollower()" class="user__social--follow-infor"><%=countFler.getCountFollower()%> người theo dõi </span>
                    <span style="cursor: pointer" onclick="toggleFollowed()"  class="user__social--follow-infor">
                Đang theo dõi <%=countFl.getCountFollow()%> người dùng
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

                        Theo dõi

                </button>
                </form>
                <%} else {%>
                <form method="post" action="FollowController?Action=Unfollow&Id=<%=user.getId()%>">
                <button style="cursor: pointer;color:black !important; background-color: white !important"
                        class="profile__edit--button">

                        Bỏ theo dõi
                </button>
                </form>
                <%}%>
                <%}%>
            </div>

            <div class="profile__status">
                <div class="profile__status--header  profile__status--header-active">
                    Bài đăng của tôi
                </div>
                <div class="profile__status--header">
                    Đã thích
                </div>
            </div>
            <div class="main__status">
                <div class="main__status--ava-contain">
                    <img
                            class="main__post--avatar"
                            src="<%if(user.getAvatar()!=null){%><%=user.getAvatar().replace(' ','+')%><%}%>"
                            class="main__status--ava"
                            alt=""
                    />
                </div>

                <div class="main__status--content">
                    <div class="main__status--header">
                        <div class="main__status--username">sunnews</div>
                        <div class="main__status--time">50 phút</div>
                        <!-- <div class="main__status--action">
                          <i class="bx bx-dots-horizontal-rounded"></i>
                        </div> -->
                    </div>
                    <div>
                        <div class="main__status--text">thôi không cần ghi</div>
                        <div class="main__status--image-contain">
                            <img
                                    class="main__status--image"
                                    src="https://scontent.cdninstagram.com/v/t39.30808-6/407391005_18286388227159883_383640245813341930_n.jpg?stp=dst-jpg_e15&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi4xMDgweDEzNTAuc2RyIn0&_nc_ht=scontent.cdninstagram.com&_nc_cat=111&_nc_ohc=5CcVJvmuMhkAX9DM6Je&edm=APs17CUAAAAA&ccb=7-5&ig_cache_key=MzI0ODYyNjA3ODYyNzExNjA3Mw%3D%3D.2-ccb7-5&oh=00_AfAHjwjb_tWdI4bzkFGYPDvedTWaent5Hzgb7wNJfLOg_g&oe=656D94F0&_nc_sid=10d13b"
                                    alt=""
                            />
                            <img
                                    class="main__status--image"
                                    src="https://scontent.cdninstagram.com/v/t39.30808-6/407391005_18286388227159883_383640245813341930_n.jpg?stp=dst-jpg_e15&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi4xMDgweDEzNTAuc2RyIn0&_nc_ht=scontent.cdninstagram.com&_nc_cat=111&_nc_ohc=5CcVJvmuMhkAX9DM6Je&edm=APs17CUAAAAA&ccb=7-5&ig_cache_key=MzI0ODYyNjA3ODYyNzExNjA3Mw%3D%3D.2-ccb7-5&oh=00_AfAHjwjb_tWdI4bzkFGYPDvedTWaent5Hzgb7wNJfLOg_g&oe=656D94F0&_nc_sid=10d13b"
                                    alt=""
                            />
                            <img
                                    class="main__status--image"
                                    src="https://scontent.cdninstagram.com/v/t39.30808-6/407391005_18286388227159883_383640245813341930_n.jpg?stp=dst-jpg_e15&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi4xMDgweDEzNTAuc2RyIn0&_nc_ht=scontent.cdninstagram.com&_nc_cat=111&_nc_ohc=5CcVJvmuMhkAX9DM6Je&edm=APs17CUAAAAA&ccb=7-5&ig_cache_key=MzI0ODYyNjA3ODYyNzExNjA3Mw%3D%3D.2-ccb7-5&oh=00_AfAHjwjb_tWdI4bzkFGYPDvedTWaent5Hzgb7wNJfLOg_g&oe=656D94F0&_nc_sid=10d13b"
                                    alt=""
                            />
                        </div>
                        <div class="main__status--action">
                            <i class="bx bx-heart main__status--heart"></i>
                            <span class="main__status--heart-count"> 2 triệu </span>
                            <!-- active -->
                            <!-- <i style="color:#ff3040" class="bx bxs-heart main__status--heart"></i> -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

<div onclick="toggleFollowed()" class="modal modal1 hidden"></div>
<div class="fled followed-content hidden">
    <div class="followed-header">
        <span>Đang theo dõi</span>
        <div onclick="
        toggleFollowed()" class="followed-header__close">
            <i class="bx bx-x followed-header__close--icon"></i>
        </div>
    </div>
    <div class="followed-list-user">
        <% for (Account fl : listAccFled) { %>
        <div class="followed-user">
            <div class="followed-user__avatar">
                <img src="<%=fl.getAvatar()%>" alt="">
            </div>
            <div class="followed-user__infor">
                <span style="font-size:14px;font-weight: bold;"><%=fl.getFullname()%></span>
                <span style="font-size:13px;font-weight: bold; color:#737373"><%=fl.getNickname()%></span>
            </div>
        </div>
        <%}%>

    </div>
</div>

<div onclick="toggleFollower()" class="modal modal2 hidden"></div>
<div class="fler followed-content hidden">
    <div class="followed-header">
        <span>Người theo dõi</span>
        <div onclick="
        toggleFollower()" class="followed-header__close">
            <i class="bx bx-x followed-header__close--icon"></i>
        </div>
    </div>
    <div class="followed-list-user">
        <% for (Account fl : listAccFler) { %>
        <div class="followed-user">
            <div class="followed-user__avatar">
                <img src="<%=fl.getAvatar()%>" alt="">
            </div>
            <div class="followed-user__infor">
                <span style="font-size:14px;font-weight: bold;"><%=fl.getFullname()%></span>
                <span style="font-size:13px;font-weight: bold; color:#737373"><%=fl.getNickname()%></span>
            </div>
        </div>
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
