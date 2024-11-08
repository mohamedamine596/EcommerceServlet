package com.example.exercice1;

public class Product {
    private static int idCounter = 0;
    public int id;
    public String name;
    public String description;
    public double price;
    public int quantity;

    public Product(String name, String description, double price, int quantity) {
        this.id = idCounter++;
        this.name = name;
        this.description = description;
        this.price = price;
        this.quantity = quantity;
    }
}
