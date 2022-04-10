/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import com.conn.DbConnect;
import com.dao.ContactDAO;
import com.entity.Contact;
import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Dell
 */
@WebServlet("/update")
public class EditContact extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String Name = request.getParameter("name");
        String Email = request.getParameter("email");
        String Phone = request.getParameter("phone");
        String About = request.getParameter("about");
        
        
        
        System.out.println( Name + "" + Email + "" + Phone + "" + About);
        
        Contact c = new Contact();
        System.out.println(c);
        c.setName(Name);
        c.setEmail(Email);
        c.setPhone(Phone);
        c.setMessage(About);
        ContactDAO dao = new ContactDAO(DbConnect.getConn());
         HttpSession session = request.getSession();
        boolean f=dao.updateContact(c);
        if(f){
            System.out.println("Added");
            response.sendRedirect("AddContect.jsp");
        }
        else{
            System.out.println("Not Added");
        }

    }
}
