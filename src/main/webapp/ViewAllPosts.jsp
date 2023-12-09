<%@ page import="com.example.qcan.model.bean.Post" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>All Posts</title>
</head>
<body>
<h2>All Posts</h2>

<% List<Post> postList = (List<Post>)request.getAttribute("postList");
  for (Post post : postList) { %>
<div>
  <p>ID: <%= post.getIdPost() %></p>
  <p>User ID: <%= post.getIdUser() %></p>
  <p>Song Name: <%= post.getSongName() %></p>
  <p>Song Type: <%= post.getSongType() %></p>
  <p>Musican: <%= post.getMusician() %></p>
  <p>Post content: <%= post.getPostContent() %></p>
  <p>Video: <%= post.getVideoUrl() %></p>
  <form action="UserManagementServlet" method="post">
    <input type="hidden" name="action" value="Admin_delete_post">
    <input type="hidden" name="postId" value="<%= post.getIdPost() %>">
    <input type="submit" value="Delete">
  </form>
  <hr>
</div>
<% } %>

</body>
</html>
