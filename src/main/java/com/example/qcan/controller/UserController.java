package com.example.qcan.controller;

import com.example.qcan.model.bean.Account;
import com.example.qcan.model.bo.CheckLoginBO;
import com.example.qcan.model.bo.SignUpBO;
import com.example.qcan.model.bo.UserBO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/UserController")
public class UserController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String destination = null;

        String Action = (String) request.getParameter("Action");
        if(Action ==null)
        {
            destination = "/viewProfile.jsp";
        }
        else if(Action.equals("Update"))
        {
             destination = "/editProfile.jsp";
        }

        UserBO userBO = new UserBO();
        HttpSession session = request.getSession();
        String username = (String)session.getAttribute("username");
        Account user = userBO.getAccount(username);
        request.setAttribute("user",user);

        RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
        rd.forward(request,response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String Id = (String) request.getParameter("Id");
        String Email = (String) request.getParameter("email");
        String Nickname = (String) request.getParameter("nickname");
        String Avatar = (String) request.getParameter("avatar");

        UserBO userBO = new UserBO();
        String destination = null;
//        String password = request.getParameter("password");
        if(Id != null)
        {
            if(userBO.isValid(Integer.parseInt(Id),"email",Email) && userBO.isValid(Integer.parseInt(Id),"nickname",Nickname))
            {
                Account user = new Account();
                user.setId(Integer.parseInt(Id));
                user.setFullname(request.getParameter("fullname"));
                user.setNickname(request.getParameter("nickname"));
                user.setEmail(request.getParameter("email"));
                user.setBio(request.getParameter("bio"));
                user.setLinkIns(request.getParameter("instagram"));
                user.setLinkFB(request.getParameter("facebook"));
                user.setAvatar(Avatar);
                userBO.updateUser(user);
                destination = "/UserController";
                //update user
            }else {
                if(!userBO.isValid(Integer.parseInt(Id),"nickname",Nickname))
                {
                    destination = "/UserController?error=Nickname already exist!";
                }
                if(!userBO.isValid(Integer.parseInt(Id),"email",Email))
                {
                    destination = "/UserController?error=Email already exist!";
                }
            }
            response.sendRedirect(request.getContextPath() + destination);
        }
    }

}
