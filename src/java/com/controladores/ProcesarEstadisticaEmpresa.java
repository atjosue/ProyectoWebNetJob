package com.controladores;

import com.dao.EstadisticaEmpresa;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Nombre del servlet: ProcesarEstadisticaEmpresa
 * Fecha: 07/11/18
 * Version: 1.0
 * @author Fernando
 */
public class ProcesarEstadisticaEmpresa extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
       
        EstadisticaEmpresa estE = new EstadisticaEmpresa();
        Gson json = new Gson();
        int estadistica[] = new int[8];
        
        try 
        {
            int idUser = Integer.parseInt(request.getParameter("idUsuario"));
            
            int userActivos = estE.userActive();
            int empresasActivas = estE.businessActive();
            int ofertasXEmpresa = estE.OfferBusinessActive(idUser);
            int ofertas = estE.OfferActive();
            int seguidores = estE.followers(idUser);
            int seguiendo = estE.following(idUser);
            int post = estE.postActive(idUser);
            int postulante = estE.postulacion(idUser);
            
            estadistica[0]=userActivos;
            estadistica[1]=empresasActivas;
            estadistica[2]=ofertasXEmpresa;
            estadistica[3]=ofertas;
            estadistica[4]=seguidores;
            estadistica[5]=seguiendo;
            estadistica[6]=post;
            estadistica[7]=postulante;
            out.print(json.toJson(estadistica));
        } 
        catch (Exception e) 
        {
             out.println("Error: "+e);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
