package entities;

import java.util.List;

public class AllCustomers
{
    private List<Customer> customers;

    public AllCustomers() 
    {
        this.customers = null;
    }

    public List<Customer> getCustomers()
    {
        return customers;
    }

    public void setCustomers(List<Customer> customers)
    {
        this.customers = customers;
    }
}
