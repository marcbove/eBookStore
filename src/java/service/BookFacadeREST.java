/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import beans.Book;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
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
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.GenericEntity;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;


/**
 *
 * @author Admin
 */
@Stateless
@Path("books")
public class BookFacadeREST extends AbstractFacade<Book> {

    @PersistenceContext(unitName = "eBookStorePU")
    private EntityManager em;

    public BookFacadeREST()
    {
        super(Book.class);
    }

    @POST
    @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public void create(Book entity)
    {
        super.create(entity);
    }

    @PUT
    @Path("{id}")
    @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public Response edit(@PathParam("id") Integer id, Book entity)
    {
        if (super.find(id) == null)
        {
            return Response.status(Response.Status.NOT_FOUND).entity("El llibre amb identificador: " + id + " no s'ha trobat").build();
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
          return Response.status(Response.Status.NOT_FOUND).entity("El llibre amb identificador: " + id + " no s'ha trobat").build();
        }
        super.remove(super.find(id));
        return Response.status(Response.Status.OK).build();
    }

    @GET
    @Path("{id}")
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public Response find(@PathParam("id") Integer id)
    {
        Book book = super.find(id);
        if (book == null)
        {
            return Response.status(Response.Status.NOT_FOUND).entity("El llibre amb identificador: " + id + " no s'ha trobat").build();
        }
        return Response.status(Response.Status.OK).entity(book).build();
    }

    @GET
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public Response findAll(@QueryParam("criterion") String criterion)
    {
        List<Book> bookList;
        bookList = super.findAll();
        List<Book> bookList_Ordered = new ArrayList<>();

        switch (criterion)
        {
            case "price":
                bookList_Ordered = bookList.stream().sorted((book_A, book_B) -> new Float(book_A.getPrice()).compareTo(book_B.getPrice())).collect(Collectors.toList());
                break;
            case "rating":
                bookList_Ordered = bookList.stream().sorted((book_A, book_B) -> new Integer(book_A.getRating()).compareTo(book_B.getRating())).collect(Collectors.toList());
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
