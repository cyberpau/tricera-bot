package com.utilities;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class VaadinConnectionPool {

    private final static String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    private final static String path = "jdbc:sqlserver://localhost\\MSSQLSERVER;databaseName=TriceraDB";
    private final static String user = "sa";
    private final static String pw = "Fuj123!";
    private static Connection conn;

    public static Connection getConnection() {
        try {
            Class.forName(driver);
            conn = DriverManager.getConnection(path, user, pw);
        } 
        catch (SQLException sqle) {
            System.out.println(sqle.toString());
        } 
        catch (ClassNotFoundException cnfe) {
            System.out.println(cnfe.toString());
        }
        return conn;
    }
}