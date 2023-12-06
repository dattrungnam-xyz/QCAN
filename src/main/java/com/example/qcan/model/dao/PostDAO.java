package com.example.qcan.model.dao;



import com.example.qcan.model.bean.Post;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class PostDAO {
    public void createPost(Post post)
    {
        try {
            Connection connection = ConnectDB.getConnection();
            String sql = "INSERT INTO post (IdUser , SongName, SongType, Musician , PostContent, Video) " +
                    "VALUES (?, ?, ?, ?,?,?)" ;

            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setInt(1,post.getIdUser());
            preparedStatement.setString(2, post.getSongName());
            preparedStatement.setString(3,post.getSongType());
            preparedStatement.setString(4, post.getMusician());
            preparedStatement.setString(5, post.getPostContent());
            preparedStatement.setString(6, post.getVideoUrl());

            int affectedRows = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
