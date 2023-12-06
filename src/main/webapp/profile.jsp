<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/12/2023
  Time: 12:31 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="header.css" />
    <link rel="stylesheet" href="layout.css" />
    <link rel="stylesheet" href="content.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
            href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,100;0,300;0,700;1,100;1,300;1,400&display=swap"
            rel="stylesheet"
    />
    <link rel="stylesheet" href="profile.css" />
    <link
            href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css"
            rel="stylesheet"
    />
    <title>Document</title>
</head>
<body>
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
            <div class="user__infor">
                <div class="user__infor--account">
                    <span class="user__name"> Dat </span>
                    <span class="user__username"> _dat.trung.nam_ </span>
                </div>
                <div class="user__avatar">
                    <img
                            class="user__avatar--image"
                            src="https://vtv1.mediacdn.vn/zoom/640_400/2022/3/4/avatar-jake-neytiri-pandora-ocean-1646372078251163431014-crop-16463720830272075805905.jpg"
                            alt=""
                    />
                </div>
            </div>
            <div class="user__bio">
                Đây là tiểu sử
                đạt ở trung nam
            </div>
            <div class="user__social">
                <div class="user__social--follow">
                    <span class="user__social--follow-infor"> 2 người theo dõi </span>
                    <span class="user__social--follow-infor">
                Đang theo dõi 2 người dùng
              </span>
                </div>
                <div class="user__social--link">
                    <a href=""><i class="bx user__social--icon bxl-instagram"></i></a>
                    <a href=""><i class="bx user__social--icon bxl-facebook"></i></a>
                </div>
            </div>
            <div class="profile__edit">
                <button class="profile__edit--button">
                    Chỉnh sửa trang cá nhân
                </button>
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
                            src=" https://vtv1.mediacdn.vn/zoom/640_400/2022/3/4/avatar-jake-neytiri-pandora-ocean-1646372078251163431014-crop-16463720830272075805905.jpg"
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
        </div>
    </section>
</div>
</body>
</html>

