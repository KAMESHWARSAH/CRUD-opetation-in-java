<%-- 
    Document   : register
    Created on : 21 Nov, 2021, 8:24:03 AM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registation Page</title>
        <%@include file="component/allcss.jsp"%>
    </head>
    <body style="background-color: #f2f2f0">
        <%@include file="header.jsp"%>
        <div class="container-fluid">
            <div class="row p-2">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-center text-success">Registation Page</h4>
                                <% 
                                    String sucssMsg=(String) session.getAttribute("sucssMsg");
                                     String errorMsg=(String) session.getAttribute("errorMsg");
                                    if(sucssMsg !=null){
                                      %> 
                                      <p class="text-success text-center"><%=sucssMsg %></p>
                                              
                                        <% 
                                        session.removeAttribute("sucssMsg");
                                    }
                                   if (errorMsg != null){
                                    %> 
                                      <p class="text-danger text-center"><%=errorMsg %></p>
                                              
                                        <%
                                             session.removeAttribute("errorMsg");
                                    }
                                %>
                            <form action="register" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Enter Nmae</label>
                                    <input type="text" name="name" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Name">

                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">

                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input type="password" name="pass" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>

                                <div class="text-center m-3">
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                </div>    
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div style="margin-top: 130px">
            <%@include file="footer.jsp" %>
        </div>
    </body>
</html>
