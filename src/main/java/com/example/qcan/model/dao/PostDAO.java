package com.example.qcan.model.dao;




import com.example.qcan.model.bean.Post;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;

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
    public void updatePost(Post post)
    {
        try {
            Connection connection = ConnectDB.getConnection();
            String sql = "update post " +
                    "Set  SongName = ?, SongType = ?, Musician = ? , PostContent = ?, Video = ? " +
                    " where IdPost = ?" ;

            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setInt(6,post.getIdPost());
            preparedStatement.setString(1, post.getSongName());
            preparedStatement.setString(2,post.getSongType());
            preparedStatement.setString(3, post.getMusician());
            preparedStatement.setString(4, post.getPostContent());
            preparedStatement.setString(5, post.getVideoUrl());

            int affectedRows = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public Post getPostByIdPost(int IdPost)
    {
        Post post = new Post();
        try {
            Connection connection = ConnectDB.getConnection();
            String sql = "SELECT post.IdPost,post.PostTime,post.IdUser,post.SongName,post.SongType,post.Musician,post.PostContent,post.Video, account.fullname,account.nickname,account.avatar from post, account\n" +
                    "WHERE post.IdUser = account.id and IdPost = ?";

            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setInt(1, IdPost);


            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
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
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return post;
    }

    public boolean checkPermissionUpdate(int IdPost,int IdUser)
    {
        try {
            Connection connection = ConnectDB.getConnection();
            String sql = "SELECT * FROM post where IdPost = ?";

            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, IdPost);


            ResultSet resultSet = preparedStatement.executeQuery();
            int IdUserPost = 0;
            while (resultSet.next()) {
                IdUserPost = resultSet.getInt("IdUser");
            }

            if (IdUser == IdUserPost) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<Post> getListPostByIdUser(int IdUser)
    {
        ArrayList<Post> list = new ArrayList<Post>();

        try {
            Connection connection = ConnectDB.getConnection();
            String sql = "SELECT * from post where IdUser = ? order by post.PostTime DESC";

            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setInt(1, IdUser);

            ResultSet resultSet = preparedStatement.executeQuery();
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
                list.add(post);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }
    public ArrayList<Post> getListPostByIdFler(int IdFler)
    {
        ArrayList<Post> list = new ArrayList<Post>();

        try {
            Connection connection = ConnectDB.getConnection();
            String sql = "SELECT * from post inner join follow on post.IdUser = follow.idFled where follow.idFler = ? order by post.PostTime DESC";

            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setInt(1, IdFler);


            ResultSet resultSet = preparedStatement.executeQuery();
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
                list.add(post);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public ArrayList<Post> getListPostByTimeDES()
    {
        ArrayList<Post> list = new ArrayList<Post>();

        try {
            Connection connection = ConnectDB.getConnection();
            String sql = "SELECT * from post order by PostTime DESC";

            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
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
                list.add(post);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }
}
