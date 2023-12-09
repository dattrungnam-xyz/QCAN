package com.example.qcan.controller;

import com.example.qcan.model.bo.LikeBO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/LikeController")
public class LikeController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        int userId = Integer.parseInt(request.getParameter("userId"));
        int postId = Integer.parseInt(request.getParameter("postId"));

        LikeBO likeBO = new LikeBO();

        if ("like".equals(action)) {
            likeBO.likePost(userId, postId);
        } else if ("unlike".equals(action)) {
            likeBO.unlikePost(userId, postId);
        }

        int likeCount = likeBO.getLikeCount(postId);

        request.setAttribute("likeCount", likeCount);
        response.getWriter().write(String.valueOf(likeCount));
        request.getRequestDispatcher("/indexTemp.jsp").forward(request, response);
    }
}
