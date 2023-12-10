<%@ page import="java.util.List" %>
<%@ page import="com.example.qcan.model.bean.Account" %>
<%@ page import="org.apache.commons.lang3.StringUtils" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Phê duyệt đăng bài người dùng</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 20px;
      background-color: #f8f9fa;
    }

    h2 {
      color:  #737373;
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

    .button-container {
      width: 250px;
      display: flex;
      justify-content: space-between;
      margin-top: 10px;
    }

    .approve-button, .unapprove-button {
      background-color: #d9534f;
      color: white;
      padding: 8px 15px;
      border: none;
      border-radius: 3px;
      cursor: pointer;
    }

    .approve-button:hover, .unapprove-button:hover {
      background-color: #c9302c;
    }

    hr {
      border: 0;
      height: 1px;
      background: #ddd;
      margin: 15px 0;
    }
  </style>

<body>
<h2>Xóa, mở người dùng quy phạm</h2>

<table>
  <tr>
    <th>ID</th>
    <th>Username</th>
    <th>Email</th>
    <th>Fullname</th>
    <th>Nickname</th>
    <th>Bio</th>
    <th>Avatar</th>
    <th>Role</th>
    <th>LinkFB</th>
    <th>LinkIns</th>
    <th>IsRemove</th>
    <th>requestRole</th>
    <th>Actions</th>
  </tr>

  <%
    List<Account> userList = (List<Account>) request.getAttribute("userList");
    for (Account user : userList) {
  %>
  <tr>
    <td><%= user.getId() %></td>
    <td><%= user.getUsername() %></td>
    <td><%= StringUtils.defaultString(user.getEmail(), "") %></td>
    <td><%= StringUtils.defaultString(user.getFullname(), "") %></td>
    <td><%= StringUtils.defaultString(user.getNickname(), "") %></td>
    <td><%= StringUtils.defaultString(user.getBio(), "") %></td>
    <td><%= StringUtils.defaultString(user.getAvatar(), "") %></td>
    <td><%= StringUtils.defaultString(user.getRole(), "") %></td>
    <td><%= StringUtils.defaultString(user.getLinkFB(), "") %></td>
    <td><%= StringUtils.defaultString(user.getLinkIns(), "") %></td>
    <td><%= user.getisRemove() %></td>
    <td><%= user.getRequestRole() %></td>
    <td>
      <div class="button-container">
        <!-- Nút phê duyệt -->
        <form action="AdminController" method="post">
          <input type="hidden" name="action" value="bnt_approve_user_post">
          <input type="hidden" name="userId" value="<%=user.getId() %>">
          <button type="submit" class="approve-button">Phê duyệt</button>
        </form>

        <!-- Nút không phê duyệt -->
        <form action="AdminController" method="post">
          <input type="hidden" name="action" value="bnt_unapprove_user_post">
          <input type="hidden" name="userId" value="<%=user.getId() %>">
          <button type="submit" class="unapprove-button">Không phê duyệt</button>
        </form>
      </div>
    </td>
  </tr>
  <%
    }
  %>
</table>
</body>

</html>