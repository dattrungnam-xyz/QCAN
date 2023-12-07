<%@ page import="com.example.qcan.model.bean.Account" %>
<%@ page import="com.example.qcan.model.bean.Post" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/7/2023
  Time: 2:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Post Status</title>
    <link rel="stylesheet" type="text/css" href="css/header.css">
    <link rel="stylesheet" type="text/css" href="css/layout.css">
    <link rel="stylesheet" type="text/css" href="css/content.css">
    <link rel="stylesheet" type="text/css" href="css/search.css">
    <link rel="stylesheet" type="text/css" href="css/nologin.css">
    <link rel="stylesheet" type="text/css" href="css/post.css">
    <link rel="stylesheet" type="text/css" href="css/postStatus.css">
    <link rel="stylesheet" type="text/css" href="css/editProfile.css">
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


<%
    Account user = (Account) request.getAttribute("user");
    Post post = (Post) request.getAttribute("post");
    session = request.getSession();
    Boolean isLogin = (Boolean) session.getAttribute("isLogin");
    if (isLogin != null && isLogin == true && user != null) {
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

        <form   class="edit-profile__container post__status--form" onsubmit="return handleSubmit()" method="post"  action="PostController?Action=Update&IdPost=<%=post.getIdPost()%>" enctype="multipart/form-data"
        >
            <h1 style="font-family:sans-serif; text-transform: uppercase; font-size: 20px; font-weight: bold">Update Post</h1>
            <div class="post__status--container">
                <div class="post__status--container-left">
                    <div class="edit-profile__ele">
                        <span class="edit-profile__field">Song Name </span>
                        <div class="edit-profile__value">
                            <i class="bx bx-music"></i>
                            <input
                                    class="edit-profile__value--input edit-profile__username"
                                    type="text"
                                    id="songName"
                                    name="songName"
                                    onchange="handleChange()"
                                    value="<% if(post.getSongName()!= null ){%><%=post.getSongName()%><%}%>"
                            />
                        </div>
                    </div>
                    <div class="edit-profile__ele">
                        <span class="edit-profile__field"> Song Type </span>
                        <div class="edit-profile__value">
                            <i class="bx bx-plus"></i>
                            <input class="edit-profile__value--input"
                                   id="songType"
                                   name="songType"
                                   onchange="handleChange()"
                                   type="text"
                                   value="<% if(post.getSongType()!= null ){%><%=post.getSongType()%><%}%>"
                            />
                        </div>
                    </div>
                    <div class="edit-profile__ele">
                        <span class="edit-profile__field">Musician</span>
                        <div class="edit-profile__value">
                            <i class="bx bx-plus"></i>
                            <input
                                    name="musician"
                                    id="musician"
                                    class="edit-profile__value--input"
                                    onchange="handleChange()"
                                    type="text"
                                    value="<% if(post.getMusician()!= null ){%><%=post.getMusician()%><%}%>"
                            />
                        </div>
                    </div>
                    <div class="edit-profile__ele">
                        <span class="edit-profile__field"> Post Content </span>
                        <div
                                style="align-items: flex-start !important"
                                class="edit-profile__value"
                        >
                            <i class="bx bx-plus"></i>
                            <textarea
                                    name="postContent"
                                    id="postContent"
                                    rows="7"
                                    class="edit-profile__value--input"
                                    type="text"

                                    onchange="handleChange()"
                            ><% if(post.getPostContent()!= null ){%><%=post.getPostContent()%><%}%></textarea>
                        </div>
                    </div>
                </div>

                <div class="post__status--container-right">
                    <div class="edit-profile__ele">
                        <span class="edit-profile__field"> Video </span>
                        <div class="edit-profile__value">

                            <input
                                    onchange="convertAndDisplayVideo()"
                                    type="file"
                                    id="videoInput"
                                    name="videoInput"
                                    accept="video/*"
                                    class="edit-profile__value--input"
                            />
                        </div>
                    </div>
                    <div class="edit-profile__ele">
                        <span class="edit-profile__field"> Preview video </span>
                        <div class="edit-profile__value">
                            <video src="<% if(post.getVideoUrl()!= null ){%><%=post.getVideoUrl()%><%}%>" style="width: 100%" id="displayVideo" controls></video>
                        </div>
                    </div>
                </div>
            </div>

            <div>
                <p class="edit-profile__error"></p>
            </div>
            <div>
                <p class="edit-profile__success"> <% if(request.getParameter("message")!= null ){%><%=(String) request.getParameter("message")%><%}%> </p>
            </div>
            <div>
                <button class="edit-profile__button">Update</button>
            </div>
        </form>
    </section>
</div>
<script>


    <%-- async   function uploadVideoToCloudinary(videoFile) {--%>
    <%--        const cloudName  = 'drao7atge';--%>
    <%--        const uploadPreset  = 'vdmxwrl2';--%>
    <%--        const apiKey  = '843756788835187';--%>
    <%--     const cloudinaryURL = `https://api.cloudinary.com/v1_1/${cloudName}/video/upload`;--%>
    <%--        try {--%>
    <%--            const formData = new FormData();--%>
    <%--            formData.append('file', videoFile);--%>
    <%--            formData.append('upload_preset', uploadPreset);--%>

    <%--            const response = await fetch(cloudinaryURL, {--%>
    <%--                method: 'POST',--%>
    <%--                body: formData,--%>
    <%--                headers: {--%>
    <%--                    'Content-Type' : 'application/x-www-form-urlencoded; charset=UTF-8',--%>

    <%--                    Authorization: 'Basic ' + btoa(apiKey + ':' + "sxKBzMn11B_lOGWdPNe1qE45CN4"),--%>
    <%--                },--%>
    <%--            });--%>

    <%--            const responseData = await response.json();--%>

    <%--            if (responseData.secure_url) {--%>
    <%--                return responseData.secure_url;--%>
    <%--            } else {--%>
    <%--                throw new Error('Upload failed');--%>
    <%--            }--%>
    <%--        } catch (error) {--%>
    <%--            console.error('Error uploading video to Cloudinary:', error.message);--%>
    <%--            throw error;--%>
    <%--        }--%>
    <%--    }--%>


    async function convertAndDisplayVideo() {
        let input = document.getElementById("videoInput");
        let file = input.files[0];

        if (file) {
            var reader = new FileReader();

            reader.onload = function (e) {
                var binaryData = e.target.result;

                displayVideo(binaryData);
            };

            reader.readAsArrayBuffer(file);
        } else {
            console.error("No file selected");
        }


        //
        // if(file)
        // {
        //     try {
        //         const cloudinaryURL = await uploadVideoToCloudinary(file);
        //         console.log('Video uploaded to Cloudinary:', cloudinaryURL);
        //         document.getElementById("videoUrl").value = cloudinaryURL
        //
        //     } catch (error) {
        //         console.error('Failed to upload video:', error);
        //     }
        // }
    }

    function displayVideo(binaryData) {
        var blob = new Blob([binaryData], {type: "video/*"});
        var videoElement = document.getElementById("displayVideo");

        // Create a blob URL from the Blob
        var blobURL = URL.createObjectURL(blob);

        // Set the blob URL as the source of the video element
        videoElement.src = blobURL;
    }



    function handleChange() {
        let error = document.querySelector(".edit-profile__error")
        let success = document.querySelector(".edit-profile__success")
        error.innerHTML = ""
        success.innerHTML = ""
    }




    function  handleSubmit() {
        let songName = document.getElementById("songName")
        let songType = document.getElementById("songType")
        let musician = document.getElementById("musician")
        let postContent = document.getElementById("postContent")
        let error = document.querySelector(".edit-profile__error")



        if (songName.vale == "" || songType.value == "" || musician.value == "" || postContent.value == "") {
            error.innerHTML = "Song Name, Song Type, Musician, Post content cannot be empty!"
            return false
        }

        return true
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
