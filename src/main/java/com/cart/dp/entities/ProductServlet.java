package com.cart.dp.entities;

import com.cart.dp.dao.CategoryDao;
import com.cart.dp.dao.ProductDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.cart.dp.entities.Product;
import com.cart.dp.helper.FactoryProvider;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig  //to accept image

public class ProductServlet extends HttpServlet 
{
     public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
     {
        try (PrintWriter out = response.getWriter()) 
        {
            String op = request.getParameter("operation");
            if(op.trim().equals("addcategory"))
            {
             //fetching category data
            String cat_title = request.getParameter("cat_title");
            String cat_desc = request.getParameter("cat_desc");
            
            Category category = new Category();
            category.setCategory_title(cat_title);
            category.setCategory_description(cat_desc);
            
                CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
               int cat_id =  categoryDao.saveCategory(category);
               
               HttpSession httpSession = request.getSession();
               httpSession.setAttribute("message","Category added Successfully : "+cat_id);
               response.sendRedirect("Admin.jsp");
               return;
            
            }
            else if(op.trim().equals("addproduct"))
            {
                String p_name = request.getParameter("p_name");
                String p_desc = request.getParameter("p_desc");
                int p_price = Integer.parseInt(request.getParameter("p_price"));
                int p_discount = Integer.parseInt(request.getParameter("p_discount"));
                int p_quantity = Integer.parseInt(request.getParameter("p_quantity"));
                int cat_id = Integer.parseInt(request.getParameter("cat_id"));
                Part part = request.getPart("p_photo");
                
                Product p = new Product();
                
                p.setP_name(p_name);
                p.setP_desc(p_desc);
                p.setP_price(p_price);
                p.setP_discount(p_discount);
                p.setP_quantity(p_quantity);
                p.setP_photo(part.getSubmittedFileName());
                
                //get Category by Category id
                
                CategoryDao cDao = new CategoryDao(FactoryProvider.getFactory());
                Category category = cDao.getCategoryById(cat_id);
                p.setCategory(category);
                                
                ProductDao productDao = new ProductDao(FactoryProvider.getFactory());
                productDao.saveProduct(p);

                //photo upload
                //find the path to upload path;
                
                String path = request.getRealPath("img")+File.separator+"Products"+File.separator+part.getSubmittedFileName();
//                System.out.println(path);
                
                try
                {
                FileOutputStream fos = new FileOutputStream(path);
                InputStream is = part.getInputStream();
                
                //reading data
                byte data[] = new byte[is.available()];
                is.read(data);
                
                //writing data
                fos.write(data);
                fos.close();
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }
                
               HttpSession httpSession = request.getSession();
               httpSession.setAttribute("message","Product added Successfully !!");
               response.sendRedirect("Admin.jsp");
               return;
           }
            
           
        }
    }
}
