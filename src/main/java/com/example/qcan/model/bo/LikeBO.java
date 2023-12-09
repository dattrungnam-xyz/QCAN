package com.example.qcan.model.bo;

import com.example.qcan.model.bean.Like;
import com.example.qcan.model.dao.LikeDAO;

public class LikeBO {
    private LikeDAO likeDAO;

    public LikeBO() {
        this.likeDAO = new LikeDAO();
    }

    public void likePost(int userId, int postId) {
        likeDAO.likePost(userId, postId);
    }

    public void unlikePost(int userId, int postId) {
        likeDAO.unlikePost(userId, postId);
    }

    public int getLikeCount(int postId) {
        return likeDAO.getLikeCount(postId);
    }
}
