package com.example.qcan.controller;

import com.example.qcan.model.bean.Account;
import com.example.qcan.model.bean.Post;
import com.example.qcan.model.dao.SearchDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/SearchController")
public class SearchController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String destination = null;
        String Type = (String) request.getParameter("Type");
        if(Type != null && Type.equals("Account"))
        {
             destination = "/viewFormSearchUser.jsp";
        } else {
            destination = "/viewFormSearchPost.jsp";
        }


        RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
        rd.forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
            String table = (String) request.getParameter("table");
            String field = (String) request.getParameter("field");
            String value = (String) request.getParameter("value");
            System.out.println(table);
            System.out.println(field);
            System.out.println(value);

        SearchDAO searchDAO = new SearchDAO();
            if(table.equals("account"))
            {
                String destination = "/searchUserResult.jsp";
                ArrayList<Account> user = new ArrayList<Account>();
                user = searchDAO.searchUser(field,value);
                request.setAttribute("searchUserResult", user);
                request.setAttribute("field",field);
                request.setAttribute("value",value);
                RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
                rd.forward(request, response);
            }else if(table.equals("post"))
            {
                String destination = "/searchPostResult.jsp";
                ArrayList<Post> post = new ArrayList<Post>();
                post = searchDAO.searchPost(field,value);
                request.setAttribute("searchPostResult", post);
                request.setAttribute("field",field);
                request.setAttribute("value",value);
                RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
                rd.forward(request, response);
            }


    }
}
