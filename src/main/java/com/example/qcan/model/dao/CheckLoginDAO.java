package com.example.qcan.model.dao;

import com.example.qcan.model.bean.Account;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CheckLoginDAO {
    public boolean isValidUser(String Username, String Password) {
        try {
            Connection connection = ConnectDB.getConnection();
            String sql = "SELECT * FROM account where username = ? and isLock = 0";

            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, Username);


            ResultSet resultSet = preparedStatement.executeQuery();
            String rsUsername = "";
            String rsPassword = "";
            while (resultSet.next()) {
                rsUsername = resultSet.getString("username");
                rsPassword = resultSet.getString("password");
            }

            if (rsUsername.equals("")) {
                return false;
            } else {
                if (rsPassword.equals(Password)) {
                    return true;
                } else {
                    return false;
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


}
