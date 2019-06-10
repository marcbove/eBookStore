package sob.command;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import entities.Book;
import java.util.List;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.core.GenericType;

public class SortCommand implements Command
{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String sort = request.getParameter("sort");
        if(sort == null)
        {
            sort = "rating";
        }
        Client customer = ClientBuilder.newClient();
        List<Book> books = customer.target("http://localhost:8080/eBookStore/rest/api/v1/books?criterion=" + sort).request().get(new GenericType<List<Book>>(){});
        request.setAttribute("books", books);
        request.getRequestDispatcher("/showBooks.jsp").forward(request, response);
    }
}
