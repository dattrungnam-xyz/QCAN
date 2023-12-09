package com.example.qcan.model.bean;

public class LikePost {
    private int IdLike;
    private int IdPost;
    private int IdUser;


    public void setIdPost(int idPost) {
        IdPost = idPost;
    }

    public void setIdUser(int idUser) {
        IdUser = idUser;
    }

    public int getIdPost() {
        return IdPost;
    }

    public int getIdUser() {
        return IdUser;
    }

    public int getIdLike() {
        return IdLike;
    }

    public void setIdLike(int idLike) {
        IdLike = idLike;
    }


}
