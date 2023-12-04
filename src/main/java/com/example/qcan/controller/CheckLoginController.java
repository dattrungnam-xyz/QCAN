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
        rd.forward(request,response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String destination = null;
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        CheckLoginBO checkLoginBo = new CheckLoginBO();
        UserBO userBO = new UserBO();
        Boolean isValidUser = null;

        isValidUser = checkLoginBo.isValidUser(username,password);
        if(isValidUser)
        {
            Account user = userBO.getAccount(username);
            HttpSession session = request.getSession();
            session.setAttribute("isLogin", true);
            session.setAttribute("id", user.getId());
            session.setAttribute("username", user.getUsername());



            request.setAttribute("user",user);
            destination = "/index.jsp";
            RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
            rd.forward(request,response);
        }
        else
        {
            destination = "/login.jsp";
            RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
            rd.forward(request,response);
        }
    }

}
