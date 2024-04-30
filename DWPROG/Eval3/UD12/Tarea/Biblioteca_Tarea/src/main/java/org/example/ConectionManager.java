package org.example;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class ConectionManager {
    public static Connection getConnection(String URL, String USER, String PASSWORD) throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    public static Statement createStatement(Connection connection) throws SQLException {
        return connection.createStatement();
    }

    public static void closeConnection(Connection connection) {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


    public static void closeStatement(Statement statement) {
        if (statement != null) {
            try {
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


}
