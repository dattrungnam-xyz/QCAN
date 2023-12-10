package com.example.qcan.controller;


import com.cloudinary.*;
import com.cloudinary.utils.ObjectUtils;

import java.io.File;
import java.util.Map;
import java.io.ByteArrayOutputStream;

import com.example.qcan.model.bean.Account;
import com.example.qcan.model.bean.Post;
import com.example.qcan.model.bo.PostBO;
import com.example.qcan.model.bo.UserBO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.InputStream;

@WebServlet("/PostController")
@MultipartConfig(maxFileSize = 1024 * 1024 * 50, // 50 MB
        maxRequestSize = 1024 * 1024 * 55)

public class PostController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String Action = (String) request.getParameter("Action");
        if (Action == null) {
            viewFormCreate(request, response);
        } else if (Action.equals("Update")) {

            viewFormUpdate(request, response);
        } else if (Action.equals("Create"))
        {
            viewFormCreate(request, response);
        }
        else if (Action.equals("Delete"))
        {
            viewFormDelete(request, response);
        }


    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String Action = (String) request.getParameter("Action");
        if (Action.equals("Create")) {
            createPost(request, response);
        } else if (Action.equals("Update")) {
            updatePost(request, response);
        }
        else if (Action.equals("Delete")) {
            deletePost(request, response);
        }


    }

    private byte[] toByteArray(InputStream inputStream) throws IOException {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        byte[] buffer = new byte[1024];
        int len;
        while ((len = inputStream.read(buffer)) > -1) {
            byteArrayOutputStream.write(buffer, 0, len);
        }
        byteArrayOutputStream.flush();
        return byteArrayOutputStream.toByteArray();
    }

    private void createPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Post post = new Post();
        Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
                "cloud_name", "drao7atge",
                "api_key", "843756788835187",
                "api_secret", "sxKBzMn11B_lOGWdPNe1qE45CN4"));
        InputStream inputStream = null;
        Part filePart = request.getPart("videoInput");
        inputStream = filePart.getInputStream();

        byte[] videoBytes = inputStream.readAllBytes();

//        byte[] bytes = toByteArray(inputStream);

        Map<?, ?> uploadResult = cloudinary.uploader().upload(videoBytes, ObjectUtils.asMap("resource_type", "video"));

        // Handle Cloudinary response (e.g., update database, display success message)
        String videoUrl = (String) uploadResult.get("secure_url");


        String songName = request.getParameter("songName");
        String songType = request.getParameter("songType");
        String musician = request.getParameter("musician");
        String postContent = request.getParameter("postContent");


        HttpSession session = request.getSession();
        int idUser = (int) session.getAttribute("id");

        post.setIdUser(idUser);
        post.setSongName(songName);
        post.setSongType(songType);
        post.setMusician(musician);
        post.setPostContent(postContent);
        post.setVideoUrl(videoUrl);

        PostBO postBO = new PostBO();
        postBO.createPost(post);
        String destination = null;
        destination = "/PostController?message=Upload post success!";
        response.sendRedirect(request.getContextPath() + destination);
    }

    private void updatePost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Post post = new Post();

        String IdPost = (String) request.getParameter("IdPost");
        HttpSession session = request.getSession();
        int idUser = (int) session.getAttribute("id");
        PostBO postBO = new PostBO();

        if(IdPost != null && postBO.checkPermission(Integer.parseInt(IdPost),idUser) )
        {
            Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
                    "cloud_name", "drao7atge",
                    "api_key", "843756788835187",
                    "api_secret", "sxKBzMn11B_lOGWdPNe1qE45CN4"));
            InputStream inputStream = null;
            Part filePart = request.getPart("videoInput");
            inputStream = filePart.getInputStream();
            byte[] videoBytes = inputStream.readAllBytes();
            Map<?, ?> uploadResult = cloudinary.uploader().upload(videoBytes, ObjectUtils.asMap("resource_type", "video"));

            // Handle Cloudinary response (e.g., update database, display success message)
            String videoUrl = (String) uploadResult.get("secure_url");


            String songName = request.getParameter("songName");
            String songType = request.getParameter("songType");
            String musician = request.getParameter("musician");
            String postContent = request.getParameter("postContent");

            post.setIdPost(Integer.parseInt(IdPost));
            post.setIdUser(idUser);
            post.setSongName(songName);
            post.setSongType(songType);
            post.setMusician(musician);
            post.setPostContent(postContent);
            post.setVideoUrl(videoUrl);


            postBO.updatePost(post);
            String destination = null;
            destination = "/PostController?Action=Update&IdPost="+IdPost+"&message=Upload post success!";
            response.sendRedirect(request.getContextPath() + destination);
        }
        else {
            String destination = null;
            //redirect sang no permission

            destination = "/noPermission.jsp";
            response.sendRedirect(request.getContextPath() + destination);
        }

    }
    private void viewFormCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String destination = "/postStatus.jsp";
        HttpSession session = request.getSession();
        Account user = (Account) session.getAttribute("user");
        request.setAttribute("user", user);
        if(user.getRole().equals("musician"))
        {
             destination = "/postStatus.jsp";
        }
        else {
            destination = "/noPermission.jsp";
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
        rd.forward(request, response);
    }

    private void viewFormUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String IdPost = (String) request.getParameter("IdPost");

        if (IdPost != null) {
            PostBO postBO = new PostBO();
            Post post = postBO.getPostByIdPost(Integer.parseInt(IdPost));
            HttpSession session = request.getSession();
            Account user = (Account)session.getAttribute("user");
            String destination = null;
            if(post.getIdUser() == user.getId())
            {
                 destination = "/formUpdatePost.jsp";

                request.setAttribute("user", user);
                request.setAttribute("post", post);
            }
            else
            {
                request.setAttribute("user", user);
                destination = "/noPermission.jsp";
            }

            RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
            rd.forward(request, response);
        }

    }
    private void viewFormDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String IdPost = (String) request.getParameter("IdPost");

        if (IdPost != null) {
            PostBO postBO = new PostBO();
            Post post = postBO.getPostByIdPost(Integer.parseInt(IdPost));
            HttpSession session = request.getSession();
            Account user = (Account)session.getAttribute("user");
            String destination = null;
            if(post.getIdUser() == user.getId())
            {
                destination = "/formDeletePost.jsp";

                request.setAttribute("user", user);
                request.setAttribute("post", post);
            }
            else
            {
                request.setAttribute("user", user);
                destination = "/noPermission.jsp";
            }

            RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
            rd.forward(request, response);
        }

    }
    private void deletePost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Post post = new Post();

        String IdPost = (String) request.getParameter("IdPost");
        HttpSession session = request.getSession();
        int idUser = (int) session.getAttribute("id");
        PostBO postBO = new PostBO();

        if(IdPost != null && postBO.checkPermission(Integer.parseInt(IdPost),idUser) )
        {
            postBO.deletePost(Integer.parseInt(IdPost));
            String destination = null;
            destination = "/UserController";
            response.sendRedirect(request.getContextPath() + destination);
        }
        else {
            String destination = null;
            //redirect sang no permission

            destination = "/noPermission.jsp";
            response.sendRedirect(request.getContextPath() + destination);
        }

    }
}
