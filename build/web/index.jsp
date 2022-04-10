<%-- 
    Document   : index
    Created on : 21 Nov, 2021, 8:21:30 AM
    Author     : Dell
--%>

<%@page import="com.entity.User"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.conn.DbConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Phone</title>
        <%@include file="component/allcss.jsp"%>
        <style>
            .backimage{
                background: url("img/phone.jpg");
                width: 100%;
                height: 86vh;
                background-repeat: no-repeat;
                background-size: cover;
            }
        </style>
    </head>
    <body>
         <%@include file="header.jsp"%>
         <% User u=(User)session.getAttribute("user");
         //out.print(u);
         %>
         <div class="container-fluid backimage text-center text-success ">
             <h1>Welcome to Phone Book App</h1>
         </div>
         
         
         <%@include file="footer.jsp" %>     
    </body>
</html>
