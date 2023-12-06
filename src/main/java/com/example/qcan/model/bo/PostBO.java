package com.example.qcan.model.bo;

import com.example.qcan.model.bean.Post;
import com.example.qcan.model.dao.PostDAO;

public class PostBO {
    PostDAO postDAO = new PostDAO();
    public void createPost(Post post)
    {
         postDAO.createPost(post);
    }
}
