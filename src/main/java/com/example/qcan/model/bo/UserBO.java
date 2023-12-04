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
}
