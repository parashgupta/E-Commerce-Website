package com.cart.dp.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;


@Entity
public class Product 
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
        @Column(length = 10, name= "user_id")
    private int p_id;
    private String p_name; 
            @Column(length = 3000, name= "p_desc")
    private String P_desc; 
    private String p_photo; 
    private int p_price; 
    private int p_discount; 
    private int p_quantity; 
    @ManyToOne
    private Category category;
    
    public Product() 
    {
        
    }

    public Product(String p_name, String P_desc, String p_photo, int p_price, int p_discount, int p_quantity,Category category) 
    {
        this.p_name = p_name;
        this.P_desc = P_desc;
        this.p_photo = p_photo;
        this.p_price = p_price;
        this.p_discount = p_discount;
        this.p_quantity = p_quantity;
        this.category = category;
    }

    public Product(int p_id, String p_name, String P_desc, String p_photo, int p_price, int p_discount, int p_quantity)
    {
        this.p_id = p_id;
        this.p_name = p_name;
        this.P_desc = P_desc;
        this.p_photo = p_photo;
        this.p_price = p_price;
        this.p_discount = p_discount;
        this.p_quantity = p_quantity;
    }

    public int getP_id() 
    {
        return p_id;
    }

    public void setP_id(int p_id) 
    {
        this.p_id = p_id;
    }

    public String getP_name() 
    {
        return p_name;
    }

    public void setP_name(String p_name) 
    {
        this.p_name = p_name;
    }

    public String getP_desc() 
    {
        return P_desc;
    }

    public void setP_desc(String P_desc) 
    {
        this.P_desc = P_desc;
    }

    public String getP_photo() 
    {
        return p_photo;
    }

    public void setP_photo(String p_photo)
    {
        this.p_photo = p_photo;
    }

    public int getP_price()
    {
        return p_price;
    }

    public void setP_price(int p_price) 
    {
        this.p_price = p_price;
    }

    public int getP_discount() 
    {
        return p_discount;
    }

    public void setP_discount(int p_discount)
    {
        this.p_discount = p_discount;
    }

    public int getP_quantity() 
    {
        return p_quantity;
    }

    public void setP_quantity(int p_quantity) 
    {
        this.p_quantity = p_quantity;
    }

    public Category getCategory() 
    {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    
    @Override
    public String toString() 
    {
        return "Product{" + "p_id=" + p_id + ", p_name=" + p_name + ", P_desc=" + P_desc + ", p_photo=" + p_photo + ", p_price=" + p_price + ", p_discount=" + p_discount + ", p_quantity=" + p_quantity + '}';
    }
    
    
    //calculate price after discount
    
    public int getPriceAfterDiscount()
    {
        int d = (int)((this.getP_discount()/100.0)*this.getP_price());
        return this.getP_price()-d;
    }
      
    
}
