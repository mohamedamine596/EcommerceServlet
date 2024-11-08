package com.example.exercice1;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "productDetailServlet", value = "/product-details")
public class ProductDetailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Product product = Database.products.stream()
                .filter(p -> p.id == id)
                .findFirst()
                .orElse(null);

        if (product != null) {
            req.setAttribute("product", product);
            req.getRequestDispatcher("productDetails.jsp").forward(req, resp);
        } else {
            resp.sendRedirect("product");
        }
    }
}
