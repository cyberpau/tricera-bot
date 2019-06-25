package com.utilities;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;


public class VaadinConnectionPool {

    private final static String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    private final static String path = "jdbc:sqlserver://localhost\\MSSQLSERVER;databaseName=TriceraDB";
    private final static String user = "sa";
    private final static String pw = "Fuj123!";
    private final static String filename = "application.properties";
    private static Connection conn;

    public static Connection getConnection() {
        Properties prop = new Properties();
        InputStream input = null;
        try {
            input = VaadinConnectionPool.class.getClassLoader().getResourceAsStream(filename);
            if (input == null){
                System.out.println("##################### Config not found! ####################");
            }
            prop.load(input);
            Class.forName(driver);
            conn = DriverManager.getConnection(path, prop.getProperty("user"), prop.getProperty("pw"));
        } 
        catch (SQLException sqle) {
            System.out.println(sqle.toString());
        } 
        catch (ClassNotFoundException cnfe) {
            System.out.println(cnfe.toString());
        }
        catch(Exception e){
            System.out.println(e.toString());
        }
        return conn;
    }
}