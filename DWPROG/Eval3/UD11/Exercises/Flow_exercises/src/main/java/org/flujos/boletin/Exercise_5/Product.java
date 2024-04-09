package org.flujos.boletin.Exercise_5;

import java.io.Serializable;

public class Product implements Serializable {

   // @Serial
    //private static final long serialVersionUID = 1L;
    String name;
    int price;
    public Product(){
        name = "";
        price = 0;
    }
    public Product(String name, int price){
        this.name = name;
        this.price = price;
    }

    @Override
    public String toString() {
        return "Product{" +
                "name='" + name + '\'' +
                ", price=" + price +
                '}';
    }
}
