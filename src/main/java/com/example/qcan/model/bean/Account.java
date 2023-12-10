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
    private boolean isRemove;
    public boolean requestRole;

    public boolean getRequestRole() {
        return requestRole;
    }

    public void setRequestRole(boolean requestRole) {
        this.requestRole = requestRole;
    }





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

    public String getLinkIns() {
        return LinkIns;
    }

    public String getPassword() {
        return Password;
    }

    public String getRole() {
        return Role;
    }
    public boolean getisRemove() {  return isRemove;
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

    public String getEmail() {
        return Email;
    }
    public void setRemove(boolean remove) {
        isRemove = remove;
    }

}
