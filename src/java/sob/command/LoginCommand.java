package sob.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import entities.Customer;
import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;
import javax.ws.rs.core.GenericType;

public class LoginCommand implements Command

{
  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException

  {
   String name = request.getParameter("name");
   String pswd = request.getParameter("pswd");
   Client cust = ClientBuilder.newClient();
   List<Customer> customers = cust.target("http://localhost:8080/eBookStore/rest/api/v1/customers").request().get(new GenericType<List<Customer>>(){});

   customers.stream().filter(c->c.getName().equals(name)).collect(Collectors.toList());
   boolean existeix = false;
   Customer login = null;
    if(!customers.isEmpty())
    {
        for (Customer actual: customers)
        {
          if(actual.getPswd().equals(pswd))
          {
             login = actual;
             existeix = true;
          }
        }
    }

   if(existeix)
   {
        HttpSession sesion = request.getSession(true);
        sesion.setAttribute("name", login.getName());
        request.getRequestDispatcher("/criterion.do").forward(request, response);
    }
    else
    {
        Boolean error = !existeix;
        request.setAttribute("error", error);
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }
  }
}
