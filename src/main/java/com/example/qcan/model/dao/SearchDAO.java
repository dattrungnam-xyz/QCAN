package com.example.qcan.model.dao;

import com.example.qcan.model.bean.Account;
import com.example.qcan.model.bean.Post;

import java.sql.*;
import java.util.ArrayList;

public class SearchDAO {
    public ArrayList<Account> searchUser(String field, String value)
    {
        try {
            Connection connection = ConnectDB.getConnection();
            String sql = "SELECT * FROM account where "+field+" like ?";

            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, "%" + value + "%");


            ResultSet resultSet = preparedStatement.executeQuery();
            ArrayList<Account> rs = new ArrayList<Account>();
            while (resultSet.next()) {
                Account user = new Account();
                user.setId(resultSet.getInt("id"));
                user.setFullname(resultSet.getString("fullname"));
                user.setNickname(resultSet.getString("nickname"));
                user.setAvatar(resultSet.getString("avatar"));
                rs.add(user);
            }
            return rs;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public ArrayList<Post>  searchPost(String field,String value)
    {
        try {
            Connection connection = ConnectDB.getConnection();
            String sql = "SELECT post.IdPost,post.PostTime,post.IdUser,post.SongName,post.SongType,post.Musician,post.PostContent,post.Video, account.fullname,account.nickname,account.avatar from post, account where post."+field+" like ? and post.IdUser = account.id";

            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, "%" + value + "%");


            ResultSet resultSet = preparedStatement.executeQuery();
            ArrayList<Post> rs = new ArrayList<Post>();
            while (resultSet.next()) {
                Post post = new Post();
                post.setIdPost(resultSet.getInt("IdPost"));


                Timestamp timestamp = resultSet.getTimestamp("PostTime");
                if (timestamp != null) {
                    post.setPostTime(timestamp.toLocalDateTime());
                }

                post.setIdUser(resultSet.getInt("IdUser"));
                post.setSongName(resultSet.getString("SongName"));
                post.setSongType(resultSet.getString("SongType"));
                post.setMusician(resultSet.getString("Musician"));
                post.setPostContent(resultSet.getString("PostContent"));
                post.setVideoUrl(resultSet.getString("Video"));
                post.setFullname(resultSet.getString("fullname"));
                post.setNickname(resultSet.getString("nickname"));
                post.setAvatar(resultSet.getString("avatar"));
                rs.add(post);
            }
            return rs;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
