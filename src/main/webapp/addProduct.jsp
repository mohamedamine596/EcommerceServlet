<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Add New Product</title>
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
    .add-product-container {
      width: 400px;
      padding: 20px;
      background-color: #fff;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    .add-product-container h2 {
      text-align: center;
      margin-bottom: 20px;
    }
    .add-product-container label {
      display: block;
      margin-bottom: 5px;
      font-weight: bold;
      color: #333;
    }
    .add-product-container input[type="text"],
    .add-product-container input[type="number"],
    .add-product-container textarea {
      width: 100%;
      padding: 10px;
      margin-bottom: 15px;
      border: 1px solid #ddd;
      border-radius: 5px;
      font-size: 1em;
    }
    .add-product-container button {
      width: 100%;
      padding: 10px;
      background-color: #4CAF50;
      color: white;
      border: none;
      border-radius: 5px;
      font-size: 1em;
      cursor: pointer;
      transition: background-color 0.3s;
    }
    .add-product-container button:hover {
      background-color: #45a049;
    }
  </style>
</head>
<body>
<div class="add-product-container">
  <h2>Add New Product</h2>
  <form action="product" method="post">
    <label for="name">Product Name</label>
    <input type="text" id="name" name="name" required>

    <label for="description">Description</label>
    <textarea id="description" name="description" rows="3" required></textarea>

    <label for="price">Price</label>
    <input type="number" id="price" name="price" step="0.01" required>

    <label for="quantity">Quantity</label>
    <input type="number" id="quantity" name="quantity" required>

    <button type="submit">Add Product</button>
  </form>
</div>
</body>
</html>
