package com.example.qcan.controller;


import com.example.qcan.model.bean.Account;
import com.example.qcan.model.bo.CheckLoginBO;
import com.example.qcan.model.bo.UserBO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/CheckLoginController")
public class CheckLoginController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String destination = "/login.jsp";
        RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        CheckLoginBO checkLoginBo = new CheckLoginBO();
        UserBO userBO = new UserBO();
        boolean isValidUser = checkLoginBo.isValidUser(username, password);

        if (isValidUser) {
            Account user = userBO.getAccount(username);
            HttpSession session = request.getSession();
            session.setAttribute("isLogin", true);
            session.setAttribute("id", user.getId());
            session.setAttribute("username", user.getUsername());

            System.out.println(user.getRole());

            // Set an attribute to indicate if the user is an admin
            if ("Admin".equals(user.getRole())) {
                session.setAttribute("Admin", true);
                response.sendRedirect("AdminHome.jsp");
                return; // Add return to exit the method after redirection
            } else {
                request.setAttribute("user", user);
                String destination = "/indexTemp.jsp";
                RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
                rd.forward(request, response);
            }
        } else {
            String destination = "/CheckLoginController?error=Username or password is incorrect!";
            response.sendRedirect(request.getContextPath() + destination);
        }
    }
}