package com.example.exercice1;

import java.util.ArrayList;
import java.util.List;

public class Database {
    public static List<User> users = new ArrayList<>() {
        {add(new User("admin", "admin@admin.com", "admin", "admin"));}
        {add(new User("seller", "seller@gmail.com", "seller", "seller"));}
        {add(new User("buyer", "buyer@gmail.com", "buyer", "buyer"));}
    };

    public static List<Product> products = new ArrayList<>() {
        {add(new Product("Product 1", "Description 1", 10.0, 100));}
        {add(new Product("Product 2", "Description 2", 20.0, 200));}
        {add(new Product("Product 3", "Description 3", 30.0, 300));}
    };
}
