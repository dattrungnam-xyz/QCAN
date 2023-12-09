package com.example.qcan.model.bean;

public class Account {
    private int Id;
    private String Username;
    private String Password;
    private String Email;

    private String Nickname;
    private String Fullname;
    private String Bio;
    private String Avatar;
    private String Role;
    private String LinkFB;
    private String LinkIns;

    private boolean isLock;

    public void setId(int id) {
        Id = id;
    }

    public int getId() {
        return Id;
    }

    public void setUsername(String username) {
        Username = username;
    }

    public String getUsername() {
        return Username;
    }

    public String getFullname() {
        return Fullname;
    }

    public void setFullname(String fullname) {
        Fullname = fullname;
    }

    public String getAvatar() {
        return Avatar;
    }

    public String getNickname() {
        return Nickname;
    }

    public String getBio() {
        return Bio;
    }

    public String getLinkFB() {
        return LinkFB;
    }

    public boolean getisLock(){
        return this.isLock;
    }

    public String getLinkIns() {
        return LinkIns;
    }

    public String getPassword() {
        return Password;
    }

    public String getRole() {
        return Role;
    }

    public void setAvatar(String avatar) {
        Avatar = avatar;
    }

    public void setBio(String bio) {
        Bio = bio;
    }

    public void setLinkFB(String linkFB) {
        LinkFB = linkFB;
    }

    public void setLinkIns(String linkIns) {
        LinkIns = linkIns;
    }

    public void setNickname(String nickname) {
        Nickname = nickname;
    }

    public void setPassword(String password) {
        Password = password;
    }

    public void setRole(String role) {
        Role = role;
    }

    public void setEmail(String email) {
        Email = email;
    }

    public void setisLock(boolean isLock){
        this.isLock = isLock;
    }

    public String getEmail() {
        return Email;
    }
}
