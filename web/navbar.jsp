<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="navbar-collapse">
    <form action="criterion.do">
      <ul class="navbar-nav mr-auto navbar-left">
        <li class="nav-item">
          <a class="nav-link" href="/eBookStore" role="button">&nbspHome&nbsp</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="criterion.do" role="button">&nbspView Books&nbsp</a>
        </li>
      </ul>
    </form>
    <ul class="navbar-nav lg-ml-5">
      <li class="nav-item ml-auto">
      </li>
    </ul>
  </div>

  <c:if test = "${sis}">
    <ul class="nav navbar-nav navbar-right">
      <li class="nav-item active"><a href="login.jsp">Login</a></li>
      &nbsp or &nbsp
      <li class="nav-item active"><a href="register.jsp">Register</a></li>
    </ul>
  </c:if>
  <c:if test = "${!sis}">
    <ul class="nav navbar-nav navbar-right">
      <li class="mx-2 nav-item">Welcome ${name}!</li>
      <li class="mx-2 nav-item active"><a href="cart.jsp">Show Shopping Cart</a></li>
      <li class="mx-2 nav-item active"><a href="logout.do" class="text-danger">Logout</a></li>
      <!--li class="nav-item active"><form action="logout.do" method="post"><button class="text-danger" type="submit" value="Logout"></form-->
    </ul>
  </c:if>

<!--
    <ul class="nav navbar-nav navbar-right">
      <li class="nav-item active"><a href="login.jsp">Login</a></li>
      &nbsp or &nbsp
      <li class="nav-item active"><a href="register.jsp">Register</a></li>
      <li class="nav-item active"><a href="cart.jsp">${username}'s Shopping Cart</a></li>
    </ul>
-->
</nav>
