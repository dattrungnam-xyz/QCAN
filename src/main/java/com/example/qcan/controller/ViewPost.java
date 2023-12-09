package com.example.qcan.controller;

import com.example.qcan.model.bean.Account;
import com.example.qcan.model.bean.Follow;
import com.example.qcan.model.bean.Post;
import com.example.qcan.model.bo.FollowBO;
import com.example.qcan.model.bo.PostBO;
import com.example.qcan.model.bo.UserBO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ViewPost", value = "/ViewPost")
public class ViewPost extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String Action = (String) request.getParameter("Action");
        int ID = Integer.parseInt(request.getParameter("ID"));
        PostBO postBO = new PostBO();
        ArrayList<Post> list = new ArrayList<Post>();
        if(Action.equals("GetAllBaiDang"))
        {
            list = postBO.getPostByTime();
        } else if (Action.equals("GetPostIdFler")) { //lấy bài đăng mình follow
            list = postBO.getListPostByIdFler(ID);

        } else if (Action.equals("GetMyPost")) { //lấy bài đăng của mình
            list = postBO.getPostByIdUser(ID);

        }
    }
}
