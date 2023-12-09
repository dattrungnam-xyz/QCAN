package com.example.qcan.model.dao;

import com.example.qcan.model.bean.LikePost;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LikePostDAO {
    public void likePost(LikePost post)
    {
        try {
            Connection connection = ConnectDB.getConnection();
            String sql = "INSERT INTO likepost ( IdUser, IdPost) " +
                    "VALUES (?, ?)" ;

            PreparedStatement preparedStatement = connection.prepareStatement(sql);


            preparedStatement.setInt(1, post.getIdUser());
            preparedStatement.setInt(2, post.getIdPost());

            int affectedRows = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void unlikePost(LikePost post)
    {
        try {
            Connection connection = ConnectDB.getConnection();
            String sql = "delete from likepost " +
                    "where IdUser = ? and IdPost = ?" ;

            PreparedStatement preparedStatement = connection.prepareStatement(sql);


            preparedStatement.setInt(1, post.getIdUser());
            preparedStatement.setInt(2, post.getIdPost());

            int affectedRows = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public int getCountLike(int IdPost)
    {
        int countLike = 0;
        try {
            Connection connection = ConnectDB.getConnection();
            String sql = "SELECT count(*) as countLike FROM likepost where IdPost = ? ";

            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setInt(1, IdPost);


            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                //fl.setIdFLed(resultSet.getInt("idFled"));
                countLike= resultSet.getInt("countLike");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return countLike;
    }
    public boolean isCurrentUserLikePost(int IdUser,int IdPost)
    {
        try {
            Connection connection = ConnectDB.getConnection();
            String sql = "SELECT * FROM likepost where IdUser = ? and IdPost = ?";

            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setInt(1, IdUser);
            preparedStatement.setInt(2, IdPost);

            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
