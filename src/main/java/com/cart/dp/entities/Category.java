package com.cart.dp.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.OneToMany;

@Entity
public class Category 
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int category_id;
    private String category_title;
    private String category_description;
    @OneToMany(mappedBy ="category")
    private List<Product> products = new ArrayList<>();

    public Category() 
    {
        
    }

    public Category(String category_title, String category_description,List<Product> products) 
    {
        this.category_title = category_title;
        this.category_description = category_description;
        this.products = products;
    }

    public Category(int category_id, String category_title, String category_description) 
    {
        this.category_id = category_id;
        this.category_title = category_title;
        this.category_description = category_description;
    }

    
    
    public int getCategory_id() 
    {
        return category_id;
    }

    public void setCategory_id(int category_id) 
    {
        this.category_id = category_id;
    }

    public String getCategory_title() 
    {
        return category_title;
    }

    public void setCategory_title(String category_title)
    {
        this.category_title = category_title;
    }

    public String getCategory_description() 
    {
        return category_description;
    }

    public void setCategory_description(String category_description) 
    {
        this.category_description = category_description;
    }

    public List<Product> getProducts() 
    {
        return products;
    }

    public void setProducts(List<Product> products) 
    {
        this.products = products;
    }

    
    
    @Override
    public String toString() 
    {
        return "Category{" + "category_id=" + category_id + ", category_title=" + category_title + ", category_description=" + category_description + '}';
    }
    
    
}
