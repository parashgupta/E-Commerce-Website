package com.cart.dp.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.cart.dp.entities.User;
import com.cart.dp.helper.FactoryProvider;
import static com.cart.dp.helper.encrypt.encrypt_password;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class Register extends HttpServlet 
{

       public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
       {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) 
        {
            try
            {
                String user_name = request.getParameter("user_name");
                String user_email = request.getParameter("user_email");
                String user_password = request.getParameter("user_password");
                String user_phone = request.getParameter("user_phone");
                String user_address = request.getParameter("user_address");
                
                //encrypt_password
                user_password = encrypt_password(user_password);
                //validation
                User user = new User(user_name,user_email,user_password,user_phone,"default.jpg",user_address,"Normal");
                Session hibernateSession = FactoryProvider.getFactory().openSession();
                Transaction tx = hibernateSession.beginTransaction();
                int user_id = (int)hibernateSession.save(user);
                tx.commit();
                
                hibernateSession.close();
                
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message","Registration Successful !!"+user_id);
                response.sendRedirect("Register.jsp");
                return;
            }
            catch(Exception e)
            {
                out.println(e);
            }
        }
       }
}

