package com.example.exercice1;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "updateProductServlet", value = "/product-update")
public class UpdateProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));

        Product product = Database.products.stream()
                .filter(p -> p.id == id)
                .findFirst()
                .orElse(null);

        if (product != null) {
            req.setAttribute("product", product);
            req.getRequestDispatcher("editProduct.jsp").forward(req, resp);
        } else {
            resp.sendRedirect("product");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String description = req.getParameter("description");
        double price = Double.parseDouble(req.getParameter("price"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));

        Product product = Database.products.stream()
                .filter(p -> p.id == id)
                .findFirst()
                .orElse(null);

        if (product != null) {
            product.name = name;
            product.description = description;
            product.price = price;
            product.quantity = quantity;
        }

        resp.sendRedirect("product");
    }
}
