package sob.command;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import entities.AvailableBooks;
import entities.Book;
import java.io.StringReader;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.core.GenericType;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;

public class SortCommand implements Command
{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String sort = request.getParameter("sort");

        Client customer = ClientBuilder.newClient();
        List<Book> books = customer.target("http://localhost:8080/eBookStore/rest/api/v1/books?criterion=" + sort).request().get(new GenericType<List<Book>>(){});
        System.out.println(books);
        System.out.println("AAAAAAAAAAAAAAAAAAAAA");
        for(Book b: books)
        {
            System.out.println(b);
        }
        request.setAttribute("books", books);
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

    private AvailableBooks stringtoXML(String str)
    {
        JAXBContext jaxbcontext;
        AvailableBooks books = null;
        try
        {
            jaxbcontext = JAXBContext.newInstance(AvailableBooks.class);
            Unmarshaller jaxbunmarshaller = jaxbcontext.createUnmarshaller();
            books = (AvailableBooks) jaxbunmarshaller.unmarshal(new StringReader(str));
        }
        catch (JAXBException ex)
        {
            Logger.getLogger(SortCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
        return books;
    }
}
