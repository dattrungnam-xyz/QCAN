package com.example.qcan.controller;

import com.example.qcan.model.bean.Account;
import com.example.qcan.model.bo.UserBO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/UserManagementServlet")
public class UserManagementServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }

        switch (action) {
            case "delete_user":
                showDeleteForm(request, response);
                break;

            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                break;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }

        switch (action) {
            case "delete":
                deleteUser(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                break;
        }
    }

    private void showDeleteForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy danh sách người dùng từ cơ sở dữ liệu
        UserBO userBO = new UserBO();
        List<Account> userList = userBO.getAllUsers();

        // Đặt danh sách người dùng vào request attribute để truyền cho JSP
        request.setAttribute("userList", userList);

        // Chuyển hướng đến trang DeleteUserForm.jsp
        request.getRequestDispatcher("/DeleteUserForm.jsp").forward(request, response);
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy thông tin về người dùng cần xóa từ request
        int userId = Integer.parseInt(request.getParameter("userId"));

        // Gọi phương thức xóa người dùng từ UserBO hoặc UserDAO
        UserBO userBO = new UserBO();
        boolean deleted = userBO.deleteUserById(userId);

        // Chuyển hướng đến trang hiển thị sau khi xóa (ví dụ: trang chính của admin)
        response.sendRedirect("AdminHome.jsp");
    }
}