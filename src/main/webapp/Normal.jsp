<%@page import="com.cart.dp.entities.User"%>
<%
    User user=(User)session.getAttribute("current-user");
    if(user==null)
    {
        session.setAttribute("message","You are not logged in !! Login First");
        response.sendRedirect("Login.jsp");
        return;
    }
    else
    {
        if(user.getUser_type().equals("Normal"))
        {
            %>
       

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Normal Page</title>
   <%@include file="/Components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="/Components/navbar.jsp" %>
        <h1>Normal Page!</h1>
    </body>
</html>
     
            <%
        }
    }
%>