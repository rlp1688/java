<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <title>Checkout Page</title>
        <jsp:include page="includes/header.jsp"/>
    </head>
    <body>
        <jsp:include page="includes/adminnav.jsp"/>

        <%
            String id = request.getParameter("productId");
            System.out.println(id);
        %>

        <div class="container mt-5">
            <h2>Checkout</h2>
            <form>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="firstName">First Name</label>
                        <input type="text" class="form-control" id="firstName" placeholder="First Name" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="lastName">Last Name</label>
                        <input type="text" class="form-control" id="lastName" placeholder="Last Name" required>
                    </div>
                </div>

                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" placeholder="Email" required>
                </div>

                <div class="form-group">
                    <label for="address">Address</label>
                    <input type="text" class="form-control" id="address" placeholder="1234 Main St" required>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="city">City</label>
                        <input type="text" class="form-control" id="city" required>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="state">State</label>
                        <select id="state" class="form-control" required>
                            <option selected>Choose...</option>
                            <!-- Add your state options here -->
                        </select>
                    </div>
                    <div class="form-group col-md-2">
                        <label for="zip">Zip</label>
                        <input type="text" class="form-control" id="zip" required>
                    </div>
                </div>

                <div class="form-group">
                    <label for="creditCard">Credit Card Number</label>
                    <input type="text" class="form-control" id="creditCard" placeholder="**** **** **** ****" required>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="expiryDate">Expiry Date</label>
                        <input type="text" class="form-control" id="expiryDate" placeholder="MM/YYYY" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="cvv">CVV</label>
                        <input type="text" class="form-control" id="cvv" placeholder="CVV" required>
                    </div>
                </div>

                <button type="submit" class="btn btn-primary">Place Order</button>
            </form>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    </body>
    <jsp:include page="includes/footer.jsp"/>
</html>
