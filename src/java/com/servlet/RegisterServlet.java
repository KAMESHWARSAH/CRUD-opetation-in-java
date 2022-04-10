/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import com.conn.DbConnect;
import com.dao.UserdAO;
import com.entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Dell
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet{
     @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
       PrintWriter pr=response.getWriter();
        String Name=request.getParameter("name");
        String Email=request.getParameter("email");
        String Password=request.getParameter("pass");
        System.out.println(Name);
        System.out.println(Email);
        System.out.println(Password);
        
        User u=new User(Name,Email,Password);
        System.out.println("dadasda"+u);
        UserdAO dao=new UserdAO(DbConnect.getConn());
        
        boolean f=dao.userReg(u);
        HttpSession session=request.getSession();
        
        if(f){
            session.setAttribute("sucssMsg", "Success Fully Registered");
            response.sendRedirect("register.jsp");
            
            //System.out.println("inserted");
        }
        else{
             session.setAttribute("errorMsg", "Not Success Fully Registered");
             response.sendRedirect("register.jsp");
            
            //System.out.println("Not Insered");
        }
        
    }
}
