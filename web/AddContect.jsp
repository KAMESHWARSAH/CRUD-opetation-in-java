<%-- 
    Document   : AddContect
    Created on : 21 Nov, 2021, 8:44:39 AM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="component/allcss.jsp"%>
    </head>
    <body>
        <%@include file="header.jsp"%> 
        <%          if (myuser == null) {
                session.setAttribute("inviled", "Login Please...");
                response.sendRedirect("login.jsp");
            }
        %>
        <div class="container-fluid">
            <div class="row p-2">
                <div class="col-md-4 offset-md-3">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-center text-success">Add Contact Page</h4>
                            <%
                                String sucMsg = (String) session.getAttribute("sucMsgs");
                                String ErrorcMsg = (String) session.getAttribute("ErrorcMsg");
                                if (sucMsg != null) {
                            %> 
                            <p class="text-success text-center"><%=sucMsg%></p>

                            <%
                                    session.removeAttribute("sucssMsg");
                                }
                                if (ErrorcMsg != null) {
                            %> 
                            <p class="text-danger text-center"><%=ErrorcMsg%></p>

                            <%
                                    session.removeAttribute("ErrorcMsg");
                                }
                            %>
                            <form action="Mycontact" method="post">
                                <%
                                    if (myuser != null) {
                                %>
                                <input type="text" value="<%= myuser.getId()%>" name="userid">
                                <%
                                    }
                                %>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email Name</label>
                                    <input type="text" name="name" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Name">

                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">

                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Phone</label>
                                    <input type="number" name="phone" class="form-control" id="exampleInputPassword1" placeholder="Enter Number">
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputPassword1">About</label>
                                    <input type="text" name="about" class="form-control" id="exampleInputPassword1" placeholder="Enter Number">
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
