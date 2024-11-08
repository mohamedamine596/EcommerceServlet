<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.exercice1.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.exercice1.User" %>
<%@ page import="java.util.Objects" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Product Showcase</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            display: flex;
            justify-content: center;
            margin: 0;
            padding: 0;
        }
        .product-container {
            width: 80%;
            margin-top: 20px;
        }
        .product-card {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 15px;
            margin: 10px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s;
        }
        .product-card:hover {
            transform: scale(1.02);
        }
        .product-card h3 {
            margin: 0;
            color: #333;
        }
        .product-card p {
            margin: 5px 0;
            color: #666;
        }
        .product-card .price {
            font-size: 1.2em;
            color: #4CAF50;
            font-weight: bold;
        }
        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 15px;
        }
    </style>
</head>
<body>
<div class="product-container">
    <%
        User user = (User) request.getSession().getAttribute("user");

        if (Objects.equals(user.getType(), "seller")) {
            %>
            <a href="addProduct.jsp">Add Product</a>
            <%
        }
    %>

    <p style="float: right;">Welcome, <%= user.getUsername() %></p>
    <a href="logout.jsp">Logout</a>
    <%
    %>
    <h1>Our Products</h1>
    <div class="product-grid">
        <%
            List<Product> productsList = (List<Product>) request.getAttribute("products");
            System.out.println(productsList);
            if (productsList != null && !productsList.isEmpty()) {
                for (Product product : productsList) {
        %>
        <div class="product-card">
            <h3><%= product.name %></h3>
            <p class="price">$<%= String.format("%.2f", product.price) %></p>
            <button onclick="location.href='product-details?id=<%= product.id %>'">View Details</button>
        </div>
        <%
            }
        } else {
        %>
        <p>No products available.</p>
        <%
            }
        %>
    </div>
</div>
</body>
</html>
