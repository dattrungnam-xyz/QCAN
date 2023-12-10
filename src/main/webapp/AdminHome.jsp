<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Trang chủ</title>
    <style>
        *{
            box-shadow: 0 0 30px #fff;
            border-radius: 10px;
        }

        .khung1,.khung2,.khung3{
            border: none;
        }
        .khung1{
            width: 100%;
        }
        .khung2,.khung4{
            width: 20%;
        }
        .khung3{
            width: 79.3%;
        }
        .khung2,.khung3{
            height: 570px;
        }

    </style>
</head>
<body>
<iframeset>
    <iframe name="khung1" src="T1.jsp" class="khung1"></iframe>
    <iframeset>
        <iframe name="khung2" src="T2.jsp" class="khung2"></iframe>
        <iframe name="khung3" src="T3.jsp" class="khung3"></iframe>
    </iframeset>
</iframeset>
</body>
</html>