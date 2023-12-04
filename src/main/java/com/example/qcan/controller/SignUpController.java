package com.example.qcan.controller;

import com.example.qcan.model.bean.Account;
import com.example.qcan.model.bo.CheckLoginBO;
import com.example.qcan.model.bo.SignUpBO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/SignUpController")
public class SignUpController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String destination = "/signup.jsp";
        RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
        rd.forward(request,response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String destination = null;
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String fullname = request.getParameter("fullname");
        String nickname = request.getParameter("nickname");

        SignUpBO signUpBO = new SignUpBO();

        Account user = new Account();
        user.setUsername(username);
        user.setPassword(password);
        user.setEmail(email);
        user.setNickname(nickname);
        user.setFullname(fullname);
        user.setRole("user");

        if(signUpBO.isValid("username",username) &&signUpBO.isValid("email",email) && signUpBO.isValid("nickname",nickname) )
        {
            signUpBO.createUser(user);
            destination = "/CheckLoginController";
        }
        else
        {

            if(!signUpBO.isValid("nickname",nickname))
            {
                destination = "/SignUpController?error=Nickname already exists!";
            }
            if(!signUpBO.isValid("email",email))
            {
                destination = "/SignUpController?error=Email already exists!";
            }
            if(!signUpBO.isValid("username",username))
            {
                destination = "/SignUpController?error=Username already exists!";
            }
        }

//        RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
//        rd.forward(request,response);
        response.sendRedirect(request.getContextPath() + destination);
//        CheckLoginBO checkLoginBo = new CheckLoginBO();
//
//        Boolean isValidUser = null;
//
//        isValidUser = checkLoginBo.isValidUser(username,password);
//        if(isValidUser)
//        {
//            Account user = checkLoginBo.getAccount(username);
//            HttpSession session = request.getSession();
//            session.setAttribute("isLogin", true);
//            session.setAttribute("id", user.getId());
//            session.setAttribute("tieusu", user.getBio());
//
//            session.setAttribute("username", user.getUsername());
//
//
//            request.setAttribute("user",user);
//            destination = "/index.jsp";
//            RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
//            rd.forward(request,response);
//        }
//        else
//        {
//            destination = "/login.jsp";
//            RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
//            rd.forward(request,response);
//        }
    }

}
