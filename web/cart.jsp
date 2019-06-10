<%--
Created on : 30/05/2019
Author : marcbove
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
  <%@include file="/meta.jsp" %>
</head>

<body>
  <header>
    <%@include file="/navbar.jsp" %>
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
            <th scope="col" width="130"><var class="price"> €</var></th>
            </th>
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
    <%@include file="/footer.jsp" %>
  </footer>
</body>

</html>
