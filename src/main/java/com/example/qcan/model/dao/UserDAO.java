package com.example.qcan.model.dao;

import com.example.qcan.model.bean.Account;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
    public boolean isValid(int Id,String field, String value) {
        try {
            Connection connection = ConnectDB.getConnection();
            String sql = "SELECT * FROM account where "+ field+" = ? and id != ?";

            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, value);
            preparedStatement.setInt(2, Id);

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
    public Account getAccount(String Username) {
        try {
            Connection connection = ConnectDB.getConnection();
            String sql = "SELECT * FROM account where username = ?";

            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, Username);


            ResultSet resultSet = preparedStatement.executeQuery();
            Account user = new Account();
            while (resultSet.next()) {
                user.setUsername(resultSet.getString("username"));
                user.setId(resultSet.getInt("id"));
                user.setFullname(resultSet.getString("fullname"));
                user.setNickname(resultSet.getString("nickname"));
                user.setBio(resultSet.getString("bio"));
                user.setAvatar(resultSet.getString("avatar"));
                user.setRole(resultSet.getString("role"));
                user.setLinkFB(resultSet.getString("linkfb"));
                user.setLinkIns(resultSet.getString("linkins"));
                user.setEmail(resultSet.getString("email"));
            }
            return user;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void updateUser(Account user)
    {
        try {
            Connection connection = ConnectDB.getConnection();
            String sql = "UPDATE account SET email = ? , fullname = ? , nickname = ? , bio = ? , linkfb = ?, linkins = ?, avatar = ? WHERE id = ?  " ;

            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, user.getEmail());
            preparedStatement.setString(2, user.getFullname());
            preparedStatement.setString(3, user.getNickname());
            preparedStatement.setString(4, user.getBio());
            preparedStatement.setString(5, user.getLinkFB());
            preparedStatement.setString(6, user.getLinkIns());
            preparedStatement.setString(7, user.getAvatar());
            preparedStatement.setInt(8, user.getId());

            int affectedRows = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public boolean checkPassword(int Id, String Password)
    {
        try {
            Connection connection = ConnectDB.getConnection();
            String sql = "SELECT * FROM account where id = ? and password = ?";

            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, Id);
            preparedStatement.setString(2, Password);

            ResultSet resultSet = preparedStatement.executeQuery();
            String rsUsername = "";
            while (resultSet.next()) {
                rsUsername = resultSet.getString("username");
            }

            if (rsUsername.equals("")) {
                return false;
            } else {
                return true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void updatePassword(int Id, String Password)
    {
        try {
            Connection connection = ConnectDB.getConnection();
            String sql = "UPDATE account SET password = ?  WHERE id = ?  " ;

            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, Password);
            preparedStatement.setInt(2, Id);

            int affectedRows = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
