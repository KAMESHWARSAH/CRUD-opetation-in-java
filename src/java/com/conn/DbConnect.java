/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.conn;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Dell
 */
public class DbConnect {
    private static Connection conn;
    public static Connection getConn(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/contactPhone","root","rootwdp");
        }
        catch(Exception e){
            System.out.println(e);
        }
        return conn;
        
    }
}
