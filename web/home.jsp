<%@page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection" %> 
<%@ pageimport="java.sql.DriverManager" %> 
<%@ page import="java.sql.PreparedStatement"%> 
<%@ page import="java.sql.ResultSet" %> 
<%@ pageimport="java.sql.SQLException" %> 
<%@ page import="java.io.PrintWriter" %> 
<%@page contentType="text/html;charset=UTF-8" language="java" %> 


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Home</title>
        <jsp:include page="includes/header.jsp"/>



        <script src="https://kit.fontawesome.com/78e4720a2a.js"></script>

    </head>
    <body style="background-image: url('images/blur.jpg'); background-size: cover; background-attachment: fixed; position: relative;">
        <div style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.4);"></div>
    </body>


    <jsp:include page="includes/navbar.jsp"/>
    <%
        String sqlQuery = "     ";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/auth", "root", ""); PreparedStatement preparedStatement = connection.prepareStatement("SELECT id, name, price, description, image FROM product")) {

                try (ResultSet resultSet = preparedStatement.executeQuery()) {
    %>
    <div class="container">
        <div class="row row-cols-1 row-cols-md-4 g-5">
            <% while (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    String name = resultSet.getString("name");
                    String price = resultSet.getString("price");
                    String description = resultSet.getString("description");
                    String image = resultSet.getString("image");

            %>
            <div class="col">
                <div class="card" style="width: 300px; height: 400px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); background: rgba(255, 255, 255, 0.9); border-radius: 15px; overflow: hidden; position: relative; left: -20px; margin-top: 20px;">
                    <!-- Picture on top half -->
                    <div style="height: 50%; overflow: hidden;">
                        <img src="images/<%= image%>" class="card-img-top" alt="Product Image" style="width: 100%; height: 200px; position: absolute; top: 0; left: 0; overflow: hidden ">
                    </div>

                    <div class="card-body" style="padding-top: 10px;">
                        <h5 class="card-title" style="font-size: 24px;"> <%= name%></h5>
                        <p class="card-text" style="font-weight: bold;"> <%= description%></p>
                        <p class="card-text">Rs: <%= price%></p>

                        <div class="row">
                            <div class="col">
                                <form action="cart" method="post" style="display: inline-block;">
                                    <input type="hidden" name="productId" value="<%= id%>">
                                    <input type="hidden" name="name" value="<%= name%>">
                                    <input type="hidden" name="price" value="<%= price%>">
                                    <button type="submit" class="btn btn-primary">Add to cart</button>
                                </form>
                            </div>
                            <div class="col">
                                <a href="checkout.jsp?productId=<%= id%>" class="btn btn-primary" style="width: 100px;">Buy now</a>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <% } %>
        </div>
    </div>



    <%
                }
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            out.println("Error: " + e.getMessage());
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("Error: " + e.getMessage());
        }
    %>
</body>
<jsp:include page="includes/footer.jsp"/>
</html>
