<%@ page import="com.example.qcan.model.bean.Account" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/4/2023
  Time: 8:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit profile</title>
    <link rel="stylesheet" type="text/css" href="css/nologin.css">
    <link rel="stylesheet" type="text/css" href="css/header.css">
    <link rel="stylesheet" type="text/css" href="css/layout.css">
    <link rel="stylesheet" type="text/css" href="css/content.css">
    <link rel="stylesheet" type="text/css" href="css/editProfile.css">
    <link rel="stylesheet" type="text/css" href="css/global.css">
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
    if (isLogin != null && isLogin == true && user!= null) {
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
                <a href="UserController" class="header__control--button-container">
                    <!-- active -->
                    <!-- <i
                      style="color: #ccc"
                      class="bx bx-user header__control--button"
                    ></i> -->
                    <!-- non active -->
                    <i style="color:black" class="bx bxs-user header__control--button"></i>
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
    <section class="main">
        <div class="main__content">
            <form onsubmit="return handleSubmit()" method="post" action="UserController?Action=Update&Id=<%=user.getId()%>" class="edit-profile__container">
                <div class="edit-profile__ele">
                    <span class="edit-profile__field"> Username </span>
                    <div class="edit-profile__value ">
                        <i class="bx bx-lock-alt"></i>
                        <input readonly name="username" id="username" value="<%=user.getUsername()%>" class="edit-profile__value--input edit-profile__username" type="text"/>
                    </div>
                </div>
                <div class="edit-profile__ele">
                    <span class="edit-profile__field"> Fullname </span>
                    <div class="edit-profile__value">
                        <i class="bx bx-plus"></i>
                        <input onchange="handleChange()"  name="fullname" id="fullname" value="<%=user.getFullname()%>" class="edit-profile__value--input" type="text"/>
                    </div>
                </div>
                <div class="edit-profile__ele">
                    <span class="edit-profile__field"> Nickname </span>
                    <div class="edit-profile__value">
                        <i class="bx bx-plus"></i>
                        <input onchange="handleChange()"  name="nickname" id="nickname" value="<%=user.getNickname()%>" class="edit-profile__value--input" type="text"/>
                    </div>
                </div>
                <div class="edit-profile__ele">
                    <span class="edit-profile__field"> Email </span>
                    <div class="edit-profile__value">
                        <i class="bx bx-plus"></i>
                        <input onchange="handleChange()"  name="email" id="email" value="<%=user.getEmail()%>" class="edit-profile__value--input" type="text"/>
                    </div>
                </div>
                <div class="edit-profile__ele">
                    <span class="edit-profile__field"> Bio </span>
                    <div class="edit-profile__value">
                        <i class="bx bx-plus"></i>
                        <input  onchange="handleChange()" name="bio" id="bio" value="<%if(user.getBio()!=null){%><%=user.getBio()%><%}%>" class="edit-profile__value--input" type="text"/>
                    </div>
                </div>
                <div class="edit-profile__ele">
                    <span class="edit-profile__field"> Instagram </span>
                    <div class="edit-profile__value">
                        <i class="bx bx-plus"></i>
                        <input onchange="handleChange()"  name="instagram" id="instagram" value="<%if(user.getLinkIns()!=null){%><%=user.getLinkIns()%><%}%>" class="edit-profile__value--input" type="text"/>
                    </div>
                </div>
                <div class="edit-profile__ele">
                    <span class="edit-profile__field"> Facebook </span>
                    <div class="edit-profile__value">
                        <i class="bx bx-plus"></i>
                        <input  onchange="handleChange()"  name="facebook" id="facebook" value="<%if(user.getLinkFB()!=null){%><%=user.getLinkFB()%><%}%>" class="edit-profile__value--input" type="text"/>
                    </div>
                </div>
                <label for="edit-profile__avatar--input" class="edit-profile__avatar-container">
                    <input id="edit-profile__avatar--input" onchange="handleChangeImage()" hidden type="file" accept=".png, .jpg, .jpeg">
                    <img class="edit-profile__avatar--image"
                         src="<%if(user.getAvatar()!=null){%><%=user.getAvatar().replace(' ','+')%><%}%>"
                         alt="">
                    <input hidden name="avatar" id="avatar" type="text" value="<%if(user.getAvatar()!=null){%><%=user.getAvatar().replace(' ','+')%><%}%>"/>
                </label>
                <div>
                    <p class="edit-profile__error"><% if(request.getParameter("error")!= null ){%><%=(String) request.getParameter("error")%><%}%></p>
                </div>
                <div>
                    <button class="edit-profile__button">Update</button>
                </div>

            </form>
        </div>
    </section>
</div>
<script>
    let username = document.querySelector("#username")
    let password = document.querySelector("#password")
    let email = document.querySelector("#email")
    let fullname = document.querySelector("#fullname")
    let nickname = document.querySelector("#nickname")
    let avatar = document.querySelector("#avatar")
    let p_text_error = document.querySelector(".edit-profile__error")
    let image = document.querySelector(".edit-profile__avatar--image")

    const validateEmail = (email) => {
        return String(email)
            .toLowerCase()
            .match(
                /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|.(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
            );
    };


    function handleSubmit()
    {
        if(fullname.value =="" ||nickname.value =="" || email.value =="")
        {
            p_text_error.innerHTML= "Fullname, nickname, email cannot be empty!"
            return false
        }
        if(!validateEmail(email.value))
        {
            p_text_error.innerHTML= "Email invalid!"
            return false
        }
        return true
    }
    function handleChange()
    {
        p_text_error.innerHTML = ""
    }
    const fileInput = document.getElementById('edit-profile__avatar--input');

    function handleChangeImage() {
        p_text_error.innerHTML = "";

        if (fileInput.files && fileInput.files[0]) {
            const reader = new FileReader();

            // Set up the event listener for when the file is loaded
            reader.onload = function (e) {
                // Check if the file is a PNG or an image
                if (fileInput.files[0].type === 'image/png' || fileInput.files[0].type.startsWith('image/')) {
                    // Return the base64 representation of the image
                    // console.log(e.target.result);

                    avatar.value = e.target.result;
                    image.src = e.target.result;
                } else {
                    // File is not a PNG or an image, return null
                    p_text_error.innerHTML = "Invalid file type. Please select a PNG or an image file.";
                }
            };

            // Read the file as a data URL
            reader.readAsDataURL(fileInput.files[0]);
        }
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
