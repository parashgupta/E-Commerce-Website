<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Login-My cart</title>
        <%@include file="Components/common_css_js.jsp" %>
    </head>
    <body>
                <%@include file = "/Components/navbar.jsp"%>
            <div class="container">
                <div class="row">
                    <div class="col-md-6 offset-md-3">
                        <div class="card mt-3">
                            
                            <div class="card-header custom-bg text-white">
                                <h1>Login here</h1>
                            </div>
                            
                            <div class="card-body">
                                <%@include file= "/Components/message.jsp" %>
                                <form action="Login" method="post">
                                        <div class="form-group">
                                          <label for="exampleInputEmail1">Email address</label>
                                          <input type="email" class="form-control" id="exampleInputEmail1" name="email" aria-describedby="emailHelp" placeholder="Enter email">
                                          <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                        </div>
                                        <div class="form-group">
                                          <label for="exampleInputPassword1">Password</label>
                                          <input type="password" class="form-control" id="exampleInputPassword1" name="password" placeholder="Password">
                                        </div>
                                    <a href ="Register.jsp " class="text-center d-block mb-2">If not Registered then click here</a>
                                            <div class="container text-center">
                                                <button type="submit" class="btn btn-primary custom-bg border-0">Submit</button>
                                                <button type="reset" class="btn btn-primary custom-bg border-0">Reset</button>
                                            </div>
                                </form>
                             </div>
                          
                         </div>
                    </div>
                </div>
            </div>
        <%@include file="/Components/footer.jsp" %>
    </body>
</html>
