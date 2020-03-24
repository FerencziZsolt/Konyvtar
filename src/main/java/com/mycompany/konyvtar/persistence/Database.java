/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.konyvtar.persistence;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

/**
 *
 * @author Zsolt
 */
public class Database {

    private static String USERNAME = "root";
    private static String PASSWORD = "";
    private static String URL = "jdbc:mysql://localhost:3306/konyvtar";
    private static Connection connection = null;

    /* 
    private static String USERNAME;
    private static String PASSWORD;
    private static String URL;
    private static Connection connection = null;
     */
    public static void init() {
        try {
            FileReader fr = new FileReader("project.properties");
            Properties p = new Properties();
            p.load(fr);
            Database.setUSERNAME(p.getProperty("db.username"));
            Database.setPASSWORD(p.getProperty("db.password"));
            Database.setURL(p.getProperty("db.jdbcurl"));
        } catch (IOException e) {
            System.out.println("Hiba: " + e);
        }
    }

    public static Connection getConnection() {
        if (connection == null) {
            connection = connect();
        }
        return connection;
    }

    public static Connection connect() {
        try {
            //init();
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (SQLException sqle) {
            System.out.println(sqle);
        } catch (ClassNotFoundException ce) {
            System.out.println(ce);
        }
        return connection;
    }

    public void disconnect() {
        try {
            connection.close();
        } catch (SQLException sqle) {
            System.out.println(sqle);
        } finally {
            connection = null;
        }
    }

    public static void setURL(String URL) {
        Database.URL = URL;
    }

    public static void setUSERNAME(String USERNAME) {
        Database.USERNAME = USERNAME;
    }

    public static void setPASSWORD(String PASSWORD) {
        Database.PASSWORD = PASSWORD;
    }

}
