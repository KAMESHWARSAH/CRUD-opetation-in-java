/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Dell
 */
public class UserdAO {
    
    
    private Connection conn;
    Statement stm;
    int id=2;
    public void getID() {
    try{
        String sql="select * from user";
        ResultSet rs=stm.executeQuery(sql);
        String id=rs.getString("id");
        System.out.println("new id.. "+id);
    }
    catch(Exception ee){
        System.out.println(ee);
    }
    }

    public UserdAO(Connection conn) {
        super();
        this.conn = conn;
        //getID();
    }

    public boolean userReg(User u) {
        boolean f = false;
        try {
            String sql = "insert into user(name, email, password) values(?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            System.out.println(sql);
            System.out.println("2");
            //ps.setInt(1, id+1);
            ps.setString(1, u.getName());
            ps.setString(2, u.getEmail());
            ps.setString(3, u.getPassword());
            System.out.println("3");
            int i = ps.executeUpdate();
            System.out.println(i);
            if (i == 1) {
                System.out.println("Data Inderted");
                f = true;
            } else {
                System.out.println("Not Inserted..s");
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return f;

    }
    public User LoginUser(String e, String p){
        User user=null;
        try{
            String sql="select * from user where email=? and password=?";
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setString(1, e);
            ps.setString(2, p);
            System.out.println(e);
            System.out.println(p);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){              
                user =new User();
                user.setId(rs.getInt(1));
                user.setName(rs.getString(2));
                user.setEmail(rs.getString(3));
                user.setPassword(rs.getString(4));               
            }          
            
        }catch(Exception ee){
            System.out.println(ee);
        }
        return user;
        
    }
}
