package entities;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@Table(name = "CUSTOMER")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Customer.findByCustomerId", query = "SELECT c FROM Customer c WHERE c.customerId = :customerId"),
    @NamedQuery(name = "Customer.findByName", query = "SELECT c FROM Customer c WHERE c.name = :name"),
    @NamedQuery(name = "Customer.findByPhone", query = "SELECT c FROM Customer c WHERE c.phone = :phone"),
    @NamedQuery(name = "Customer.findByEmail", query = "SELECT c FROM Customer c WHERE c.email = :email")})
public class Customer implements Serializable
{
    private static final long serialVersionUID = 1L;

    @Column(name = "CUSTOMER_ID")
    @Id @GeneratedValue(strategy=GenerationType.AUTO)
    private Integer customerId;

    @OneToMany(mappedBy = "customer")
    private LinkedList<BookOrder> orders;
    @Column(name = "NAME")
    private String name;
    @Column(name = "PHONE")
    private String phone;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Column(name = "EMAIL")
    private String email;
    @Column(name = "PSWD")
    private String pswd;
    public static List<Book> cart = new ArrayList<>();

    public Customer()
    {
        this.orders = new LinkedList<>();
    }

    public Customer(Integer customerId)
    {
        this.customerId = customerId;
        this.orders = new LinkedList<>();
    }
/*
    public List<Book> getCart()
    {
        return cart;
    }

    public void setCart(List<Book> cart)
    {
        this.cart = cart;
    }*/

    public Integer getCustomerId()
    {
        return customerId;
    }

    public void setCustomerId(Integer customerId)
    {
        this.customerId = customerId;
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public String getPhone()
    {
        return phone;
    }

    public void setPhone(String phone)
    {
        this.phone = phone;
    }

    public String getEmail()
    {
        return email;
    }

    public void setEmail(String email)
    {
        this.email = email;
    }

    public String getPswd()
    {
        return pswd;
    }

    public void setPswd(String pswd)
    {
        this.pswd = pswd;
    }

    @Override
    public int hashCode()
    {
        int hash = 0;
        hash += (customerId != null ? customerId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object)
    {
        if (!(object instanceof Customer)) {
            return false;
        }
        Customer other = (Customer) object;
        if ((this.customerId == null && other.customerId != null) || (this.customerId != null && !this.customerId.equals(other.customerId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString()
    {
        return "[ customerId = " + customerId + " ]";
    }
}
