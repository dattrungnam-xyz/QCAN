package com.example.qcan.model.bean;

import java.io.InputStream;
import java.time.LocalDateTime;

public class Post {
    private int IdPost;
    private int IdUser;
    private LocalDateTime PostTime;
    private String SongName;
    private String SongType;
    private String Musician;
    private String PostContent;
    private String VideoUrl;

    private String Fullname;
    private String Nickname;
    private String Avatar;


    public int getIdPost() {
        return IdPost;
    }

    public int getIdUser() {
        return IdUser;
    }

    public LocalDateTime getPostTime() {
        return PostTime;
    }


    public String getMusician() {
        return Musician;
    }

    public String getPostContent() {
        return PostContent;
    }

    public void setIdPost(int idPost) {
        IdPost = idPost;
    }

    public String getSongName() {
        return SongName;
    }

    public String getSongType() {
        return SongType;
    }

    public void setIdUser(int idUser) {
        IdUser = idUser;
    }

    public void setMusician(String musician) {
        Musician = musician;
    }

    public void setPostContent(String postContent) {
        PostContent = postContent;
    }

    public void setPostTime(LocalDateTime postTime) {
        PostTime = postTime;
    }

    public void setSongName(String songName) {
        SongName = songName;
    }

    public void setSongType(String songType) {
        SongType = songType;
    }

    public String getVideoUrl() {
        return VideoUrl;
    }

    public void setVideoUrl(String videoUrl) {
        VideoUrl = videoUrl;
    }

    public void setNickname(String nickname) {
        Nickname = nickname;
    }

    public void setAvatar(String avatar) {
        Avatar = avatar;
    }

    public String getNickname() {
        return Nickname;
    }

    public String getAvatar() {
        return Avatar;
    }

    public void setFullname(String fullname) {
        Fullname = fullname;
    }

    public String getFullname() {
        return Fullname;
    }

}
