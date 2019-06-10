<%--
Created on : 30/05/2019
Author : oriol
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="entities.Customer"%>
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
        <h4 style="font-weight: 350; font-size: 2.5rem;" class="card-title mb-4 mt-1">Register</h4>
        <c:if test="${error}">
          <div class="alert alert-danger">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
            <strong>Error!</strong> Username or password incorrect.
          </div>
        </c:if>
        <form action="register.do">
          <div class="form-group">
            <label for="name" style="font-weight: 300; font-size: 1.5rem; width: 220px;">Username</label>
            <input name="name" type="text" class="form-control" placeholder="Username" required autofocus>
          </div> <!-- form-group// -->
          <div class="form-group">
            <label for="email" style="font-weight: 300; font-size: 1.5rem; width: 220px;">E-Mail</label>
            <input name="email" type="text" class="form-control" placeholder="E-Mail" required autofocus>
          </div> <!-- form-group// -->
          <div class="form-group">
            <label for="phone" style="font-weight: 300; font-size: 1.5rem; width: 220px;">Phone Number</label>
            <input name="phone" type="text" class="form-control" placeholder="Phone Number" required autofocus>
          </div> <!-- form-group// -->
          <div class="form-group">
            <label for="pswd" style="font-weight: 300; font-size: 1.5rem; width: 220px;">Password</label>
            <input name="pswd" type="password" class="form-control" placeholder="********" required autofocus>
          </div> <!-- form-group// -->
          <div class="form-group">
            <label style="font-weight: 300; font-size: 1.5rem; width: 620px;">Confirm Password</label>
            <input type="password" class="form-control" placeholder="********" required autofocus>
          </div>
          <div class="form-group">
            <label><strong>Gender:&nbsp&nbsp</strong></label>
            <label class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="gender" value="option1">
              <span class="form-check-label"> Male </span>
            </label>
            <label class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="gender" value="option2">
              <span class="form-check-label"> Female </span>
            </label>
            <label class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="gender" value="option2">
              <span class="form-check-label"> Other </span>
            </label>
          </div> <!-- form-group end.// -->
          <div class="form-group">
            <div class="checkbox" style="">
              <label style="font-weight: 250; font-size: 1.0rem;"> <input type="checkbox" checked="checked"> I would like to receive exclusive discounts, news and trends by e-mail. I can unsubscribe whenever I want.</label>
            </div> <!-- checkbox .// -->
          </div> <!-- form-group// -->
          <div class="form-group">
            <button class="btn btn-primary btn-block" type="submit">REGISTER NOW</button>
          </div> <!-- form-group// -->
          <label style="font-weight: 250; font-size: 1.0rem;">By clicking the 'Register Now' button, you confirm that you accept our Terms of use and Privacy Policy.</label>
        </form>
      </article>
      <div class="border-top card-body text-center">Already have an account? <a href="login.jsp">Login</a></div>
    </div> <!-- card.// -->
  </div> <!-- container.// -->


  <footer class="footer font-small blue pt-4" style="margin-top: 10%; margin-left: 20%">
    <%@include file="/footer.jsp" %>
  </footer>
</body>

</html>
