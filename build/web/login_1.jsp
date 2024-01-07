<%-- 
    Document   : login
    Created on : Dec 30, 2023, 12:54:36 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <jsp:include page="includes/header.jsp"/>
    </head>
    <body style="background-image: url('images/fruites.jpg'); background-size: cover; background-attachment: fixed; background-color: rgba(255, 255, 255, 0.5);">
        <jsp:include page="includes/adminnav.jsp"/>
    <center>
        <div class="container mt-5" style="height: 600px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); padding: 20px; background-color: rgba(255, 255, 255, 0.7); border-radius: 15px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);">
            <img src="fruites.jpg" alt="Background Image" style="width: 100%; height: auto; position: absolute; top: 0; left: 0; z-index: -1; border-radius: 15px;">

            <div class="row justify-content-center">
                <div class="col-md-6">
                    <form action="login" method="post">
                        <div class="text-center">
                            <h1>Login Here</h1>
                        </div>

                        <div class="form-group">
                            <label for="username">User Name:</label>
                            <input type="text" class="form-control" id="username" name="username" required>
                        </div>

                        <div class="form-group">
                            <label for="password">Password:</label>
                            <input type="password" class="form-control" id="password" name="password" required>
                        </div>

                        <div class="text-center">
                            <br>
                            <button type="submit" class="btn btn-primary">Login</button>
                            <br><br>
                            If you don't have an account<a href="index.jsp"> sign up</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </center>

</body>
<jsp:include page="includes/footer.jsp"/>
</html>
