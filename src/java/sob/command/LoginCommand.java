package sob.command;

import entities.AllCustomers;
import entities.Book;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import entities.Customer;
import java.io.IOException;
import java.io.StringReader;
import static java.rmi.activation.Activatable.register;
import static java.util.Collections.list;
import static java.util.Collections.sort;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import javax.ws.rs.core.GenericType;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;

public class LoginCommand implements Command
{
  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
  {
   String name=request.getParameter("name");
   String pswd=request.getParameter("pswd");
   Client cust = ClientBuilder.newClient();
   List<Customer> customers = cust.target("http://localhost:8080/eBookStore/rest/api/v1/customers").request().get(new GenericType<List<Customer>>(){});  
   customers.stream().filter(c->c.getName().equals(name)).collect(Collectors.toList());
   boolean existeix = false;
   Customer login = null;
    if(!customers.isEmpty()){
        for (Customer actual: customers){
          if(actual.getPswd().equals(pswd)){
             login = actual;
             existeix=true;
          }
        }
    }
   if(existeix){
            HttpSession sesion = request.getSession(true);
            sesion.setAttribute("name", login);
            ServletContext context = request.getSession().getServletContext();
            context.getRequestDispatcher("/index.jsp").forward(request, response);
           
            
        }
        else{
            ServletContext context = request.getSession().getServletContext();
            context.getRequestDispatcher("/register.jsp").forward(request, response);
        }   
  }  
}
