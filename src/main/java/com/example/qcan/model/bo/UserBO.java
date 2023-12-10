package com.example.qcan.model.bo;

import com.example.qcan.model.bean.Account;
import com.example.qcan.model.dao.UserDAO;

public class UserBO {
    UserDAO userDAO = new UserDAO();
    public Account getAccount(String Username)
    {
        return this.userDAO.getAccount(Username);
    }
    public void updateUser(Account user)
    {
        userDAO.updateUser(user);
    }
    public Boolean isValid(int Id,String field, String value)
    {
        return userDAO.isValid(Id,field,value);
    }
    public Boolean checkPassword(int id, String password)
    {
        return userDAO.checkPassword(id ,password);
    }
    public void updatePassword(int id, String password)
    {
         userDAO.updatePassword(id ,password);
    }
    public Account getUser(int Id)
    {
        return userDAO.getUserByID(Id);
    }
    public void requestRole(int id)
    {
        userDAO.requestRole(id );
    }

}
