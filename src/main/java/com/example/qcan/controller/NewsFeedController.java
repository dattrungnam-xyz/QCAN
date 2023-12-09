package com.example.qcan.controller;

import com.example.qcan.model.bean.Account;
import com.example.qcan.model.bean.Post;
import com.example.qcan.model.bo.CheckLoginBO;
import com.example.qcan.model.bo.PostBO;
import com.example.qcan.model.bo.UserBO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/NewsFeedController")
public class NewsFeedController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String Type = (String) request.getParameter("Type");
        PostBO postBO = new PostBO();
        String destination = "";
        if(Type == null)
        {
            ArrayList<Post> listPost =  postBO.getPostByTime();
            request.setAttribute("listPost",listPost);
            destination = "/viewAllNewsFeed.jsp";
        }
        else if(Type.equals("Followed"))
        {
            HttpSession session = request.getSession();
            Boolean isLogin = (Boolean) session.getAttribute("isLogin");
            if(isLogin == null)
            {
                destination = "/nologin.jsp";
            }

            else {
                Account user = (Account) session.getAttribute("user");
                ArrayList<Post> listPost =  postBO.getListPostByIdFler(user.getId());
                request.setAttribute("listPost",listPost);
                destination = "/viewAllNewsFeedFollowed.jsp";
            }

        }

        RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
        rd.forward(request,response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doGet(request,response);
    }

}
