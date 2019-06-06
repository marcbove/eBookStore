<%--
Created on : 30/05/2019
Author : marcbove
--%>
<%@page import="entities.AvailableBooks"%>
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
          <%
          HttpSession sesion = request.getSession();
          String user = (String) sesion.getAttribute("username");
          Boolean sis = user == null;
          pageContext.setAttribute("sis", sis);
          %>
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
              <!--
              <c:if test = "${sis}">
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
              </c:if>
            -->
                <ul class="nav navbar-nav navbar-right">
                  <li class="nav-item active"><a href="login.jsp">Login</a></li>
                  &nbsp or &nbsp
                  <li class="nav-item active"><a href="register.jsp">Register</a></li>
                  <li class="nav-item active"><a href="carrito.jsp">${username}'s Shopping Cart</a></li>
                </ul>
            </nav>
          </header>
          <div class="container" style="margin-top: 2%">
            <center><h1>eBookStore</h1></center>
            <div class="row">
              <div class="column">
                <select class="form-control" name="sort">
                  <option value="price">Price</option>
                  <option value="rating">Rating</option>
                </select>
              </div>
              <div class="column input-group-btn">
                <button type="submit" class="btn btn-default">Order</button>
              </div>
            </div>
            <br>
              <div class="card">
                <c:forEach var="book" items="${books.books}">
                  <article class="itemlist">
                    <div class="row row-sm">
                      <aside class="col-sm-3">
                        <div class="img-wrap"><a href=""><img src="${book.img}" class="img-md"></div></a>
                      </aside> <!-- col.// -->
                      <div class="col-sm-6">
                        <div class="text-wrap">
                          <h3> ${book.title} </h3>
                          <p> ${book.description} </p>
                          <p class="rating-wrap my-0 text-muted">
                            <span class="label-rating">0 reviews</span>
                            <span class="label-rating">0 orders </span>
                          </p> <!-- rating-wrap.// -->
                        </div> <!-- text-wrap.// -->
                      </div> <!-- col.// -->
                      <aside class="col-sm-3">
                        <div class="border-left pl-3">
                          <div class="price-wrap">
                            <span class="h3 price"> ${book.price} €</span>
                          </div> <!-- info-price-detail // -->
                          <p class="text-success">Free shipping</p>
                          <p>
                            <a></a>
                            <a href="" class="btn btn-light">Details</a>
                          </p>
                        </div> <!-- action-wrap.// -->
                      </aside> <!-- col.// -->
                    </div> <!-- row.// -->
                  </article> <!-- itemlist.// -->
                </c:forEach>
              </div> <!-- card.// -->
              <footer class="footer font-small blue pt-4" style="margin-top: 10%; margin-left: 20%">
                <div class="container" >
                  <div class="row">
                    <div class="col-md-8">
                      <h5>Information</h5>
                      <ul>
                        <li>Created by: Marc Bové & Oriol Balagué</li>
                        <li><a href="https://github.com/marcbove/eBookStore">GitHub Project</a></li>
                        <li><a href="install.jsp">Drop & Create DataBase</a></li>
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
