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

public class LoginCommand1 implements Command
{
  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
  {
    String username=request.getParameter("name");
    String password=request.getParameter("pswd");
    Customer customer=new Customer();
    customer.setPswd(password);
    customer.setName(username);
    //HttpSession sesion = request.getSession();
    //sesion.setAttribute("username", username);
    //ServletContext context = request.getSession().getServletContext();
    //context.getRequestDispatcher("/index.jsp").forward(request, response);
   
    List<Customer> customers = customer.target("http://localhost:8080/eBookStore/rest/api/v1/customers").request().get(new GenericType<List<Customer>>(){});  
    List<Customer> custom= list.getCustomers().stream().filter(c->c.getUser().equals(username)).collect(Collectors.toList());
    boolean registrat = true;
     
    if(custom.isEmpty()){
       registrat=false;
    }
  
  
  }  
}
