package com.example.qcan.model.bo;

import com.example.qcan.model.bean.Account;
import com.example.qcan.model.dao.SignUpDAO;

public class SignUpBO {
    SignUpDAO signUpDAO = new SignUpDAO();
    public boolean isValid(String field, String value)
    {
        return signUpDAO.isValidField(field,value);
    }
    public void createUser(Account user)
    {
        signUpDAO.createUser(user);
    }
}
