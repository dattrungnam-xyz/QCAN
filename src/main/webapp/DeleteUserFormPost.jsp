<%@ page import="java.util.List" %>
<%@ page import="com.example.qcan.model.bean.Account" %>
<%@ page import="com.example.qcan.model.bean.Post" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Xóa người dùng</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        h2 {
            color: #333;
        }

        p {
            margin-bottom: 5px;
        }

        hr {
            border: 0;
            height: 1px;
            background: #ddd;
            margin: 10px 0;
        }

        .delete-button {
            background-color: #d9534f;
            color: white;
            padding: 5px 10px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<h2>Xóa bài viết quy phạm</h2>

<%-- Lặp qua danh sách người dùng và hiển thị thông tin cần thiết --%>
<%
    List<Post> postList = (List<Post>) request.getAttribute("postList");
    for (Post post : postList) {
        
%>
<div>
    <p>ID Post: <%= post.getIdPost() %></p>
    <p>ID User: <%= post.getIdUser() %></p>
    <p>FullName: <%= post.getFullname() %></p>
    <p>NickName: <%= post.getNickname() %></p>
    <p>Musician: <%= post.getMusician() %></p>
    <p>SongName: <%= post.getSongName() %></p>
    <p>PostTime: <%= post.getPostTime() %></p>
    <p>PostContent: <%= post.getPostContent() %></p>
    <p>Video</p>
    <div class="main__status--image-contain">
        <video style="width: 50%;max-height: 500px" src="<% if(post.getVideoUrl()!= null ){%><%=post.getVideoUrl()%><%}%>" style="width: 100%" id="displayVideo" controls></video>
    </div>
<%--    <p>Email: <%= user.getEmail() %></p>--%>
<%--    <p>Fullname: <%= user.getFullname() %></p>--%>
<%--    <p>Nickname: <%= user.getNickname() %></p>--%>
<%--    <p>Bio: <%= user.getBio() %></p>--%>
<%--    <p>Avatar: <%= user.getAvatar() %></p>--%>
<%--    <p>Role: <%= user.getRole() %></p>--%>
<%--    <p>LinkFB: <%= user.getLinkFB() %></p>--%>
<%--    <p>LinkIns: <%= user.getLinkIns() %></p>--%>

    <!-- Thêm nút xóa cho mỗi người dùng -->
    <form action="PostManagementServlet" method="post">
        <input type="hidden" name="action" value="delete">
        <input type="hidden" name="postID" value="<%= post.getIdPost() %>">
        <button type="submit" class="delete-button">Xóa</button>
    </form>

    <hr>
</div>
<% } %>
</body>
</html>