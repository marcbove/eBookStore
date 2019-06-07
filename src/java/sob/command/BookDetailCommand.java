package sob.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import javax.servlet.ServletContext;
import java.io.IOException;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Client;
import javax.ws.rs.core.Response;
import entities.Book;


public class BookDetailCommand implements Command {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String id=request.getParameter("id");

        Client customer = ClientBuilder.newClient();
        Response c = customer.target("http://localhost:8080/eBookStore/rest/api/v1/books/" + id).request().get();
        Book b = c.readEntity(Book.class);
        
        request.setAttribute("book", b);
        ServletContext context = request.getSession().getServletContext();
        context.getRequestDispatcher("/detail.jsp").forward(request, response);
    }
}
