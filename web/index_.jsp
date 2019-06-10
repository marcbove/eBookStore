<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>
      eBookStore
    </title>
  </head>
  <body>
      <%
          String redirectURL = "http://localhost:8080/eBookStore/";
          response.sendRedirect("/criterion.do");
      %>
  </body>
</html>
