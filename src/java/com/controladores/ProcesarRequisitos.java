/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controladores;

import com.dao.DaoRequisito;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.modelos.Requisitos;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author josue
 */
public class ProcesarRequisitos extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Requisitos re = new Requisitos();
        DaoRequisito daoR = new DaoRequisito();
        String op = request.getParameter("key");
        Gson json = new Gson();
        int resp=0;
        switch(op)
        {
            case "getRequisitoOferta":
                int idOferta = Integer.parseInt(request.getParameter("id"));
                com.google.gson.JsonObject obj = new JsonObject();
                JsonArray array = new JsonArray();
                List<Requisitos> listaR = daoR.mostrarRequisito(idOferta);
                
                for (Requisitos of : listaR) {
                        JsonObject item = new JsonObject();
                        item.addProperty("idRequisito",of.getIdRequisito());
                        item.addProperty("requisito",of.getRequisito());
                        item.addProperty("descripcion",of.getDescripcion());
                        item.addProperty("idOferta",of.getIdOferta());
                        array.add(item);
                    }
                obj.add("requisitos", array);
                out.print(obj.toString());
                break;
                
            case "agregarRequisito":
                re.setIdOferta(Integer.parseInt(request.getParameter("idOferta")));
                re.setRequisito(request.getParameter("titulo"));
                re.setDescripcion(request.getParameter("descripcion"));
                resp = daoR.agregarRequisito(re);
                out.print(resp);
                    break;
            case "modificarRequisito":
                re.setIdOferta(Integer.parseInt(request.getParameter("idOferta")));
                re.setRequisito(request.getParameter("titulo"));
                re.setDescripcion(request.getParameter("descripcion"));
                re.setIdRequisito(Integer.parseInt(request.getParameter("idRequisito")));
                resp = daoR.modificarRequisito(re);
                out.print(resp);
                    break;
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ProcesarRequisitos.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ProcesarRequisitos.class.getName()).log(Level.SEVERE, null, ex);
        }
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
