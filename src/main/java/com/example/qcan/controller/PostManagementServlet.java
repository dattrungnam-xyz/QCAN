package com.example.qcan.controller;

import com.example.qcan.model.bean.Account;
import com.example.qcan.model.bean.Post;
import com.example.qcan.model.bo.PostBO;
import com.example.qcan.model.bo.UserBO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "PostManagementServlet", value = "/PostManagementServlet")
public class PostManagementServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }

        switch (action) {
            case "delete_post":
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
                deletePost(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                break;
        }
    }

    private void showDeleteForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy danh sách người dùng từ cơ sở dữ liệu
        PostBO postBO = new PostBO();
        ArrayList<Post> postList = new ArrayList<Post>();

        postList = postBO.getPostByTime();

        // Đặt danh sách người dùng vào request attribute để truyền cho JSP
        request.setAttribute("postList", postList);

        // Chuyển hướng đến trang DeleteUserForm.jsp
        request.getRequestDispatcher("/DeleteUserFormPost.jsp").forward(request, response);
    }

    private void deletePost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy thông tin về người dùng cần xóa từ request
        int postId = Integer.parseInt(request.getParameter("postID"));

        // Gọi phương thức xóa người dùng từ UserBO hoặc UserDAO
        PostBO postBO = new PostBO();
        boolean deleted = postBO.deletePostById(postId);

        // Chuyển hướng đến trang hiển thị sau khi xóa (ví dụ: trang chính của admin)
        response.sendRedirect("AdminHome.jsp");
    }
}
