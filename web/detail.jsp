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
        Book book = (Book) request.getAttribute("book");
        pageContext.setAttribute("book", book);
        HttpSession sesion = request.getSession();
        String user = (String) sesion.getAttribute("name");
        Boolean sis = user == null;
        pageContext.setAttribute("sis", sis);
      %>
  <header>
    <%@include file="/navbar.jsp" %>
  </header>
      <center><h1 class="mx-5">${book.name}</h1></center>
    <div class="card">

      <div class="row no-gutters">
        <aside class="col-sm-5 border-right my-auto">
          <article class="gallery-wrap">
            <div class="img-big-wrap">
              <img class="mx-5 my-3 rounded zoom float-right" style="max-width: 60%; max-height: 60%;" src="${book.cover}"></a>
            </div> <!-- slider-product.// -->
          </article> <!-- gallery-wrap .end// -->
        </aside>
        <aside class="col-sm-7">
          <article class="p-4">
            <h3 class="title mb-3">${book.author}</h3>
            <div class="mb-3">
              <var class="price h3 text-warning">
                <span class="h3 price">${book.price} €</span>
              </var>
              <span>/per unit</span>
            </div> <!-- price-detail-wrap .// -->
            <dl>
              <dt>Description</dt>
              <dd>
                <p>${book.description}</p>
              </dd>
              <dd>
                <p> </p>
              </dd>
            </dl>
            <dl class="row">
              <dt class="col-sm-3">Units</dt>
              <dd class="col-sm-9">${book.stock}</dd>

              <dt class="col-sm-3">Delivery</dt>
              <dd class="col-sm-9">Spain </dd>
            </dl>
            <p class="rating-wrap my-0 text-warning">
              <c:if test="${book.rating == 0}">
                <i class="far fa-star"></i>
                <i class="far fa-star"></i>
                <i class="far fa-star"></i>
                <i class="far fa-star"></i>
                <i class="far fa-star"></i>
              </c:if>
              <c:if test="${book.rating == 1}">
                <i class="fas fa-star"></i>
                <i class="far fa-star"></i>
                <i class="far fa-star"></i>
                <i class="far fa-star"></i>
                <i class="far fa-star"></i>
              </c:if>
              <c:if test="${book.rating == 2}">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="far fa-star"></i>
                <i class="far fa-star"></i>
                <i class="far fa-star"></i>
              </c:if>
              <c:if test="${book.rating == 3}">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="far fa-star"></i>
                <i class="far fa-star"></i>
              </c:if>
              <c:if test="${book.rating == 4}">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="far fa-star"></i>
              </c:if>
              <c:if test="${book.rating == 5}">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
              </c:if>
            </p>
            <!-- rating-wrap.// -->
            <hr>
            <div class="row">
              <div class="col-sm-12">
                <dl class="dlist-inline">
                  <dt>Quantity: </dt>
                  <dd>
                    <select class="form-control form-control-sm" style="width:70px;">
                      <option>1</option><option>2</option><option>3</option>
                      <option>4</option><option>5</option><option>6</option>
                      <option>7</option><option>8</option>
                    </select>
                  </dd>
                  <c:if test = "${sis}">
                    <a href="login.jsp" class="btn  btn-outline-primary"> <i class="fas fa-shopping-cart"></i> Add to cart </a>
                  </c:if>
                  <c:if test = "${!sis}">
                    <a href="cart.do?bookId=${book.bookId}" class="btn  btn-outline-primary"> <i class="fas fa-shopping-cart"></i> Add to cart </a>
                  </c:if>
                </dl> <!-- item-property .// -->
              </div> <!-- col.// -->
            </div> <!-- row.// -->
          </article> <!-- card-body.// -->
        </aside> <!-- col.// -->
      </div> <!-- row.// -->
    </div> <!-- card.// -->

    <footer class="footer font-small blue pt-4" style="margin-top: 10%; margin-left: 20%">
      <%@include file="/footer.jsp" %>
    </footer>
</body>

</html>
