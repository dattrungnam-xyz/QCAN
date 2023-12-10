<%@ page import="com.example.qcan.model.bean.Post" %>
<%@ page import="java.util.List" %>
<%@ page import="org.apache.commons.lang3.StringUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>All Posts</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 20px;
      background-color: #f8f9fa;
    }

    h2 {
      color: #737373;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 15px;
    }

    th, td {
      border: 1px solid #ddd;
      padding: 10px;
      text-align: left;
    }

    th {
      background-color: #737373;
      color: white;
    }

    .delete-button {
      background-color: #d9534f;
      color: white;
      padding: 8px 15px;
      border: none;
      border-radius: 3px;
      cursor: pointer;
    }

    .delete-button:hover {
      background-color: #c9302c;
    }

    hr {
      border: 0;
      height: 1px;
      background: #ddd;
      margin: 15px 0;
    }
  </style>
</head>
<body>
<h2>Tất cả bài viết của người dùng</h2>

<table>
  <tr>
    <th>ID</th>
    <th>User ID</th>
    <th>Time</th>
    <th>Song Name</th>
    <th>Song Type</th>
    <th>Musician</th>
    <th>Post Content</th>
    <th>Video</th>
    <th>Action</th>
  </tr>

  <% List<Post> postList = (List<Post>)request.getAttribute("postList");
    for (Post post : postList) { %>
  <tr>
    <td><%= post.getIdPost() %></td>
    <td><%= post.getIdUser() %></td>
    <td><%= post.getPostTime()%></td>
    <td><%= StringUtils.defaultString(post.getSongName(), "") %></td>
    <td><%= StringUtils.defaultString(post.getSongType(), "") %></td>
    <td><%= StringUtils.defaultString(post.getMusician(), "") %></td>
    <td><%= StringUtils.defaultString(post.getPostContent(), "") %></td>
    <td><%= StringUtils.defaultString(post.getVideoUrl(), "") %></td>
    <td>
      <form action="AdminController" method="post">
        <input type="hidden" name="action" value="Admin_delete_post">
        <input type="hidden" name="postId" value="<%= post.getIdPost() %>">
        <input type="submit" class="delete-button" value="Delete">
      </form>
    </td>
  </tr>
  <% } %>
</table>
</body>
</html>