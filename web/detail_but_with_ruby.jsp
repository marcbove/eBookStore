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

          <div class="card">
            <div>
            </div>
            <div class="row no-gutters">
              <aside class="col-sm-5 border-right my-auto">
                <article class="gallery-wrap">
                  <div class="img-small-wrap">
                    <div> <a data-fancybox=""><!--img src="<%= @product.url %>" --></a></div>
                  </div> <!-- slider-product.// -->
                </article> <!-- gallery-wrap .end// -->
              </aside>
              <aside class="col-sm-7">
                <article class="p-4">
                  <h3 class="title mb-3"> <!--%= @product.name %--> </h3>
                  <div class="mb-3">
                    <var class="price h3 text-warning">
                      <span class="h3 price"> <!--%= @product.price.round(2) %--> €</span><del class="price-old"> <%= (@product.price * 1.2).round(2) %> €</del>
                    </var>
                    <span>/per unit</span>
                  </div> <!-- price-detail-wrap .// -->
                  <dl>
                    <dt>Description</dt>
                    <!-- <dd><p> <%#=Internalization.find_by(lenguage: "español" , id_producto: @producto.id, tipo:"descripción")%> </p></dd> -->
                    <dd><p> <!--%= @product.description %--></p></dd>
                  </dl>
                  <dl class="row">
                    <dt class="col-sm-3">Category</dt>
                    <dd class="col-sm-9"><!--%= @product.description %--></dd>

                    <dt class="col-sm-3">Units</dt>
                    <dd class="col-sm-9"> <!--%= @product.units %--></dd>

                    <dt class="col-sm-3">Delivery</dt>
                    <dd class="col-sm-9">Spain </dd>
                  </dl>
                  <div class="rating-wrap">
                    <ul class="rating-stars">
                      <li style="width:80%" class="stars-active">
                        <i class="fa fa-star"></i> <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i> <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                      </li>
                      <li>
                        <i class="fa fa-star"></i> <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i> <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                      </li>
                    </ul>
                    <div class="label-rating">0 reviews</div>
                    <div class="label-rating">0 orders </div>
                  </div> <!-- rating-wrap.// -->
                  <hr>
                    <div class="row">
                      <div class="col-sm-12">
                        <dl class="dlist-inline">
                          <dt>Quantity: </dt>
                          <dd>
                            <select class="form-control form-control-sm" style="width:70px;" disabled>
                              <option> 1 </option>
                              <option> 2 </option>
                              <option> 3 </option>
                            </select>
                          </dd>
                          <a></a>
                        </dl>  <!-- item-property .// -->
                      </div> <!-- col.// -->
                    </div> <!-- row.// -->
                  </article> <!-- card-body.// -->
                </aside> <!-- col.// -->
              </div> <!-- row.// -->
            </div> <!-- card.// -->

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
