<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.exercice1.Product" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Product</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .form-container {
            width: 300px;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .form-container label {
            display: block;
            margin-top: 10px;
        }
        .form-container input, .form-container textarea {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .form-container button {
            width: 100%;
            padding: 10px;
            margin-top: 15px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .form-container button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2>Edit Product</h2>
    <%
        Product product = (Product) request.getAttribute("product");
        if (product != null) {
    %>
    <form action="product-update" method="post">
        <input type="hidden" name="_method" value="PUT">
        <!-- Hidden field to keep track of the product ID -->
        <input type="hidden" name="id" value="<%= product.id %>">

        <label for="name">Product Name:</label>
        <input type="text" id="name" name="name" value="<%= product.name %>" required>

        <label for="price">Price:</label>
        <input type="number" id="price" name="price" step="0.01" value="<%= product.price %>" required>

        <label for="description">Description:</label>
        <textarea id="description" name="description" rows="3" required><%= product.description %></textarea>

        <label for="quantity">Quantity:</label>
        <input type="number" id="quantity" name="quantity" value="<%= product.quantity %>" required>

        <button type="submit">Update Product</button>
    </form>
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
