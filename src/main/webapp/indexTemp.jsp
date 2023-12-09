<%@ page import="com.example.qcan.model.bean.Account" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
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
<<<<<<< HEAD
<%
    Account user = (Account) request.getAttribute("user");
    session = request.getSession();
    Boolean isLogin = (Boolean) session.getAttribute("isLogin");
    if (isLogin != null && isLogin == true) {
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
                    <i
                            style="color: black"
                            class="bx bxs-home header__control--button"
                    ></i>
                    <!-- non active -->
                    <!-- <i class="bx bx-home-alt-2 header__control--button"></i> -->
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
                    <div class="header__menu--item"><a href="LogOutController">Đăng xuất</a></div>
                </div>
            </div>
        </div>
    </header>
    <section class="main">
        <div class="main__content">
            <div class="main__post">
                <img
                        class="main__post--avatar"
                        src="<%if(user.getAvatar()!=null){%><%=user.getAvatar().replace(' ','+')%><%}%>"
                        alt=""
                />
                <button class="main__post--link">Bắt đầu đăng bài...</button>
                <button class="main__post--button">Đăng</button>
            </div>

            <div class="main__status">
                <div class="main__status--ava-contain">
                    <img
                            class="main__post--avatar"
                            src="<%if(user.getAvatar()!=null){%><%=user.getAvatar().replace(' ','+')%><%}%>"
                            class="main__status--ava"
                            alt=""
                    />
                    <span class="main__status--button-follow">+</span>
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
                        <!-- ... -->
                        <div class="main__status--action">
                            <i class="bx bx-heart main__status--heart"></i>
                            <span class="main__status--heart-count"> <%= request.getAttribute("likeCount") %> triệu </span>
                            <!-- active -->
                            <!-- <i style="color:#ff3040" class="bx bxs-heart main__status--heart"></i> -->
                        </div>
                        <!-- ... -->

                    </div>
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
                    <span class="main__status--button-follow">+</span>
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
                        <div class="main__status--text">
                            Cuối cùng tớ chả thể hoàn thành được ước nguyện đón Giáng Sinh
                            cùng với người tình. Hẹn 2024 hi vọng tớ sẽ làm được!
                        </div>
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
                        <!-- ... -->
                        <div class="main__status--action">
                            <i id="likeIcon" class="bx bx-heart main__status--heart"></i>
                            <span class="main__status--heart-count" id="likeCount"> <%= request.getAttribute("likeCount") %> triệu </span>
                        </div>
                        <script>
                            // Add a click event listener to the heart icon
                            document.getElementById('likeIcon').addEventListener('click', function() {
                                // Make an AJAX request to your server
                                var xhr = new XMLHttpRequest();
                                xhr.open('POST', '/your-context-root/LikeController', true);
                                xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                                xhr.onreadystatechange = function() {
                                    if (xhr.readyState === 4 && xhr.status === 200) {
                                        // Update the like count on success
                                        var likeCount = parseInt(xhr.responseText);
                                        document.getElementById('likeCount').innerText = likeCount + ' triệu';
                                    }
                                };

                                // Send the data, including user and post IDs
                                <%--xhr.send('action=like&userId=<%= user.getId() %>&postId=<%= postId %>');--%>
                            });
                        </script>


                        <!-- ... -->

                    </div>
                </div>
            </div>
        </div>
    </section>
</div>




<%
} else {
%>


<div class="nologin">
    <span class="nologin__title" >oops!</span>
    <span class="nologin__detail"> You are not logged in. Please log in and try again! </span>
    <a class="nologin__button" href="CheckLoginController">Login</a>
</div>
<%
    }
%>
=======
                <%
                    Account user = (Account) request.getAttribute("user");
                    session = request.getSession();
                    Boolean isLogin = (Boolean) session.getAttribute("isLogin");
                    if (isLogin != null && isLogin == true) {
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
                                    <i
                                            style="color: black"
                                            class="bx bxs-home header__control--button"
                                    ></i>
                                    <!-- non active -->
                                    <!-- <i class="bx bx-home-alt-2 header__control--button"></i> -->
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
                                    <div class="header__menu--item"><a href="LogOutController">Đăng xuất</a></div>
                                </div>
                            </div>
                        </div>
                    </header>
                    <section class="main">
                        <div class="main__content">
                            <div class="main__post">
                                <img
                                        class="main__post--avatar"
                                        src="<%if(user.getAvatar()!=null){%><%=user.getAvatar().replace(' ','+')%><%}%>"
                                        alt=""
                                />
                                <button class="main__post--link">Bắt đầu đăng bài...</button>
                                <button class="main__post--button">Đăng</button>
                            </div>

                            <div class="main__status">
                                <div class="main__status--ava-contain">
                                    <img
                                            class="main__post--avatar"
                                            src="<%if(user.getAvatar()!=null){%><%=user.getAvatar().replace(' ','+')%><%}%>"
                                            class="main__status--ava"
                                            alt=""
                                    />
                                    <span class="main__status--button-follow">+</span>
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
                            <div class="main__status">
                                <div class="main__status--ava-contain">
                                    <img
                                            class="main__post--avatar"
                                            src="<%if(user.getAvatar()!=null){%><%=user.getAvatar().replace(' ','+')%><%}%>"
                                            class="main__status--ava"
                                            alt=""
                                    />
                                    <span class="main__status--button-follow">+</span>
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
                                        <div class="main__status--text">
                                            Cuối cùng tớ chả thể hoàn thành được ước nguyện đón Giáng Sinh
                                            cùng với người tình. Hẹn 2024 hi vọng tớ sẽ làm được!
                                        </div>
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




                <%
                } else {
                %>


                <div class="nologin">
                    <span class="nologin__title" >oops!</span>
                    <span class="nologin__detail"> You are not logged in. Please log in and try again! </span>
                    <a class="nologin__button" href="CheckLoginController">Login</a>
                </div>
                <%
                    }
                %>
>>>>>>> a7336b74717e0c725ce1bb6af067518587a31f6d

</body>
</html>