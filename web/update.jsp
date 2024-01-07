<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Update Product</title>

        <jsp:include page="includes/header.jsp"/>
    </head>
    <body>
        <jsp:include page="includes/admin_nav.jsp"/>
        <div class="container mt-4">
            <h2 class="mb-4">Update Product</h2>

            <% int productId = Integer.parseInt(request.getParameter("productId"));%>

            <form action="UpdateServlet" method="post" enctype="multipart/form-data">
                <input type="hidden" name="productId" value="<%=productId%>">
                <%System.out.println(productId);%>

                <div class="form-group">
                    <label for="name">Product Name:</label>
                    <input type="text" class="form-control" id="name" name="name" required>
                </div>

                <div class="form-group">
                    <label for="price">Price:</label>
                    <input type="number" class="form-control" id="price" name="price" required>
                </div>

                <div class="form-group">
                    <label for="description">Description:</label>
                    <textarea class="form-control" id="description" name="description" rows="4" required></textarea>
                </div>

                <div class="form-group">
                    <label for="image">Select Image:</label>
                    <input type="file" class="form-control-file" id="image" name="image">
                </div>

                <div class="form-group">
                    <label for="status">Product Status:</label>
                    <select class="form-control" id="status" name="status" required>
                        <option value="instock">In Stock</option>
                        <option value="outofstock">Out of Stock</option>
                    </select>
                </div>

                <button type="submit" class="btn btn-primary">Update Product</button>
            </form>
        </div>

    </body>
    <jsp:include page="includes/footer.jsp"/>
</html>
