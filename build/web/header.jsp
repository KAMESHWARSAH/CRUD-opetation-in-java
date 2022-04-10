<%@page import="com.entity.User"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <a class="navbar-brand" href="index.jsp"><i class="fas fa-phone-square"></i> Phone Book </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="index.jsp"><i class="fas fa-home"></i> Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="AddContect.jsp"><i class="fas fa-plus-square"></i> Add Phone Number</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="ViewContact.jsp"><i class="fas fa-eye"></i> View Contact</a>
            </li>


        </ul>

        <% User myuser = (User) session.getAttribute("user");
            if (myuser == null) {
        %>
        <form class="form-inline my-2 my-lg-0">
            <a href="login.jsp" class="btn btn-success "><i class="fas fa-user"></i> Login</a>
            <a href="register.jsp" class="btn btn-danger ml-2"><i class="fas fa-users"></i> Register</a>
        </form>
        <%
        } else {
        %>
        <form  class="form-inline my-2 my-lg-0" >
            <button class="btn btn-success"><%= myuser.getName()%></button>
            <button  type="button" class="btn btn-danger ml-2" data-toggle="modal" data-target="#exampleModalCenter">Logout</button>
        </form>
        <%
            }
        %>

        <!-- Button trigger modal -->
       

        <!--Logout  Modal -->
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body text-center">
                        <h6 >Do you want to Logout</h6>
                         <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                         <form action="logout" method="post">
                             <button type="submit" class="btn btn-primary mt-2">logout</button>
                         </form>
                       
                    </div>
                    <div class="modal-footer">
                       
                    </div>
                </div>
            </div>
        </div>
    </div>
</nav>