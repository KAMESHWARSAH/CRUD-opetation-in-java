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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Dell
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet{
     @Override
   public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
       String Email=request.getParameter("email");
       String Password=request.getParameter("pass");
       
       System.out.println(Email+" "+Password);
       UserdAO dao=new UserdAO(DbConnect.getConn());
       User u=dao.LoginUser(Email, Password);
       
       HttpSession session = request.getSession();
       if(u!=null){
           session.setAttribute("user", u);
           response.sendRedirect("index.jsp");
           //System.out.println("User is avilable"+u);
       }
       else{
           session.setAttribute("inviled", "Inviled user and password");
           response.sendRedirect("login.jsp");
            //System.out.println("User is Not  avilable"+u);
       }
   } 
}
