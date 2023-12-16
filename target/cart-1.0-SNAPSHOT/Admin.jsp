<%@page import="java.util.Map"%>
<%@page import="com.cart.dp.helper.Helper"%>
<%@page import="java.util.List"%>
<%@page import="com.cart.dp.entities.Category"%>
<%@page import="com.cart.dp.dao.CategoryDao"%>
<%@page import="com.cart.dp.helper.FactoryProvider"%>
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
            session.setAttribute("message","You are not Admin ! Do not access this page");
            response.sendRedirect("Login.jsp");
            return;
        }
    }
%>

            <!--Product Category-->
            <%
             CategoryDao cDao = new CategoryDao(FactoryProvider.getFactory());
             List<Category> list = cDao.getCategory();
             //getting count
             Map<String,Long> m = Helper.getCount(FactoryProvider.getFactory());
            %>




<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
        <%@include file="/Components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="/Components/navbar.jsp" %>
        
        <div class="container Admin">
            
            <div class="container-fluid mt-3">
                <%@include file="/Components/message.jsp" %>
            </div>
            
            <!--first-row-->
            <div class="row mt-4">
            
                 <!--first column-->
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                               <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/group.png" alt="Users"> 
                            </div>
                            <h1><%=m.get("userCount")%></h1>
                            <h1 class="text-uppercase text-muted">User</h1>
                        </div>
                    </div>
                </div>

                 <!--second column-->
                <div class="col-md-4">
                     <div class="card">
                        <div class="card-body text-center">
                             <div class="container">
                               <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/menu.png" alt="Categories"> 
                            </div>
                            <h1><%=list.size()%></h1>
                            <h1 class="text-uppercase text-muted">Categories</h1>
                        </div>
                    </div>
                </div>

                 <!--Third column-->
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                               <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/delivery-box.png" alt="Prosucts"> 
                            </div>
                            <h1><%=m.get("productCount")%></h1>
                            <h1 class="text-uppercase text-muted">Products</h1>
                        </div>
                    </div>
                </div>
            </div>
            
            <!--second row-->
             <div class="row mt-4">
            
                 <!--first column-->
                <div class="col-md-6">
                    <div class="card " data-toggle="modal" data-target="#add-category-modal">
                        <div class="card-body text-center">
                            <div class="container">
                               <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/keys.png" alt="Category"> 
                            </div>
                            <p class="col-mt-2">click here to add new Category</p>
                            <h1 class="text-uppercase text-muted ">Add Category</h1>
                        </div>
                    </div>
                </div>
                 
                <div class="col-md-6">
                    <div class="card " data-toggle="modal" data-target="#add-product-modal">
                        <div class="card-body text-center">
                            <div class="container">
                               <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/plus.png" alt="Product"> 
                            </div>
                            <p class="col-mt-2">click here to add new Product</p>
                            <h1 class="text-uppercase text-muted">Add Product</h1>
                        </div>
                    </div>
                </div>
                
             </div>
            
        </div>
        
        <!--Add Category Model-->
            <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog modal-lg" role="document" >
                <div class="modal-content">
                  <div class="modal-header custom-bg text-white">
                    <h5 class="modal-title" id="exampleModalLabel">Fill category detail</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">
                      <form action="ProductServlet" method="post">
                          
                          <input type="hidden" name="operation" value="addcategory">
                          
                          <div class="form-group">
                              <input type="text" class="form-control" name="cat_title" placeholder="Enter category title" required>
                          </div>
                          <div class="form-group">
                              <textarea style="height: 200px;" class="form-control" name="cat_desc" placeholder="Enter category description" required></textarea>
                          </div>
                          
                          <div class="container text-center">
                              <button class="btn btn-outline-success">Add category</button>
                              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                          </div>
                          
                      </form>
                  </div>
                  
                </div>
              </div>
            </div>
        
        <!--Add Product Model-->
            <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog modal-lg" role="document" >
                <div class="modal-content">
                  <div class="modal-header custom-bg text-white">
                    <h5 class="modal-title" id="exampleModalLabel">Fill product detail</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">
                      <form action="ProductServlet" method="post" enctype="multipart/form-data">
                          
                          <input type="hidden" name="operation" value="addproduct">
                             
                          <div class="form-group">
                              <input type="text" class="form-control" name="p_name" placeholder="Enter product name" required>
                          </div>
                           <div class="form-group">
                              <textarea style="height: 100px;" class="form-control" name="p_desc" placeholder="Enter product description" required></textarea>
                          </div>
                          <div class="form-group">
                              <input type="text" class="form-control" name="p_price" placeholder="Enter product price" required>
                          </div>
                          <div class="form-group">
                              <input type="text" class="form-control" name="p_discount" placeholder="Enter product discount" required>
                          </div>
                          <div class="form-group">
                              <input type="text" class="form-control" name="p_quantity" placeholder="Enter product Quantity" required>
                          </div>
                          
                          
                         
                          
                          <div class="form-group">
                              <select name="cat_id" class="form-control">
                                  <%
                                      for(Category c:list)
                                      {
                                  %>
                                  <option value=<%=c.getCategory_id()%>><%=c.getCategory_title()%></option>
                                  <%}%>
                              </select>
                          </div>
                          <div>
                              <label for="p_photo">Select picture of Product</label><br>
                              <input type="file" name="p_photo">
                          </div>
                          <div class="container text-center">
                              <button class="btn btn-outline-success">Add product</button>
                              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                          </div>
                          
                      </form>
                  </div>
                  
                </div>
              </div>
            </div>
                <%@include file = "Components/common_modals.jsp"%>
    </body>
</html>
