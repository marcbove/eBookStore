package entities;

import java.io.Serializable;
import java.util.ArrayList;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

@Entity
@Table(name = "BOOK")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Book.findAll", query = "SELECT b FROM Book b"),
    @NamedQuery(name = "Book.findByBookId", query = "SELECT b FROM Book b WHERE b.bookId = :bookId"),
    @NamedQuery(name = "Book.findByName", query = "SELECT b FROM Book b WHERE b.name = :name"),
    @NamedQuery(name = "Book.orderByPrice", query="SELECT b FROM Book b ORDER BY b.price ASC"),
    @NamedQuery(name = "Book.orderByRate", query="SELECT b FROM Book b ORDER BY b.rating ASC")
})
public class Book implements Serializable
{
    private static final long serialVersionUID = 1L;

    @Column(name = "BOOK_ID")
    @Id @GeneratedValue(strategy=GenerationType.AUTO)
    private Integer bookId;

    @Column(name = "RATING")
    private int rating;
    @Column(name = "NAME")
    private String name;
    @Column(name = "STOCK")
    private int stock;
    @Column(name = "PRICE")
    private float price;
    @Column(name = "DESCRIPTION")
    private String description;
    @Column(name = "COVER")
    private String cover;
    @Column(name = "HALFCOVER")
    private String halfcover;
    /*
    @ElementCollection
    @CollectionTable
    (
            name = "AUTHOR",
            joinColumns = @JoinColumn(name = "BOOK_ID")
    )
    private List<Author> authors;*/
    @Column(name = "AUTHOR")
    private String author;
    @ManyToMany(mappedBy = "books")
    private ArrayList<BookOrder> orders;

    public Book()
    {
    }

    public Book(Integer bookId)
    {
        this.bookId = bookId;
    }

    public Integer getBookId()
    {
        return bookId;
    }

    public void setBookId(Integer bookId)
    {
        this.bookId = bookId;
    }

    public int getRating()
    {
        return rating;
    }

    public void setRating(int rating)
    {
        this.rating = rating;
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public int getStock()
    {
        return stock;
    }

    public void setStock(int stock)
    {
        this.stock = stock;
    }

    public float getPrice()
    {
        return price;
    }

    public void setPrice(float price)
    {
        this.price = price;
    }

    public String getDescription()
    {
        return description;
    }

    public void setDescription(String description)
    {
        this.description = description;
    }

    public String getCover()
    {
        return cover;
    }

    public void setCover(String cover)
    {
        this.cover = cover;
    }

    public String getHalfcover()
    {
        return halfcover;
    }

    public void setHalfcover(String halfcover)
    {
        this.halfcover = halfcover;
    }

    public String getAuthor()
    {
        return author;
    }

    public void setAuthor(String author)
    {
        this.author = author;
    }

    @XmlTransient
    public ArrayList<BookOrder> getOrders()
    {
        return orders;
    }

    public void setOrders(ArrayList<BookOrder> orders)
    {
        this.orders = orders;
    }

    @Override
    public int hashCode()
    {
        int hash = 0;
        hash += (bookId != null ? bookId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object)
    {
        if (!(object instanceof Book))
        {
            return false;
        }
        Book other = (Book) object;
        if ((this.bookId == null && other.bookId != null) || (this.bookId != null && !this.bookId.equals(other.bookId)))
        {
            return false;
        }
        return true;
    }
/*
    @Override
    public int compareTo(Book b)
    {
        return Integer.compare(this.getPrice(), b.getPrice())
    }*/

    @Override
    public String toString()
    {
        return "[ bookId=" + bookId + " ]";
    }
}
