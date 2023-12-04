package com.example.qcan.model.dao;

import com.example.qcan.model.bean.Account;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SignUpDAO {
    public boolean isValidField(String field, String value) {
        try {
            Connection connection = ConnectDB.getConnection();
            String sql = "SELECT * FROM account where "+ field+" = ?";

            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, value);


            ResultSet resultSet = preparedStatement.executeQuery();
            String rsUsername = "";
            while (resultSet.next()) {
                rsUsername = resultSet.getString("username");
            }

            if (rsUsername.equals("")) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void createUser(Account user)
    {
        try {
            Connection connection = ConnectDB.getConnection();
            String sql = "INSERT INTO account (username, password, email, fullname , nickname, role) " +
                    "VALUES (?, ?, ?, ?,?,?)" ;

            PreparedStatement preparedStatement = connection.prepareStatement(sql);


            preparedStatement.setString(1, user.getUsername());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.setString(3,user.getEmail());
            preparedStatement.setString(4, user.getFullname());
            preparedStatement.setString(5, user.getNickname());
            preparedStatement.setString(6, user.getRole());

            int affectedRows = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
