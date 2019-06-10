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
  <%
      HttpSession sesion = request.getSession();
      String user = (String) sesion.getAttribute("name");
      Boolean sis = (user == null);
      Boolean error = (Boolean) sesion.getAttribute("error");
      pageContext.setAttribute("sis", sis);
  %>
  <header>
    <%@include file="/navbar.jsp" %>
  </header>

  <div class="container" style="width: 50%">
    <div class="card">
      <article class="card-body">
        <h4 style="font-weight: 350; font-size: 2.5rem;" class="card-title mb-4 mt-1">Login</h4>
        <c:if test="${error}">
          <div class="alert alert-danger">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
            <strong>Error!</strong> Username or password incorrect.
          </div>
        </c:if>
        <form class="form-signin" action="login.do" method="post">

          <div class="form-group">
            <label for="name" style="font-weight: 300; font-size: 1.5rem; width: 220px;">Username</label>
            <input name="name" type="text" class="form-control" placeholder="Username" required="required" autofocus="autofocus">
          </div>
          <!-- form-group// -->
          <div class="form-group">
            <label for="password" style="font-weight: 300; font-size: 1.5rem; width: 220px;">Password</label>
            <input name="pswd" type="password" class="form-control" placeholder="Password" required="required" autofocus="autofocus">
          </div>
          <!-- form-group// -->
          <div class="form-group">
            <div class="checkbox" style="">
              <label style="font-weight: 250; font-size: 1.25rem;">
                <input type="checkbox">
                Remember password
              </label>
            </div>
            <!-- checkbox .// -->
          </div>
          <!-- form-group// -->
          <div class="form-group">
            <button class="btn btn-primary btn-block" type="submit">Login</button>
          </div>
          <!-- form-group// -->
        </form>
      </article>
    </div>
    <!-- card.// -->
  </div>
  <footer class="footer font-small blue pt-4" style="margin-top: 10%; margin-left: 20%">
    <%@include file="/footer.jsp" %>
  </footer>
</body>

</html>
