package com.example.qcan.controller;

import com.example.qcan.model.bean.Account;
import com.example.qcan.model.bean.Follow;
import com.example.qcan.model.bo.FollowBO;
import com.example.qcan.model.bo.UserBO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ListFollowAndFollowed", value = "/ListFollowAndFollowed")
public class ListFollowAndFollowed extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String Action = (String) request.getParameter("Action");
        int ID = Integer.parseInt(request.getParameter("ID"));
        FollowBO followBO = new FollowBO();
        ArrayList<Follow> list = new ArrayList<Follow>();
        UserBO user = new UserBO();
        ArrayList<Account> listacc = new ArrayList<Account>();
        if(Action.equals("GetFollowed"))
        {
            list = followBO.listFollowed(ID);

            for (Follow fl : list){
//                System.out.println(fl.getIdFLed());
                Account getUser = new Account();
                getUser = user.getUser(fl.getIdFLed());
                System.out.println(getUser.getFullname());
                listacc.add(getUser);
            }


        } else if (Action.equals("GetFollower")) {
            list = followBO.listFollower(ID);

            for (Follow fl : list){
//                System.out.println(fl.getIdFler());
                Account getUser = new Account();
                getUser = user.getUser(fl.getIdFler());
                System.out.println(getUser.getFullname());
                listacc.add(getUser);
            }
        }
    }
}
