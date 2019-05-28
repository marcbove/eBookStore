/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import beans.Customer;
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
@Path("beans.customer")
public class CustomerFacadeREST extends AbstractFacade<Customer>
{
    @PersistenceContext(unitName = "eBookStorePU")
    private EntityManager em;

    public CustomerFacadeREST()
    {
        super(Customer.class);
    }

    @POST
    @Override
    @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public void create(Customer entity) {
        super.create(entity);
        return Response.status(Response.Status.CREATED).build();
    }

    @PUT
    @Path("{id}")
    @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public void edit(@PathParam("id") Integer id, Customer entity)
    {
        if(super.find(id) != null)
        {
            super.edit(entity);
            return Response.status(Response.Status.OK).entity(entity).build();
        }
        return Response.status(Response.Status.NOT_FOUND).entity("El client amb id: " + id + " no s'ha trobat.").build();
    }

    @DELETE
    @Path("{id}")
    public void remove(@PathParam("id") Integer id)
    {
        if(super.find(id) != null)
        {
            super.remove(super.find(id));
            return Response.status(Response.Status.OK).build();
        }
        return Response.status(Response.Status.NOT_FOUND).entity("El client amb id: " + id + " no s'ha trobat.").build();
    }

    @GET
    @Path("{id}")
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public Response find(@PathParam("id") Integer id)
    {
        if(super.find(id) != null)
        {
          super.remove(super.find(id));
          return Response.status(Response.Status.OK)).build();
        }
      return Response.status(Response.Status.NOT_FOUND).entity("El client amb id: " + id + " no s'ha trobat.").build();
    }

    @GET
    @Override
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public List<Customer> findAll()
    {
        return super.findAll();
        return Response.status(Response.status.NOT_FOUND).entity("No s'ha trobat cap client.").build();
    }
    /*
    @GET
    @Path("{from}/{to}")
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public List<Customer> findRange(@PathParam("from") Integer from, @PathParam("to") Integer to) {
        return super.findRange(new int[]{from, to});
    }*/
    /*
    @GET
    @Path("count")
    @Produces(MediaType.TEXT_PLAIN)
    public String countREST() {
        return String.valueOf(super.count());
    }*/

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

}
