package beans;

import java.io.Serializable;
 
public class Author implements Serializable 
{   
    private String name;
    private String biography;
    
    public Author(){

    }
        
    public Author(String name)
    {
        this.name = name;
        this.biography = "";
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBiography() {
        return biography;
    }

    public void setBiography(String biography) {
        this.biography = biography;
    }

    @Override
    public String toString() {
        return "Author{" + "name=" + name + ", biography=" + biography + '}';
    }
}
