<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.exercice1.Product" %>
<%@ page import="java.util.Objects" %>
<%@ page import="com.example.exercice1.User" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Product Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .product-detail-container {
            width: 300px;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .product-detail-container h2 {
            margin-bottom: 10px;
        }
        .product-detail-container p {
            margin: 5px 0;
            color: #555;
        }
        .price {
            font-size: 1.2em;
            color: #4CAF50;
            font-weight: bold;
        }
        .product-actions {
            margin-top: 15px;
        }
        .product-actions button {
            padding: 10px 15px;
            margin: 5px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            color: white;
            transition: background-color 0.3s;
        }
        .edit-button {
            background-color: #ffa500;
        }
        .edit-button:hover {
            background-color: #e69500;
        }
        .delete-button {
            background-color: #f44336;
        }
        .delete-button:hover {
            background-color: #d32f2f;
        }
    </style>
</head>
<body>
<div class="product-detail-container">
    <%
        Product product = (Product) request.getAttribute("product");
        if (product != null) {
    %>
    <h2><%= product.name %></h2>
    <p class="price">$<%= String.format("%.2f", product.price) %></p>
    <p><%= product.description %></p>
    <p>Quantity: <%= product.quantity %></p>

    <div class="product-actions">
        <%
            User user = (User) session.getAttribute("user");
            if (Objects.equals(user.getType(), "seller")) {

        %>
        <!-- Edit button sends the product ID to the edit page -->
        <form action="product-update" method="get" style="display: inline;">
            <input type="hidden" name="id" value="<%= product.id %>">
            <button type="submit" class="edit-button">Edit</button>
        </form>

        <!-- Delete button submits to the delete servlet -->
        <form action="product-delete" method="post" style="display: inline;">
            <input type="hidden" name="id" value="<%= product.id %>">
            <button type="submit" class="delete-button" onclick="return confirm('Are you sure you want to delete this product?');">Delete</button>
        </form>
        <%
            }
        %>
    </div>
    <%
    } else {
    %>
    <p>Product not found.</p>
    <%
        }
    %>
</div>
</body>
</html>
