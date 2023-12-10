package com.example.qcan.controller;

import com.example.qcan.model.bean.Account;
import com.example.qcan.model.bean.Follow;
import com.example.qcan.model.bean.Post;
import com.example.qcan.model.bo.*;
import com.mysql.cj.Session;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/UserController")
public class UserController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String destination = null;
        UserBO userBO = new UserBO();
        PostBO postBO = new PostBO();
        FollowBO followBO = new FollowBO();
        String Action = (String) request.getParameter("Action");
        if(Action ==null)
        {
             session = request.getSession();

            int IdSession =0;

            if(session.getAttribute("id")!=null)
            {IdSession= (int)session.getAttribute("id");}
            String Id = (String) request.getParameter("Id");


            if(Id==null ||  (Id!=null && Integer.parseInt(Id) == IdSession) )
            {
                ArrayList<Follow> listFled = new ArrayList<Follow>();
                ArrayList<Follow> listFler = new ArrayList<Follow>();
                ArrayList<Account> listAccFled = new ArrayList<Account>();
                ArrayList<Account> listAccFler = new ArrayList<Account>();

                ArrayList<Post> listPost =  postBO.getPostByIdUser(IdSession);
                request.setAttribute("listPost",listPost);

                listFled = followBO.listFollowed(IdSession);
                for (Follow fl : listFled){
                    Account userFled = new Account();
                    userFled =userBO.getUser(fl.getIdFled());
                    listAccFled.add(userFled);
                }
                listFler = followBO.listFollower(IdSession);
                for (Follow fl : listFler){
                    Account userFler = new Account();
                    userFler =userBO.getUser(fl.getIdFler());
                    listAccFler.add(userFler);
                }
                request.setAttribute("listAccFled",listAccFled);
                request.setAttribute("listAccFler",listAccFler);

                Follow countFl = followBO.countFollow(IdSession);
                Follow countFler = followBO.countFollower(IdSession);

                request.setAttribute("countFl",countFl);
                request.setAttribute("countFler",countFler);

                destination = "/viewProfile.jsp";
            }
            else
            {
//                Account user = userBO.getAccount(username);


                ArrayList<Follow> listFled = new ArrayList<Follow>();
                ArrayList<Follow> listFler = new ArrayList<Follow>();
                ArrayList<Account> listAccFled = new ArrayList<Account>();
                ArrayList<Account> listAccFler = new ArrayList<Account>();

                listFled = followBO.listFollowed(Integer.parseInt(Id));
                for (Follow fl : listFled){
                    Account userFled = new Account();
                    userFled =userBO.getUser(fl.getIdFled());
                    listAccFled.add(userFled);
                }
                listFler = followBO.listFollower(Integer.parseInt(Id));
                for (Follow fl : listFler){
                    Account userFler = new Account();
                    userFler =userBO.getUser(fl.getIdFler());
                    listAccFler.add(userFler);
                }
                request.setAttribute("listAccFled",listAccFled);
                request.setAttribute("listAccFler",listAccFler);


                Account userOther = userBO.getUser(Integer.parseInt(Id));

                Follow countFl = followBO.countFollow(Integer.parseInt(Id));
                Follow countFler = followBO.countFollower(Integer.parseInt(Id));

                request.setAttribute("countFl",countFl);
                request.setAttribute("countFler",countFler);

                Follow isFl = followBO.checkFollow(IdSession,Integer.parseInt(Id));

                ArrayList<Post> listPost =  postBO.getPostByIdUser(Integer.parseInt(Id));
                request.setAttribute("listPost",listPost);

                request.setAttribute("isFl",isFl);
                request.setAttribute("userOther",userOther);
                destination = "/viewProfileUserOther.jsp";
            }
        }
        else if(Action.equals("Update"))
        {
             destination = "/editProfile.jsp";
        }
        else if (Action.equals("ChangePassword"))
        {
            destination = "/changePassword.jsp";
        }
        else if(Action.equals("RequestRole"))
        {

            destination = "/requestRole.jsp";
        }




        String username = (String)session.getAttribute("username");
        Account user = userBO.getAccount(username);
        request.setAttribute("user",user);

        RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
        rd.forward(request,response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String Action = (String)request.getParameter("Action");

        if(Action.equals("Update"))
        {
            updateUser(request,response);
        }else if(Action.equals("ChangePassword"))
        {
            changePassword(request,response);
        }
        else if(Action.equals("RequestRole"))
        {
            requestRole(request,response);
        }


    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
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
                    destination = "/UserController?Action=Update&error=Nickname already exist!";
                }
                if(!userBO.isValid(Integer.parseInt(Id),"email",Email))
                {
                    destination = "/UserController?Action=Update&error=Email already exist!";
                }
            }
            response.sendRedirect(request.getContextPath() + destination);
        }
    }
    private void changePassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String destination = null;
        String currentPassword = (String) request.getParameter("currentPassword");
        String newPassword = (String) request.getParameter("newPassword");
        String confirmPassword = (String) request.getParameter("confirmPassword");
        String Id = (String) request.getParameter("Id");
        UserBO userBO = new UserBO();
        if(!newPassword.equals(confirmPassword))
        {
            destination = "/UserController?Action=ChangePassword&error=New password and password confirm does not match!";
        }
        else {
           if(Id == null)
           {
               HttpSession session = request.getSession();
               Id = (String)session.getAttribute("id");
           }
            if(userBO.checkPassword(Integer.parseInt(Id),currentPassword ))
            {
                //update password
                userBO.updatePassword(Integer.parseInt(Id),newPassword);
                destination = "/UserController?Action=ChangePassword&message=Password Changed!";
            }
            else {
                destination = "/UserController?Action=ChangePassword&error=Current password incorrect!";
            }
        }
        response.sendRedirect(request.getContextPath() + destination);
    }
    private void requestRole(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

        UserBO userBO = new UserBO();
        String destination = null;
        HttpSession session = request.getSession();
        int Id =(int) session.getAttribute("id");
        Account user = userBO.getUser(Id);

        if(user.getRole().equals("musician"))
        {
            destination = "/UserController?Action=RequestRole&error=This account is already a musician account.";
        }
        else
        {
            userBO.requestRole(Id);
            destination = "/UserController?Action=RequestRole&message=Send request success.";
        }

        response.sendRedirect(request.getContextPath() + destination);
    }
}
