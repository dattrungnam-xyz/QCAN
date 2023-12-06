package com.example.qcan.controller;

import com.example.qcan.model.bo.FollowBO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
@WebServlet("/FollowController")
public class FollowController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String Action = (String) request.getParameter("Action");
        FollowBO followBO = new FollowBO();
        if(Action.equals("Follow"))
        {
            HttpSession session = request.getSession();
            int IdSession = (int)session.getAttribute("id");
            String Id = (String) request.getParameter("Id");
            if(Id != null && Integer.parseInt(Id) != IdSession)
            {
                followBO.follow(IdSession,Integer.parseInt(Id));
            }

        } else if (Action.equals("Unfollow")) {
            HttpSession session = request.getSession();
            int IdSession = (int)session.getAttribute("id");
            String Id = (String) request.getParameter("Id");
            if(Id != null && Integer.parseInt(Id) != IdSession)
            {
                followBO.unFollow(IdSession,Integer.parseInt(Id));
            }
        }
        HttpSession session = request.getSession();
        int currentIdUser = (int) session.getAttribute("currentUserView");
        session.removeAttribute("currentUserView");
        String destination = "/UserController?Id="+currentIdUser;
        response.sendRedirect(request.getContextPath()+destination);
    }
}
