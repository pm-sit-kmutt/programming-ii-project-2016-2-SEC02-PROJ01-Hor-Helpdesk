package Model;

import java.sql.*;

public class ConnectionBuilder {
    private static final String HOST = "10.4.56.26";
    private static final String DBNAME = "hor";
    private static final String USERNAME = "hor";
    private static final String PASSWORD = "hor";

    public static Connection getConnection() throws ClassNotFoundException, SQLException{
        Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://" + HOST + ":3306/" + DBNAME + "?characterEncoding=utf8", USERNAME , PASSWORD);
        return con;
    }
}
