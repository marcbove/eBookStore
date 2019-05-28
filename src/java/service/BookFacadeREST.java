/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import beans.Book;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

/**
 *
 * @author Admin
 */
@Stateless
@Path("beans.book")
public class BookFacadeREST extends AbstractFacade<Book> {

    @PersistenceContext(unitName = "eBookStorePU")
    private EntityManager em;

    public BookFacadeREST()
    {
        super(Book.class);
    }

    @POST
    @Override
    @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public Response create(Book entity)
    {
        super.create(entity);
        return Response.status(Response.Status.CREATED).build();
    }

    @PUT
    @Path("{id}")
    @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public Response edit(@PathParam("id") Integer id, Book entity)
    {
        if (super.find(id) == null)
        {
            return Response.status(Response.Status.NOT_FOUND).entity("El llibre amb identificador: " + id + " no s'ha trobat");
        }
        super.edit(entity);
        return Response.status(Response.Status.OK).build();
    }

    @DELETE
    @Path("{id}")
    public Response remove(@PathParam("id") Integer id)
    {
        if(super.find(id) == null)
        {
          return Response.status(Response.Status.NOT_FOUND).entity("El llibre amb identificador: " + id + " no s'ha trobat");
        }
        super.remove(super.find(id));
        return Response.status(Response.Status.OK).build();
    }

    @GET
    @Path("{id}")
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public Book find(@PathParam("id") Integer id)
    {
        Book book = super.find(id);
        if (book == null)
        {
            return Response.status(Response.Status.NOT_FOUND)..entity("El llibre amb identificador: " + id + " no s'ha trobat");;
        }
        return Response.status(Response.Status.OK).entity(book).build();
    }

    @GET
    @Override
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public Response findAll(@QueryParam("criterion") String criterion)
    {
        ArrayList<Book> bookList = new ArrayList<Book>();
        bookList = super.findAll();
        ArrayList<Book> bookList_Ordered = new ArrayList<Book>();

        switch (criterion)
        {
            case "price":
                bookList_Ordered = bookList.stream().sorted(book_A, book_B)->new Float(book_A.getPrice()).compareTo(book_B.getPrice())).collect(Collectors.toList());
                break;
            case "rating":
                bookList_Ordered = bookList.stream().sorted(book_A, book_B)->new Integer(book_A.getRating()).compareTo(book_B.getRating())).collect(Collectors.toList());
                break;
        }
        GenericEntity<List<Book>> generic = new GenericEntity<List<Book>>(bookList_Ordered){};
        return Response.status(Response.Status.OK).entity(generic).build();
    }

    /*
    @GET
    @Path("{from}/{to}")
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public List<Book> findRange(@PathParam("from") Integer from, @PathParam("to") Integer to) {
        return super.findRange(new int[]{from, to});
    }*/
    /*
    @GET
    @Path("count")
    @Produces(MediaType.TEXT_PLAIN)
    public String countREST()
    {
        return String.valueOf(super.count());
    }*/

    @Override
    protected EntityManager getEntityManager()
    {
        return em;
    }

}
