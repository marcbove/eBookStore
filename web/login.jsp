<%--
Created on : 30/05/2019
Author : marcbove
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
        <link href="css/bootstrap.min.css" rel="stylesheet">
          <script src="js/bootstrap.min.js"></script>
          <title>eBookStore</title>
        </head>
        <body>
          <header>
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
              <div class="navbar-collapse">
                <ul class="navbar-nav mr-auto">
                  <li class="nav-item">
                    <a class="nav-link" href="/eBookStore" role="button">
                      Show All Products
                    </a>
                  </li>
                  <li class="nav-item">
                    <form class="form-inline">
                    </form>
                  </li>
                </ul>
                <ul class="navbar-nav lg-ml-5">
                  <li class="nav-item ml-auto">
                  </li>
                </ul>
              </div>
              <!--c:if test = "${sis}">
              <ul class="nav navbar-nav navbar-right">
              <li class="nav-item active"><a href="login.jsp">Login</a></li>
              &nbsp or &nbsp
              <li class="nav-item active"><a href="register.jsp">Register</a></li>
            </ul>
          </c:if>
          <c:if test = "${!sis}">
          <ul class="nav navbar-nav navbar-right">
          <li class="nav-item active"><a href="carrito.jsp">${username}'s Shopping Cart</a></li>
        </ul>
      </c:if-->
      <ul class="nav navbar-nav navbar-right">
        <li class="nav-item active"><a href="login.jsp">Login</a></li>
        &nbsp or &nbsp
        <li class="nav-item active"><a href="register.jsp">Register</a></li>
        <li class="nav-item active"><a href="carrito.jsp">${username}'s Shopping Cart</a></li>
      </ul>
    </nav>
  </header>

  <div class="container" style="width: 50%">
    <div class="card">
      <article class="card-body">
        <h4 style="font-weight: 350; font-size: 2.5rem;" class="card-title mb-4 mt-1">Login</h4>
        <form>
          <div class="form-group">
            <label style="font-weight: 300; font-size: 1.5rem; width: 220px;">E-Mail</label>
            <input type="text" class="form-control" placeholder="E-Mail" required autofocus>
          </div> <!-- form-group// -->
          <div class="form-group">
            <label style="font-weight: 300; font-size: 1.5rem; width: 220px;">Password></label>
            <input type="password" class="form-control" placeholder="Password" required autofocus>
          </div> <!-- form-group// -->
          <div class="form-group">
            <div class="checkbox" style="">
              <label style="font-weight: 250; font-size: 1.25rem;"> <input type="checkbox"> Remember password </label>
            </div> <!-- checkbox .// -->
          </div> <!-- form-group// -->
          <div class="form-group">
            <button class="btn btn-primary btn-block" type="submit">Login</button>
          </div> <!-- form-group// -->
        </form>
      </article>
    </div> <!-- card.// -->
  </div>

  <footer class="footer font-small blue pt-4" style="margin-top: 10%; margin-left: 20%">
    <div class="container" >
      <div class="row">
        <div class="col-md-8">
          <h5>Information</h5>
          <ul>
            <li>Created by: Marc Bové & Oriol Balagué</li>
            <li><a href="https://github.com/marcbove/eBookStore">GitHub Project</a></li>
          </ul>
        </div>
        <div class="col-md-9">
          <ul class="footer-copyright text-center py-3">© 2019 Copyright </ul>
        </div>
      </div>
    </div>
  </footer>
</body>
</html>
