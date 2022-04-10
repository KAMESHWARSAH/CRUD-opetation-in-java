/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.entity.Contact;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import static java.util.Collections.list;
import java.util.List;

/**
 *
 * @author Dell
 */
public class ContactDAO {

    private Connection conn;

    public ContactDAO(Connection conn) {
        super();
        this.conn = conn;
        //getID();
    }

    public boolean SaveContact(Contact c) {
        boolean f = false;

        try {

            System.out.println("Connecting...");
            String sql = "insert into contact(name,email,phone,about,userid) values(?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            System.out.println(sql);
            ps.setString(1, c.getName());
            System.out.println("nnnnnnn");
            ps.setString(2, c.getEmail());
            ps.setString(3, c.getPhone());
            ps.setString(4, c.getAbout());
            ps.setString(5, c.getUid());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
                System.out.println("Data Inserted");
            } else {
                System.out.println("Data Not Inserted");
            }

        } catch (Exception ee) {

        }
        return f;
    }

    public List<Contact> getAllContact(int uid) {
        List<Contact> list = new ArrayList<Contact>();
        Contact c = null;
        try {
            System.out.println("List contatct");
            String sql = "select * from contact where userid=?";
            PreparedStatement pr = conn.prepareStatement(sql);
            pr.setInt(1, uid);

            ResultSet rs = pr.executeQuery();
            while (rs.next()) {
                c = new Contact();
                c.setId(rs.getInt(1));
                c.getName(rs.getString(2));
                c.getEmail(rs.getString(3));
                c.getPhone(rs.getString(4));
                c.getAbout(rs.getString(5));

                list.add(c);

            }
        } catch (Exception eee) {
            //System.out.println(eee);
            eee.printStackTrace();
        }

        return list;

    }
      
    public Contact getCcontactById(int cid){
        Contact c=new Contact();
        try{
            PreparedStatement ps=conn.prepareStatement("select * from contact where id=?");
            ps.setInt(1, cid);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
            c.setId(rs.getInt(1));
            c.setName(rs.getString(2));
            c.setEmail(rs.getString(3));
            c.setPhone(rs.getString(4));
            c.setMessage(rs.getString(5));
        }
            
        }catch(Exception ee){
            ee.printStackTrace();
        }
        return c;
    }
    
    
    public boolean updateContact(Contact c){
        boolean f = false;

        try {

            System.out.println("Connecting...");
            String sql = "upadte contact set name=?, email=?, phone=?, about=? where id=? ";
            PreparedStatement ps = conn.prepareStatement(sql);
            System.out.println(sql);
            ps.setString(1, c.getName());
            System.out.println("nnnnnnn");
            ps.setString(2, c.getEmail());
            ps.setString(3, c.getPhone());
            ps.setString(4, c.getAbout());
            ps.setInt(5, c.getId());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
                System.out.println("Data Inserted");
            } else {
                System.out.println("Data Not Inserted");
            }

        } catch (Exception ee) {

        }
        return f;
    }
}
