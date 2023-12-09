package com.example.qcan.model.bo;

import com.example.qcan.model.bean.Account;
import com.example.qcan.model.dao.UserDAO;

import java.sql.SQLException;
import java.util.List;

public class UserBO {
    UserDAO userDAO = new UserDAO();
    public Account getAccount(String Username)
    {
        return this.userDAO.getAccount(Username);
    }
    public List<Account> getAllUsers() {
        try {
            return userDAO.getAllUsers();
        } catch (Exception e) {
            // Xử lý ngoại lệ, có thể log và/hoặc thông báo lỗi
            e.printStackTrace();
            return null;
        }
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
    public boolean deleteUserById(int userId) {
        return userDAO.deleteUserById(userId);
    }
}
