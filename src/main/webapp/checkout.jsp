<%
    User user=(User)session.getAttribute("current-user");
    if(user==null)
    {
        session.setAttribute("message","You are not logged in !! Login First to access checkout page");
        response.sendRedirect("Login.jsp");
        return;
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout</title>
        <%@include file="/Components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file = "Components/navbar.jsp"%>

        <div class="container">
            <div class="row mt-5">
                <div class="col-md-6">
                    <!--card-->
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center mb-5">Your Selected Item</h3>
                            <div class="cart-body">
                        
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <!--form details-->
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center mb-5">Your details for order</h3>
                            <form action="#">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input value="<%=user.getUser_email()%>"type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" readonly>
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                    
                                <div class="form-group">
                                    <label for="name">Your name</label>
                                    <input value="<%=user.getUser_name()%>"type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter name" >
                                </div>
                                    
                                <div class="form-group">
                                    <label for="name">Your contact</label>
                                    <input value="<%=user.getUser_phone()%>"type="text" class="form-control" id="phone" aria-describedby="emailHelp" placeholder="Enter Contact number">
                                </div>
                                
                                <div class="form-group">
                                    <label for="exampleFormControlTextarea1">Your shipping address</label>
                                    <textarea value="<%=user.getUser_address()%>"class="form-control" id="address" rows="3" placeholder="Enter your address"></textarea>
                                </div>
                                
                                <div class="container text-center">
                                    <button class="btn btn-outline-success">Order now</button>
                                    <button class="btn btn-outline-primary">Continue shopping</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <%@include file = "Components/common_modals.jsp"%>
        <%@include file="/Components/footer.jsp" %>
    </body>
</html>
