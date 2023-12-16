package com.cart.dp.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.cart.dp.dao.UserDao;
import com.cart.dp.entities.User;
import com.cart.dp.helper.FactoryProvider;
import static com.cart.dp.helper.encrypt.encrypt_password;
import javax.servlet.http.HttpSession;

public class Login extends HttpServlet 
{

       public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
       {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) 
        {
            try
            {
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                
                
                //decrypt password
                password = encrypt_password(password);
                //validation
                //user authentication
                
               UserDao userDao =  new UserDao(FactoryProvider.getFactory());
                User user = userDao.getUserByEmailAndPassword(email,password);
                
                HttpSession httpSession = request.getSession();
               if(user==null)
               {
                   httpSession.setAttribute("message", "Invalid Details !!! Try with another one");
                   response.sendRedirect("Login.jsp");
                   return;
               }
               else
               {
                   out.println("<h1>Welcome"+user.getUser_name()+"</h1>");
                   
                   httpSession.setAttribute("current-user",user);
                   if(user.getUser_type().equals("Admin"))
                   {
                                          //admin.jsp  
                       response.sendRedirect("Admin.jsp");
                   }
                   else if(user.getUser_type().equals("Normal"))
                   {
                                          //normal.jsp  
                       response.sendRedirect("Normal.jsp");
                   }
                   else
                   {
                       out.println("We have not indentified user type !!!");
                   }
               }
                
            }
            catch(Exception e)
            {
               out.println(e);
            }
        }
       }
}