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

public class RegisterCommand implements Command
{
  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
  {
    String name=request.getParameter("name");
    String pswd=request.getParameter("pswd");
    //String email=request.getParameter("email");
    //String phone= request.getParameter("phone");
    Customer customer=new Customer();
    customer.setPswd(pswd);
    customer.setName(name);
   // customer.setEmail(email);
    //customer.setPhone(phone);
    Client cust = ClientBuilder.newClient();
    List<Customer> customers = cust.target("http://localhost:8080/eBookStore/rest/api/v1/customers").request().get(new GenericType<List<Customer>>(){});
    customers.stream().filter(c->c.getName().equals(name)).collect(Collectors.toList());
    boolean registrat = true;

    if(customers.isEmpty()){
       registrat=false;
    }
   if(!registrat){
            HttpSession sesion = request.getSession();
            sesion.setAttribute("name", name);
            request.getRequestDispatcher("/showBooks.jsp").forward(request, response);
        }
        else{
            request.getRequestDispatcher("/register.jsp").forward(request, response);
        }

  }
}
