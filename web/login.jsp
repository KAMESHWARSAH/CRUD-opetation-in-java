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
        <title>Login Page</title>
        <%@include file="component/allcss.jsp"%>
    </head>
    <body style="background-color: #f2f2f0">
        <%@include file="header.jsp"%>

        <%  User u = (User) session.getAttribute("user");
            out.print(u);
        %>


        <div class="container-fluid">
            <div class="row p-2">
                <div class="col-md-4 offset-md-3">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-center text-success">Login  Page</h4>
                            <%                    
                                String inviled = (String) session.getAttribute("inviled");
                                if (inviled != null) {
                            %>

                            <p class="text-danger text-center"><%= inviled%></p>
                            <%
                                    session.removeAttribute("inviled");
                                }
                            %>

                            <%    
                                String logMsg = (String) session.getAttribute("logMsg");
                                if (logMsg != null) {
                            %>

                            <p class="text-success text-center"><%= logMsg%></p>
                            <%
                                    session.removeAttribute("logMsg");
                                }
                            %>

                            <form action="login" method="post">

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
