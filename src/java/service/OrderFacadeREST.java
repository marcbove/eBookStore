/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import beans.Order;
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
@Path("beans.order")
public class OrderFacadeREST extends AbstractFacade<Order>
{
    @PersistenceContext(unitName = "eBookStorePU")
    private EntityManager em;

    public OrderFacadeREST()
    {
        super(Order.class);
    }

    @POST
    @Override
    @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public Response create(Order entity)
    {
        super.create(entity);
        return Response.status(Response.Status.CREATED).build();
    }

    @PUT
    @Path("{id}")
    @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public Response edit(@PathParam("id") int id, Order entity)
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
    public Response remove(@PathParam("id") int id)
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
    public Response find(@PathParam("id") int id)
    {
        if(super.find(id) == null)
        {
            return Response.status(Response.Status.NOT_FOUND).entity("Compra con id: " + id + " no s'ha trobat").build();
        }
        return Response.status(Response.Status.OK).entity(super.find(id)).build();
    }

    @GET
    @Override
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public List<Order> findAll()
    {
        return super.findAll();
    }
    /*
    @GET
    @Path("{from}/{to}")
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public List<Order> findRange(@PathParam("from") Integer from, @PathParam("to") Integer to)
    {
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
