package com.example.qcan.model.bo;

import com.example.qcan.model.bean.Post;
import com.example.qcan.model.dao.PostDAO;

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
    public boolean checkPermissionUpdate(int IdPost,int IdUser)
    {
        return postDAO.checkPermissionUpdate(IdPost,IdUser);
    }
}
