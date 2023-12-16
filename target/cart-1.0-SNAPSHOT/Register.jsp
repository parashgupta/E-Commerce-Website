<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>
        <%@include file="Components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file = "Components/navbar.jsp"%>
        
        <div class="container-fluid">
                <div class="row mt-5">
                    <div class="col-md-4 offset-md-4">
                        <div class="card">
         <%@include file = "Components/message.jsp"%>
                             <div class="card-body px-5">
                                  <h3 class="text-center my-3">Sign up here !!</h3>
                                  <form action="Register" method="post">

                             <div class="form-group">
                                    <label for="name">User Name</label>
                                    <input type="text" class="form-control" id="name" name="user_name" onkeyup="demo_name()" aria-describedby="emailHelp" placeholder="Enter here" required>
                                    <span id="u_name"></span>
                            </div>

                             <div class="form-group">
                                    <label for="Email">User E-mail</label>
                                    <input type="Email" class="form-control" id="email" name="user_email" onkeyup="demo_email()" aria-describedby="emailHelp" placeholder="Enter here" required>
                                    <p id="u_email"></p>
                             </div>

                             <div class="form-group">
                                    <label for="password">User password</label>
                                    <input type="password" class="form-control" id="password" name="user_password" onkeyup="demo_pass()"aria-describedby="emailHelp" placeholder="Enter here" required>
                                    <p id="u_pass"></p>
                            </div>

                             <div class="form-group">
                                    <label for="phone">User phone</label>
                                    <input type="number" class="form-control" id="phone"  name="user_phone" onkeyup="demo_phone()" aria-describedby="emailHelp" placeholder="Enter here" required>
                                    <p id="u_phone"></p>
                            </div>

                             <div class="form-group">
                                    <label for="address">User address</label>
                                    <textarea style="height:100px"type="textarea" class="form-control" name="user_address" id="address" aria-describedby="emailHelp" placeholder="Enter your address" required></textarea>
                                    <p id="u_address"></p>
                            </div>
                            <div class="container text-center">
                                <button class="btn btn-outline-success">Register</button>
                                <button class="btn btn-outline-warning">Reset</button>
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
