<%--
Created on : 30/05/2019
Author : marcbove
--%>
<%@page import="entities.Book"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
  <%@include file="/meta.jsp" %>
</head>

<body>
  <%
    HttpSession sesion = request.getSession();
    String user = (String) sesion.getAttribute("name");
    Boolean sis = user == null;
    pageContext.setAttribute("sis", sis);
  %>
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
            <th scope="col" width="120">Price</th>
            <th scope="col" width="200" class="text-right">Action</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="book" items="${cart}">
          <tr>

              <td>
                <figure class="media">
                  <div class="img-wrap"><img style="max-width:25%; max-height:25%;" src="${book.cover}" class="img-thumbnail img-sm"></div>
                  <figcaption class="media-body">
                    <h6 class="title text-truncate">${book.name}</h6>
                    <dl class="dlist-inline small">
                      <dt>${book.author}</dt>
                    </dl>
                  </figcaption>
                </figure>
              </td>
              <td>
                <select class="form-control">
                  <option>1</option>
                  <option>2</option>
                  <option>3</option>
                  <option>4</option>
                </select>
              </td>
              <td>
                <div class="price-wrap">
                  <var class="price">${book.price} €</var><br>
                  <small class="text-muted">(${book.price} € each)</small>
                </div> <!-- price-wrap .// -->
              </td>
              <td class="text-right">
                <a href="" class="btn btn-outline-danger"> × Remove</a>
              </td>

          </tr>
          </c:forEach>
        </tbody>
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
