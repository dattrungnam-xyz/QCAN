package com.example.qcan.model.bo;

import com.example.qcan.model.bean.Follow;
import com.example.qcan.model.dao.FollowDAO;

import java.util.ArrayList;

public class FollowBO {
    FollowDAO followDAO = new FollowDAO();

    public void follow(int idFler,int idFled) {
     followDAO.follow(idFler,idFled);
    }
    public void unFollow(int idFler,int idFled) {
        followDAO.unFollow(idFler,idFled);
    }
    public Follow checkFollow(int idFler,int idFled)
    {
        return followDAO.checkFollow(idFler,idFled);
    }
    public Follow countFollow(int IdUser)
    {
        return followDAO.countFollow(IdUser);
    }
    public ArrayList<Follow> listFollowed(int id){
        return followDAO.getFollowed(id);
    }

    public ArrayList<Follow> listFollower(int id){
        return followDAO.getFollower(id);
    }
    public Follow countFollower(int IdUser)
    {
        return followDAO.countFollower(IdUser);
    }
}
