<%@ page import="java.util.*" %>
<%
    String cPage = request.getServletPath();
%>

<nav class="navbar navbar-expand-lg bg-dark" style="background-color: #333; padding: 15px;">
    <div class="container-fluid">
        <a class="navbar-brand" href="#" style="color: white; font-size: 24px;">
            <img src="images/logo.png" width="50" height="50" alt="alt" class="mr-2"/> Green Supermarket
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="admin.jsp" style="color: white; font-size: 18px;">Admin</a>
                </li>
                
                <li class="nav-item">
                    <a class="nav-link" href="home.jsp" style="color: white; font-size: 18px;">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="cart.jsp" style="color: white; font-size: 18px;">Cart</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="aboutus.jsp" style="color: white; font-size: 18px;">About us</a>
                </li>
                
                <li class="nav-item">
                    <a class="nav-link" href="contactus.jsp" style="color: white; font-size: 18px;">Contact us</a>
                </li>
                
                <li class="nav-item">
                    <form action="logout" method="post" style="margin: 0;">
                        <button type="submit" class="btn btn-link nav-link" style="color: white; font-size: 18px; padding: 0; margin-top: 8px; margin-left: 5px; margin-right: 5px;">
                            Logout
                        </button>
                    </form>
                </li>

                
                
            </ul>
            <form class="d-flex" role="search">
                <input class="form-control me-2" type="search" placeholder="Search Products" style="border: none; border-bottom: 1px solid white; border-radius: 0; font-size: 16px;">
                <button type="submit" class="btn btn-outline-success" style="color: white; font-size: 18px;">Search</button>
            </form>
        </div>
    </div>
</nav>
