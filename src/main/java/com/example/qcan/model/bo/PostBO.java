package com.example.qcan.model.bo;

import com.example.qcan.model.bean.Post;
import com.example.qcan.model.dao.PostDAO;

import java.util.ArrayList;

public class PostBO {
    PostDAO postDAO = new PostDAO();
    public void createPost(Post post)
    {
         postDAO.createPost(post);
    }
    public void updatePost(Post post)
    {
        postDAO.updatePost(post);
    }
    public Post getPostByIdPost(int idPost)
    {
        return postDAO.getPostByIdPost(idPost);
    }
    public boolean checkPermission(int IdPost,int IdUser)
    {
        return postDAO.checkPermission(IdPost,IdUser);
    }
    public void deletePost(int IdPost)
    {
        postDAO.deletePost(IdPost);
    }

    public ArrayList<Post> getListPostByIdFler(int idFler){
        return postDAO.getListPostByIdFler(idFler);
    }
    public ArrayList<Post> getPostByIdUser(int idUser){
        return postDAO.getListPostByIdUser(idUser);
    }
    public ArrayList<Post> getPostByTime(){
        return postDAO.getListPostByTimeDES();
    }
}
