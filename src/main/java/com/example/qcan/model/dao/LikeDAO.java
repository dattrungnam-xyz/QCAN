package com.example.qcan.model.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LikeDAO {
    public void likePost(int userId, int postId) {
        try {
            Connection connection = ConnectDB.getConnection();
            String sql = "INSERT INTO like_post (post_id, user_id) VALUES (?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setInt(1, postId);
            preparedStatement.setInt(2, userId);

            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void unlikePost(int userId, int postId) {
        try {
            Connection connection = ConnectDB.getConnection();
            String sql = "DELETE FROM like_post WHERE post_id = ? AND user_id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setInt(1, postId);
            preparedStatement.setInt(2, userId);

            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public int getLikeCount(int postId) {
        try {
            Connection connection = ConnectDB.getConnection();
            String sql = "SELECT COUNT(*) AS likeCount FROM like_post WHERE post_id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setInt(1, postId);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                return resultSet.getInt("likeCount");
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return 0;
    }
}
