package entities;

import java.util.List;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class AvailableBooks
{
    private List<Book> availableBooks;

    public AvailableBooks()
    {
        this.availableBooks = null;
    }

    public List<Book> getAvailableBooks()
    {
        return availableBooks;
    }

    public void setAvailableBooks(List<Book> availableBooks)
    {
        this.availableBooks = availableBooks;
    }
}
