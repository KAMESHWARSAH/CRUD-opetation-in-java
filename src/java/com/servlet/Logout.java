/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

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
@WebServlet("/logout")
public class Logout extends HttpServlet {
     @Override
     public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
         HttpSession session=request.getSession();
         HttpSession session2=request.getSession();
         session2.setAttribute("logMsg", "LogOut Sucessfull");
         session.removeAttribute("user");
          System.out.println("after logout ");
          response.sendRedirect("login.jsp");
     }
}
