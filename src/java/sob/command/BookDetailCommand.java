package sob.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import java.io.IOException;
import javax.ws.rs.client.ClientBuilder;
import entities.Book;
import javax.ws.rs.core.GenericType;

public class BookDetailCommand implements Command {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String id = request.getParameter("id");

        //Client customer = ClientBuilder.newClient();
        javax.ws.rs.client.Client client = ClientBuilder.newClient();
        Book b = client.target("http://localhost:8080/eBookStore/rest/api/v1/books/" + id).request().get(new GenericType<Book>(){});

        request.setAttribute("book", b);
        request.getRequestDispatcher("/detail.jsp").forward(request, response);
    }
}
