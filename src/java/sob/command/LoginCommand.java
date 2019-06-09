package sob.command;

import entities.AllCustomers;
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
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;

public class LoginCommand implements Command
{
  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
  {
    Boolean login_has_failed = true;
    Client customer = ClientBuilder.newClient();
    String name = request.getParameter("name");
    String password = request.getParameter("password");
    String list = customer.target("http://localhost:8080/eBookStore/rest/api/v1/customers").request().get(String.class);
    AllCustomers customers = this.stringtoXML(list);
    Customer choosenCustomer = null;
    if (customers != null)
    {
      List<Customer> customersList = customers.getCustomers().stream().filter(c -> c.getName().equals(name)).collect(Collectors.toList());
      if(!customersList.isEmpty())
      {
        for (Customer c: customersList)
        {
          if(c.getPswd().equals(password))
          {
            choosenCustomer = c;
            login_has_failed = false;
          }
        }
      }
    }
    String dView = "/login.jsp";
    if(login_has_failed)
    {
      request.setAttribute("login", login_has_failed);
    }
    else
    {
      dView = "/index.jsp";
      HttpSession sesion = request.getSession();
      sesion.setAttribute("name", name);
      sesion.setAttribute("customerId", choosenCustomer.getCustomerId().toString());
    }
    ServletContext context = request.getSession().getServletContext();
    context.getRequestDispatcher(dView).forward(request, response);
  }

  private AllCustomers stringtoXML(String str)
    {
        JAXBContext jaxbcontext;
        AllCustomers customers = null;
        try
        {
            jaxbcontext = JAXBContext.newInstance(AllCustomers.class);
            Unmarshaller jaxbunmarshaller = jaxbcontext.createUnmarshaller();
            customers = (AllCustomers) jaxbunmarshaller.unmarshal(new StringReader(str));
        }
        catch (JAXBException e)
        {
            Logger.getLogger(SortCommand.class.getName()).log(Level.SEVERE, null, e);
        }
        return customers;
    }
}
