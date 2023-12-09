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
    </style>
</head>
<body>
<h1>Admin</h1>

<table>
    <tr>
        <th>Actions</th>

    </tr>
    <tr>
        <td><a href="UserManagementServlet?action=delete_user">Quản lý người dùng</a></td>

    </tr>
    <tr>
        <td><a href="PostManagementServlet?action=delete_post">Quản lý bài viết</a></td>
<%--        --%>
    </tr>

</table>

</body>
</html>
<%

%>
