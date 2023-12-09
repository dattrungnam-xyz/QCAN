<%@ page import="com.example.qcan.model.bean.Account" %>
<%@ page import="com.example.qcan.model.bean.Follow" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.qcan.model.bean.Post" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/4/2023
  Time: 10:10 PM
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
    <link rel="stylesheet" type="text/css" href="css/global.css">
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
    Follow countFl = (Follow) request.getAttribute("countFl");
    Follow countFler = (Follow) request.getAttribute("countFler");
    ArrayList<Account> listAccFler = (ArrayList<Account>) request.getAttribute("listAccFler");
    ArrayList<Account> listAccFled = (ArrayList<Account>) request.getAttribute("listAccFled");
    ArrayList<Post> listPost = (ArrayList<Post>) request.getAttribute("listPost");
    if (isLogin != null && isLogin == true && user != null) {
%>

<div class="container">
    <header class="header">
        <div class="header__container">
            <div class="header__link">
                <a href="NewsFeedController" class="header__link-logo header__transision" href="">@</a>
            </div>
            <div class="header__control">
                <a href="NewsFeedController" class="header__control--button-container">

                    <i
                            style="color: #ccc"
                            class="bx bx-home-alt-2 header__control--button"
                    ></i>
                </a>
                <a href="SearchController" class="header__control--button-container">

                    <i
                            style="color: #ccc"
                            class="bx bx-search header__control--button"
                    ></i>
                </a>
                <a href="NewsFeedController?Type=Followed" class="header__control--button-container">
                    <!-- non active -->
                    <i
                            style="color: #ccc"
                            class="bx bx-heart header__control--button"
                    ></i>
                    <!-- active -->
                    <!-- <i class="bx bxs-heart header__control--button"></i> -->
                </a>
                <a style="color:black" href="UserController" class="header__control--button-container">
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
                <div class="header__menu--list">
                    <a href="UserController?Action=ChangePassword" style="text-decoration: none; color: black" class="header__menu--item">Change Password</a>
                    <a href="LogOutController" style="text-decoration: none; color: black" class="header__menu--item">Log out</a>

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
                <%if (user.getBio() != null && !user.getBio().equals("")) {%>
                <%=user.getBio()%>
                <%}%>
            </div>
            <div class="user__social">
                <div class="user__social--follow">
                    <span style="cursor: pointer" onclick="toggleFollower()"
                          class="user__social--follow-infor"> <%=countFler.getCountFollower()%> người theo dõi </span>
                    <span style="cursor: pointer" onclick="toggleFollowed()" class="user__social--follow-infor">
                Đang theo dõi <%=countFl.getCountFollow()%> người dùng
              </span>
                </div>
                <div class="user__social--link">
                    <%
                        if (user.getLinkFB() != null && !user.getLinkFB().equals("")) {
                    %>
                    <a href="<%=user.getLinkFB()%>"><i class="bx user__social--icon bxl-facebook"></i></a>
                    <%
                        }
                    %>
                    <%
                        if (user.getLinkIns() != null && !user.getLinkIns().equals("")) {
                    %>
                    <a href="<%=user.getLinkIns()%>"><i class="bx user__social--icon bxl-instagram"></i></a>
                    <%
                        }
                    %>
                </div>
            </div>
            <div class="profile__edit">
                <button class="profile__edit--button">
                    <a style="color:black; text-decoration: none;" href="UserController?Action=Update">
                        Chỉnh sửa trang cá nhân
                    </a>

                </button>
            </div>

            <div class="profile__status">
                <div class="profile__status--header  profile__status--header-active">
                    Bài đăng
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

<script>
    // Function to open the followers popup
    function openFollowersPopup(userId) {
        $.ajax({
            url: 'listFL.jsp',
            type: 'GET',
            data: {userId: userId},
            success: function (response) {
                // Open a popup and inject the response HTML
                var popup = window.open('listFL.jsp', '_blank', 'width=400, height=400');
                popup.document.write(response);
            },
            error: function (error) {
                console.log('Error fetching followers: ', error);
            }
        });
    }
</script>
</html>
