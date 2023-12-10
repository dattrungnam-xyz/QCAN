<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang chủ</title>

    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #f5f5f5;
        }
        button{
            width: 75px;
            height: 40px;
            border-color: black;
            border-radius: 5px;
            margin-top: 15px;
            margin-left: 100px;
            background-color: #d9534f;
            color: white;
            transition: background-color 0.5s, font-weight 0.5ms linear;
        }
        button:hover {
            font-weight: bold;
            background-color: #c9302c;
            cursor: pointer;
            opacity: 1;
        }

        .logout{
            color: white;
            text-decoration: none;
        }
    </style>
</head>
<body>
<table>
    <tr>
        <th>Actions</th>
    </tr>
    <tr>
        <td><a href="AdminController?action=Admin_delete_user"  target="khung3">Quản lý người dùng</a></td>
    </tr>
    <tr>
        <td><a href="AdminController?action=Admin_view_posts" target="khung3">Quản lý bài viết (Xóa bài viết)</a></td>
    </tr>
    <tr>
        <td><a href="AdminController?action=Admin_approve_posts" target="khung3">Quản lý bài viết ( Phê duyệt đăng bài)</a></td>
    </tr>
</table>

<button><a class="logout" href="LogOutController" target="AdminHome.jsp">Log out</a></button>
</body>
</html>
<%

%>