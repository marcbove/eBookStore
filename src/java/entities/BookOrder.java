package beans;

import java.io.Serializable;
import java.util.ArrayList;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

@Entity
@XmlRootElement
public class BookOrder implements Serializable
{
    @Column(name = "ORDER_ID")
    @Id @GeneratedValue(strategy=GenerationType.AUTO)
    private Integer orderId;

    @JoinColumn(name = "BOOKS") @ManyToMany(cascade=CascadeType.PERSIST)
    private ArrayList<Book> books;
    @JoinColumn(name = "CUSTOMER") @ManyToOne(cascade=CascadeType.PERSIST)
    private Customer customer;

    public BookOrder()
    {

    }

    public BookOrder(Integer orderId)
    {
        this.orderId = orderId;
    }

    public Integer getId()
    {
        return orderId;
    }

    @XmlTransient
    public ArrayList<Book> getBooks()
    {
        return books;
    }

    public void setBooks(ArrayList<Book> books)
    {
        this.books = books;
    }

    public Customer getCustomer()
    {
        return customer;
    }

    public void setCustomer(Customer customer)
    {
        this.customer = customer;
    }
}
