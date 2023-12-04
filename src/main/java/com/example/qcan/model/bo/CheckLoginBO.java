package com.example.qcan.model.bo;


import com.example.qcan.model.bean.Account;
import com.example.qcan.model.dao.CheckLoginDAO;

public class CheckLoginBO {
    CheckLoginDAO checkLoginDAO = new CheckLoginDAO();
    public boolean isValidUser(String username, String password)
    {
        return this.checkLoginDAO.isValidUser(username, password);
    }

}
