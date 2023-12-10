package com.example.qcan.controller;

import com.example.qcan.model.bean.Account;
import com.example.qcan.model.bean.Post;
import com.example.qcan.model.bo.PostBO;
import com.example.qcan.model.bo.UserBO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/AdminController")
public class AdminController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }

        switch (action) {
            case "Admin_delete_user":
                showDeleteForm(request, response);
                break;
            case "Admin_view_posts":
                viewAllPosts(request, response);
                break;
            case "Admin_approve_posts":
                showApproveForm(request, response);
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
            case "bnt_delete":
                deleteUser(request, response);
                break;
            case "bnt_reopen":
                reopenUser(request, response);
                break;
            case "Admin_delete_post":
                deletePost(request, response);
                break;
            case "bnt_approve_user_post":
                approveUser(request, response);
                break;
            case "bnt_unapprove_user_post":
                unapproveUser(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                break;
        }
    }

    private void showDeleteForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserBO userBO = new UserBO();
        List<Account> userList = userBO.getAllUsers();
        request.setAttribute("userList", userList);
        request.getRequestDispatcher("/DeleteUserForm.jsp").forward(request, response);
    }
    private void showApproveForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserBO userBO = new UserBO();
        List<Account> userList = userBO.getAllUsers();
        request.setAttribute("userList", userList);
        request.getRequestDispatcher("./viewAllPostsApprove.jsp").forward(request, response);
    }
    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        UserBO userBO = new UserBO();
        boolean deleted = userBO.deleteUserById(userId);
        response.sendRedirect("AdminHome.jsp");
    }

    //phe duyet dang bai user
    private void approveUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        UserBO userBO = new UserBO();
        boolean approve = userBO.approveUser(userId);
        response.sendRedirect("AdminHome.jsp");
    }
    //Khong phe duyet dang bai user
    private void unapproveUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        UserBO userBO = new UserBO();
        boolean unapprove = userBO.unapproveUser(userId);
        response.sendRedirect("AdminHome.jsp");
    }

    private void reopenUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        UserBO userBO = new UserBO();
        boolean reopen = userBO.reopenUserById(userId);
        response.sendRedirect("AdminHome.jsp");
    }
    private void viewAllPosts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PostBO postBO = new PostBO();
        List<Post> postList = postBO.getAllPosts();
        request.setAttribute("postList", postList);
        request.getRequestDispatcher("/ViewAllPosts.jsp").forward(request, response);
    }

    private void deletePost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int postId = Integer.parseInt(request.getParameter("postId"));
        PostBO postBO = new PostBO();
        postBO.deletePost(postId);
        response.sendRedirect("/ViewAllPosts.jsp");
    }
}