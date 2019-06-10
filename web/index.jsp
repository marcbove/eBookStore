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
  <div class="container" style="margin-top: 2%">
    <center>
      <h1>eBookStore</h1>
    </center>
    <form action="criterion.do">
      <div class="row">
        &nbsp&nbsp&nbsp
        <div class="column">
          <select class="form-control" name="sort">
            <option value="price">Price</option>
            <option value="rating">Rating</option>
          </select>
        </div>
        <div class="column input-group-btn">
          &nbsp
          <button type="submit" class="btn btn-primary">Sort</button>
        </div>
      </div>
    </form>
    <br>
    <div class="card">
      <c:forEach var="book" items="${books}">
        <article class="itemlist">
          <div class="row row-sm">
            <aside class="col-sm-3">
              <div class="img-wrap">
                  <img style="max-width: 60%; max-height: 60%;" src="${book.cover}" class="mx-5 py-1 zoom img-md" alt="${book.name} Book Cover">
              </div>
            </aside>
            <!-- col.// -->
            <div class="col-sm-6">
              <div class="text-wrap">
                <h3>
                  ${book.name}
                </h3>
                <p>
                  ${book.description}
                </p>
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
              </div>
              <!-- text-wrap.// -->
            </div>
            <!-- col.// -->
            <aside class="col-sm-3">
              <div class="border-left pl-3">
                <div class="price-wrap">
                  <span class="h3 price">
                    ${book.price} €</span>
                </div>
                <!-- info-price-detail // -->
                <p class="text-success">Free shipping</p>
                <p>
                  <a href="books.do?id=${book.bookId}" class="btn btn-warning">Detail</a>
                </p>
              </div>
              <!-- action-wrap.// -->
            </aside>
            <!-- col.// -->
          </div>
          <!-- row.// -->
        </article>
        <!-- itemlist.// -->
      </c:forEach>
    </div>
    <!-- card.// -->
    <footer class="footer font-small blue pt-4" style="margin-top: 10%; margin-left: 20%">
      <%@include file="/footer.jsp" %>
    </footer>
</body>

</html>
