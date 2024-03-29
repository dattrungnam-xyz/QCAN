package com.example.qcan.model.dao;

import com.example.qcan.model.bean.Follow;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class FollowDAO {
    public void follow(int IdFler, int IdFled)
    {
        try {
            Connection connection = ConnectDB.getConnection();
            String sql = "INSERT INTO follow ( idFler, idFled) " +
                    "VALUES (?, ?)" ;

            PreparedStatement preparedStatement = connection.prepareStatement(sql);


            preparedStatement.setInt(1, IdFler);
            preparedStatement.setInt(2, IdFled);

            int affectedRows = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void unFollow(int IdFler,int IdFled)
    {
        try {
            Connection connection = ConnectDB.getConnection();
            String sql = "delete from follow " +
                    "where idFler = ? and idFled = ?" ;

            PreparedStatement preparedStatement = connection.prepareStatement(sql);


            preparedStatement.setInt(1, IdFler);
            preparedStatement.setInt(2, IdFled);

            int affectedRows = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public Follow checkFollow(int IdFler,int IdFled)
    {
        Follow fl = new Follow();
        try {
            Connection connection = ConnectDB.getConnection();
            String sql = "SELECT * FROM follow where idFler = ? and idFled = ?";

            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setInt(1, IdFler);
            preparedStatement.setInt(2, IdFled);

            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                fl.setFled(true);
            } else {
                fl.setFled(false);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return fl;
    }
    public Follow countFollow(int IdUser)
    {
        Follow fl = new Follow();
        try {
            Connection connection = ConnectDB.getConnection();
            String sql = "SELECT count(*) as follow FROM follow where idFler = ? ";

            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setInt(1, IdUser);


            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                //fl.setIdFLed(resultSet.getInt("idFled"));
               fl.setCountFollow(resultSet.getInt("follow"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return fl;
    }
    public ArrayList<Follow> getFollowed(int IdUser){

        ArrayList<Follow> listfl = new ArrayList<Follow>();
        try {
            Connection connection = ConnectDB.getConnection();
            String sql = "SELECT * FROM follow where idFler = ? ";

            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setInt(1, IdUser);


            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Follow fl = new Follow();
                fl.setIdFled(resultSet.getInt("idFled"));
                listfl.add(fl);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listfl;
    }

    public ArrayList<Follow> getFollower(int IdUser){

        ArrayList<Follow> listfl = new ArrayList<Follow>();
        try {
            Connection connection = ConnectDB.getConnection();
            String sql = "SELECT * FROM follow where idFled = ? ";

            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setInt(1, IdUser);


            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Follow fl = new Follow();
                fl.setIdFler(resultSet.getInt("idFler"));
                listfl.add(fl);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listfl;
    }
    public Follow countFollower(int IdUser)
    {
        Follow fl = new Follow();
        try {
            Connection connection = ConnectDB.getConnection();
            String sql = "SELECT count(*) as follower FROM follow where idFled = ? ";

            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setInt(1, IdUser);


            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                //fl.setIdFler(resultSet.getInt("idFler"));
                fl.setCountFollower(resultSet.getInt("follower"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return fl;
    }
}
