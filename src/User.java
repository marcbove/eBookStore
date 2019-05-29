
public class User 
{
    private String email;

    public String getEmail() 
    {
        return fixNull(this.email);
    }

    public void setEmail(String email) 
    {
        this.email = email;
    }

    private String fixNull(String in) 
    {
        return (in == null) ? "" : in;
    }

    public String getMessage() 
    {
        return "\nEmail:\t" + getEmail();
    }
}
