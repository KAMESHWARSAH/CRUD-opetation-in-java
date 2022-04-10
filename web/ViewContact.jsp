<%-- 
    Document   : ViewContact
    Created on : 21 Nov, 2021, 8:24:30 AM
    Author     : Dell
--%>

<%@page import="java.util.List"%>
<%@page import="com.entity.Contact"%>
<%@page import="com.dao.ContactDAO"%>
<%@page import="com.conn.DbConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="component/allcss.jsp"%>
        <style>
            .crd-ho:hover{
                background: #f7f7f7;
            }
        </style>
    </head>
    <body>
        <%@include file="header.jsp"%>
        <h1 class="text-center p-4">View Contact</h1>
        <%               if (myuser == null) {
                session.setAttribute("inviled", "Login Please...");
                response.sendRedirect("login.jsp");
            }
        %>


        <div class="container">
            <div class="row p-4">

                <%
                    if (myuser != null) {
                        ContactDAO dao = new ContactDAO(DbConnect.getConn());
                        List<Contact> contact = dao.getAllContact(myuser.getId());

                        for (Contact c : contact) {

                %>
                <div class="col-md-3">
                    <div class="card crd-ho">
                        <div class="card-body">
                            <h5>Name : <%=c.getName()%></h5>
                            <p>Phone No: <%=c.getPhone()%></p>
                            <p> Email: <%=c.getEmail()%></p>
                            <p> About: <%=c.getMessage()%> </p>
                            <div class="text-center">
                                <a class="btn btn-success tex-white">Edit</a>
                                <a class="btn btn-danger tex-white">Delete</a>
                            </div>
                        </div>
                    </div>
                </div>  
                            <a href="editcontact.jsp?<%= c.getUid() %>" class="btn btn-success tex-white">Edit</a>
                                <a class="btn btn-danger tex-white">Delete</a>
                                <%@include file="footer.jsp" %>  
                <%  }
                    }
                %>

            </div>
        </div> 
                                      
    </body>
</html>
