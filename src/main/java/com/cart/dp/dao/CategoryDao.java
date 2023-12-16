package com.cart.dp.dao;

import org.hibernate.SessionFactory;
import com.cart.dp.entities.Category;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
public class CategoryDao 
{
    private SessionFactory factory;

    public CategoryDao(SessionFactory factory)
    {
        this.factory = factory;
    }

    public CategoryDao() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public int saveCategory(Category cat)
    {
       Session session = this.factory.openSession();
       Transaction tx = session.beginTransaction();
       int cat_id = (int) session.save(cat);
       tx.commit();
       session.close();
        return cat_id;
    }
    public List<Category> getCategory()
    {
       Session session = this.factory.openSession();
        Query query = session.createQuery("from Category");
        List<Category> list= query.list();
        return list;
    }
    
    public Category getCategoryById(int c_id)
    {
        Category cat=null;
        try
        {
       Session session = this.factory.openSession();
       cat = session.get(Category.class,c_id);
       session.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return cat;
    }
    
    
}
