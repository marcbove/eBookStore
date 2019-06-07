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

              <ul class="nav navbar-nav navbar-right">
                <li class="nav-item active"><a href="login.jsp">Login</a></li>
                &nbsp or &nbsp
                <li class="nav-item active"><a href="register.jsp">Register</a></li>
                <li class="nav-item active"><a href="cart.jsp">${username}'s Shopping Cart</a></li>
              </ul>
            </nav>
          </header>
          <div class="container" style="width: 99%">
            <br>
              <div class="card">
                <table class="table table-hover shopping-cart-wrap">
                  <thead class="text-muted">
                    <tr>
                      <th scope="col">Product</th>
                      <th scope="col" width="120">Quantity</th>
                      <th scope="col" width="130">Price</th>
                      <th scope="col" width="200" class="text-right">Action</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach var="book" items="${books.books}">

                      <tr>
                        <td>
                          <figure class="media">
                            <div class="img-wrap">
                              <a href=""><img src="" class="img-md"></a>
                            </div>
                            <figcaption class="media-body">
                              <h6 class="title text-truncate"> </h6>
                              <dl class="dlist-inline small">
                                <dt>Status: </dt>
                                <dd style="color: green; ">In stock</dd>
                              </dl>
                              <dl class="dlist-inline small">
                                <dt>Price Unit: </dt>
                                <dd> €</dd>
                              </dl>
                            </figcaption>
                          </figure>
                        </td>
                        <td>
                          <select class="form-control" disabled>
                            <option selected="selected"></option>
                          </select>
                        </td>
                        <td>
                          <div class="price-wrap">
                            <var class="price"> €</var>
                          </div> <!-- price-wrap .// -->
                        </td>
                        <td class="text-right">
                          <a></a>
                        </td>
                      </tr>
                    </c:forEach>
                  </tbody>
                  <thead class="text-muted">
                    <tr>
                      <th scope="col">TOTAL</th>
                      <th scope="col" width="120"></th>
                      <th scope="col" width="130"><var class="price"> €</var></th></th>
                      <th scope="col" width="200" class="text-right"></th>
                    </tr>
                  </thead>
                </table>
              </div> <!-- card.// -->

              <div class="ml-auto" style="float: right; margin-top: 1%; margin-right: 1%">
                <button type="submit" class="btn btn-primary">Proceed to Checkout</button>
              </div>
            </div>
            <footer class="footer font-small blue pt-4" style="margin-top: 10%; margin-left: 20%">
              <div class="container">
                <div class="row">
                  <div class="col-md-8">
                    <h5>Information</h5>
                    <ul>
                      <li>Created by: Marc Bove & Oriol Balague</li>
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
