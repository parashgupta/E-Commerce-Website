<%@page import="com.cart.dp.entities.User"%>
<%
    User user1=(User)session.getAttribute("current-user");

%>


<nav class="navbar navbar-expand-lg navbar-dark custom-bg">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">My cart</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
   </ul>
      <ul class="navbar-nav ml-auto">
          
          <li class="nav-item active">
              <a class="nav-link" href = "#" data-toggle="modal" data-target="#cart"><img onclick="update_cart()" src="Components/cart.png" width="30px" height="30px"><sup class="cart-items" style= "width:30px; height:30px;margin:5px; font-size:20px; border:1px solid black; border-radius:50%; background-color: red;">0</sup></a>
                </li>
          
          
          <%
              if(user1==null)
              {
              %>
                <li class="nav-item active">
                    <a class="nav-link" href = "Login.jsp">Login</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href = "Register.jsp">Register</a>
                </li>
              <% 
              }
              else
              {
              %>
                <li class="nav-item active">
                    <a class="nav-link" href = "<%= user1.getUser_type().equals("Admin") ? "Admin.jsp":"Normal.jsp"%>"><%= user1.getUser_name()%></a>
                </li>
               <li class="nav-item active">
                    <a class="nav-link" href = "Logout">Logout</a>
                </li>              <%
              }
          %>
          
         
      </ul>
  </div>
    </div>
</nav>