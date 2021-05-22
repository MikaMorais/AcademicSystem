package br.academicsys.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {
    private static final String urlDB = "";
    private static final String user="";
    private static final String password="";
    
    public static Connection getConnection() throws SQLException{
        return DriverManager.getConnection(urlDB, user, password);
    }
}
