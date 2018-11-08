/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controladores;

import com.dao.DaoGradoEstudio;
import com.dao.DaoOferta;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.modelos.GradoEstudio;
import com.modelos.Oferta;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
public class ProcesarOfertas extends HttpServlet {

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
        DaoOferta daoO = new DaoOferta();
        DaoGradoEstudio daoG = new DaoGradoEstudio();
        
        Oferta o = new Oferta();
        String op = request.getParameter("key");
        Gson json = new Gson();
        switch(op)
        {      
                case "getOfertas":
                response.setContentType("application/json;charset=UTF-8");
                int idUsuarioEm=Integer.parseInt(request.getParameter("id"));
                com.google.gson.JsonObject obj = new JsonObject();
                JsonArray array = new JsonArray();
                List<Oferta> listaO = daoO.mostrarOfertaEmpresa(idUsuarioEm);
                
                    for (Oferta of : listaO) {
                        JsonObject item = new JsonObject();
                        item.addProperty("idOferta",of.getIdOferta());
                        item.addProperty("titulo",of.getTitulo());
                        item.addProperty("descripcion",of.getDescripcion());
                        item.addProperty("vacantes",of.getVacantes());
                        item.addProperty("salarioMinimo",of.getSalarioMinimo());
                        item.addProperty("salarioMaximo",of.getSalarioMaximo());
                        item.addProperty("idEmpresa",of.getIdEmpresa());
                        item.addProperty("aniosExperiencia",of.getAniosExperiencia());
                        item.addProperty("edadMinima",of.getEdadMinima());
                        item.addProperty("edadMaxima",of.getEdadMaxima());
                        item.addProperty("idArea",of.getIdArea());
                        item.addProperty("idPuesto",of.getIdPuesto());
                        item.addProperty("idGradoEstudio",of.getIdGradoEstudio());
                        item.addProperty("sexo",of.getSexo());
                        item.addProperty("estadoP",of.getEstadoP());
                        
                        array.add(item);
                    }
                
                obj.add("oferta", array);
                out.print(obj.toString());
                break;
                
                case "obtenerGrados":
                
                List<GradoEstudio> listaGrados = new ArrayList();
                listaGrados = daoG.mostrarGrados();
                String jsn="";
                
                Gson g= new Gson();
                jsn=g.toJson(listaGrados);
                out.print(jsn);
                
                break;
                
                case "agregarOferta":
                    o = new Oferta();
                    daoO = new DaoOferta();
                    
                    o.setIdOferta(0);
                    o.setTitulo(request.getParameter("titulo"));
                    o.setDescripcion(request.getParameter("descripcion"));
                    o.setVacantes(Integer.parseInt(request.getParameter("vacantes")));
                    o.setSalarioMinimo(Double.parseDouble(request.getParameter("salarioMinimo")));
                    o.setSalarioMaximo(Double.parseDouble(request.getParameter("salarioMaximo")));
                    o.setIdEmpresa(daoO.obtenerIdEmpresa(Integer.parseInt(request.getParameter("idEmpresa"))));
                    o.setAniosExperiencia(Integer.parseInt(request.getParameter("aniosExperiencia")));
                    o.setEdadMinima(Integer.parseInt(request.getParameter("edadMinima")));
                    o.setEdadMaxima(Integer.parseInt(request.getParameter("edadMaxima")));
                    o.setIdArea(Integer.parseInt(request.getParameter("idArea")));
                    o.setIdPuesto(Integer.parseInt(request.getParameter("idPuesto")));
                    o.setFechaPublicacion(request.getParameter("fechaPublicacion"));
                    o.setIdGradoEstudio(Integer.parseInt(request.getParameter("idGradoEstudio")));
                    o.setSexo(request.getParameter("sexo"));
                    o.setEstadoP(Integer.parseInt(request.getParameter("estadoP")));
                    List resp =daoO.agregarOferta(o);
                    out.print(resp);
                    break;
                    
                    case "modificarOferta":
                    o = new Oferta();
                    daoO = new DaoOferta();
                    
                    o.setIdOferta(Integer.parseInt(request.getParameter("idOferta")));
                    o.setTitulo(request.getParameter("titulo"));
                    o.setDescripcion(request.getParameter("descripcion"));
                    o.setVacantes(Integer.parseInt(request.getParameter("vacantes")));
                    o.setSalarioMinimo(Double.parseDouble(request.getParameter("salarioMinimo")));
                    o.setSalarioMaximo(Double.parseDouble(request.getParameter("salarioMaximo")));
                    o.setAniosExperiencia(Integer.parseInt(request.getParameter("aniosExperiencia")));
                    o.setEdadMinima(Integer.parseInt(request.getParameter("edadMinima")));
                    o.setEdadMaxima(Integer.parseInt(request.getParameter("edadMaxima")));
                    o.setIdArea(Integer.parseInt(request.getParameter("idArea")));
                    o.setIdPuesto(Integer.parseInt(request.getParameter("idPuesto")));
                    o.setFechaPublicacion(request.getParameter("fechaPublicacion"));
                    o.setIdGradoEstudio(Integer.parseInt(request.getParameter("idGradoEstudio")));
                    o.setSexo(request.getParameter("sexo"));
                    o.setEstadoP(Integer.parseInt(request.getParameter("estadoP")));
                    int respM =daoO.modificarOferta(o);
                    out.print(respM);
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
            Logger.getLogger(ProcesarOfertas.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ProcesarOfertas.class.getName()).log(Level.SEVERE, null, ex);
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
