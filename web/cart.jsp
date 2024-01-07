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
        <title>All products</title>
        <jsp:include page="includes/header.jsp"/>



        <script src="https://kit.fontawesome.com/78e4720a2a.js"></script>

    </head>
    <body>
        <jsp:include page="includes/navbar.jsp"/>
        <%

            String sqlQuery = "     ";

            try {

                Class.forName("com.mysql.jdbc.Driver");

                try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/auth", "root", ""); PreparedStatement preparedStatement = connection.prepareStatement("SELECT id, name, price FROM cart")) {

                    try (ResultSet resultSet = preparedStatement.executeQuery()) {
        %>
        <div class="container">
            <table class="table table-bordered table-hover" style="margin-top: 20px;">
                <thead class="table-dark">
                    <tr>
                        <th scope="col" style="text-align: center; vertical-align: middle; background-color: #343a40; color: white;">Product No</th>
                        <th scope="col" style="text-align: center; vertical-align: middle; background-color: #343a40; color: white;">Item</th>
                        <th scope="col" style="text-align: center; vertical-align: middle; background-color: #343a40; color: white;">price</th>

                    </tr>
                </thead>
                <tbody>
                    <% while (resultSet.next()) {
                            int id = resultSet.getInt("id");
                            String item = resultSet.getString("name");
                            String volume = resultSet.getString("price");

                    %>
                    <tr style="text-align: center; vertical-align: middle;">
                        <td style="width: 100px;">00<%= id%></td>
                        <td><%= item%></td>
                        <td><%= volume%></td>



                    </tr>
                    <% } %>
                </tbody>
            </table>
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
