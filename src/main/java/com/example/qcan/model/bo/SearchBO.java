package com.example.qcan.model.bo;

import com.example.qcan.model.bean.Account;
import com.example.qcan.model.bean.Post;
import com.example.qcan.model.dao.SearchDAO;

import java.util.ArrayList;

public class SearchBO {
    SearchDAO searchDAO = new SearchDAO();
    public ArrayList<Account> searchUser(String field, String value)
    {
        return searchDAO.searchUser(field,value);
    }
    public ArrayList<Post>  searchPost(String field, String value)
    {
        return searchDAO.searchPost(field,value);
    }
}
