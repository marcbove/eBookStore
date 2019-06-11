package sob.command;

import entities.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.core.GenericType;
import javax.ws.rs.core.Response;

public class CartCommand implements Command
{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        Integer book_id = Integer.parseInt(request.getParameter("bookId"));
        Client customer = ClientBuilder.newClient();
        Book book = customer.target("http://localhost:8080/eBookStore/rest/api/v1/books/" + book_id).request().get(new GenericType<Book>(){});
        List<Customer> customers = customer.target("http://localhost:8080/eBookStore/rest/api/v1/customers").request().get(new GenericType<List<Customer>>(){});
        HttpSession sesion = request.getSession();
        if (sesion.getAttribute("name") != null)
        {
            Customer actual = null;
            for(Customer c: customers)
            {
                if(c.getName().equals(sesion.getAttribute("name")))
                {
                    actual = c;
                }
            }
            List<Book> cart = actual.cart;
            cart.add(book);
            sesion.setAttribute("cart", cart);
            request.getRequestDispatcher("/cart.jsp").forward(request, response);
        }
    }
}
