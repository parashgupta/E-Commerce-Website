<%@page import="com.cart.dp.helper.Helper"%>
<%@page import="com.cart.dp.dao.CategoryDao"%>
<%@page import="com.cart.dp.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.cart.dp.entities.Product"%>
<%@page import="com.cart.dp.dao.ProductDao"%>
<%@page import="com.cart.dp.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <%@include file="/Components/common_css_js.jsp" %>
        
        </head>
    <body>
        <%@include file = "Components/navbar.jsp"%>
        
        <div class="container-fluid">
        <div class="row mt-3 mx-2">
            
            <%
            String cat= request.getParameter("category");
            ProductDao pDao = new ProductDao(FactoryProvider.getFactory());
            List<Product> list = null;
            
            if(cat==null || cat.trim().equals("all"))
            {
             list = pDao.getProduct();
            }
            else
            {
            int cid = Integer.parseInt(cat.trim());
            list = pDao.getProductById(cid);
            }
             
            CategoryDao cDao = new CategoryDao(FactoryProvider.getFactory());
            List<Category> clist = cDao.getCategory();
            %>
            
            <!--show categories-->
            <div class="col-md-2">
                <div class="list-group mt-4">
                  <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">All Products</a>  
                
                 <%
                    for(Category category:clist)
                    {
                 %>
                 <a href="index.jsp?category=<%= category.getCategory_id()%>" class="list-group-item list-group-item-action"><%= category.getCategory_title()%></a>
                    <%}%>
                    
                </div>
            </div>
            
            <!--show products-->
            <div class="col-md-10 mt-4" id="wrapper">
              
                            <!--travesing products-->
                            <div class="card-container">
                                <div class="gallery">
                            <%
                            for(Product p:list)
                            {
                            %>
                            <div class="card photo">
                                <div class="text-center">
                                <img style="width:auto;max-width: 100%" src="img/Products/<%=p.getP_photo()%>" class="card-img-top" alt="...">
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title"><%= p.getP_name()%></h5>
                                    <p class="card-text"><%=Helper.get10Words(p.getP_desc()) %></p>
                                </div>
                                <div class="card-footer text-center" style="padding: 10px;">
                                    <button class="btn- custom-bg text-white" onclick="add_to_cart(<%=p.getP_id()%>,'<%=p.getP_name()%>', <%=p.getP_price()%>)">Add to Cart</button>
                                    <button class="btn- btn-outline-success">&#8377;<%= p.getPriceAfterDiscount()%>/- <span class="discount-label"><%=p.getP_discount()%>% off &nbsp;&nbsp;</span><span class="text-secondary"><s>&#8377;<%=p.getP_price()%></s></span></button>
                                </div>
                            </div>                            
                            <%}
                            if(list.size()==0)
                            {
                            out.println("No item in this category");
                            }
                            
                            %>
                        </div>
                    </div>
                <!--</div>-->
                
            </div>   
            
        </div>
        </div>

        <%@include file="/Components/common_modals.jsp" %>
        <%@include file="/Components/footer.jsp" %>
    </body>
</html>
