<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Contact Us</title>
        <jsp:include page="includes/header.jsp"/>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
            }

            nav {
                background-color: #333;
                overflow: hidden;
            }

            nav ul {
                list-style-type: none;
                margin: 0;
                padding: 0;
                overflow: hidden;
            }

            nav li {
                float: left;
            }

            nav a {
                display: block;
                color: white;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
            }

            nav a:hover {
                color: #ddd;
            }

            .container {
                width: 50%;
                margin: 0 auto;
            }

            h2 {
                color: #333;
            }

            label {
                display: block;
                margin: 10px 0;
            }

            input, textarea {
                width: 100%;
                padding: 8px;
                margin: 6px 0;
                box-sizing: border-box;
            }

            button {
                background-color: #4CAF50;
                color: white;
                padding: 10px 15px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            .contact-section {
                margin-top: 20px;
                background-color: #f2f2f2;
                padding: 20px;
                border-radius: 10px;
            }

            .contact-details {
                margin-top: 10px;

                button:hover {
                    background-color: #45a049;
                }
            </style>

        </head>
        <body>
            <jsp:include page="includes/navbar.jsp"/>
            <div class="container">
                <div class="contact-section">
                    <h2>Contact Details</h2>
                    <div class="contact-details">
                        <p><strong>Email:</strong> info@greensupermarket.com</p>
                        <p><strong>Phone:</strong> +94 11-123-4567</p>
                        <p><strong>Address:</strong> 123 Green Street, Colombo, Srilanka</p>
                    </div>
                </div>
            </div>
        </body>
        <jsp:include page="includes/footer.jsp"/>
    </html>
