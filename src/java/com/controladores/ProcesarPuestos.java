
package com.controladores;

import com.dao.DaoAreas;
import com.dao.DaoPuestos;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.modelos.Areas;
import com.modelos.Puestos;
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
public class ProcesarPuestos extends HttpServlet {

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
        DaoPuestos daoP = new DaoPuestos();
        DaoAreas daoA = new DaoAreas();
        Puestos p = new Puestos();
        int a =0;
        String op = request.getParameter("key");
        Gson json = new Gson();
        
        switch(op)
        {
            case "agregar":
                p.setNombrePuesto(request.getParameter("nombre"));
                p.setDescripcion(request.getParameter("descripcion"));
                p.setEstado(1);
                p.setIdArea(Integer.parseInt(request.getParameter("idArea")));
                p.setIdEmpresa(1);
                a=daoP.agregar(p);
                out.println(a);
                break;
              
            case "buscarArea":
               
                out.println(daoP.getNombreArea(Integer.parseInt(request.getParameter("areaID"))));
                
                break;
                
                case "mostrarPuestos":
                    
                List<Puestos> listaPuestos = new ArrayList<Puestos>();
                listaPuestos = daoP.mostrarPuestoArea(Integer.parseInt(request.getParameter("codEmpresaSelect")));
                String jsnP="";
                /*String js ="{\"Areas\":[";
                for (Areas listaArea : listaAreas) {
                    js+="{\"idArea\":\""+listaArea.getIdArea()+"\" , \"nombre\":\""+listaArea.getNombre()+"\"},";
                }
                jsn = js.substring(0, js.length()-1); 
                
                jsn+="]}";*/
                Gson gPuesto= new Gson();
                jsnP=gPuesto.toJson(listaPuestos);
                out.print(jsnP);
                
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
            Logger.getLogger(ProcesarPuestos.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ProcesarPuestos.class.getName()).log(Level.SEVERE, null, ex);
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
