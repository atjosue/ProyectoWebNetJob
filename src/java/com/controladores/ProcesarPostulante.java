
package com.controladores;

import com.dao.DaoDepartamento;
import com.dao.DaoProvincia;
import com.google.gson.Gson;
import com.modelos.Departamento;
import com.modelos.Provincia;
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
 * @author Carlos_Campos
 */
public class ProcesarPostulante extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Gson json= new Gson();
        DaoDepartamento daod= new DaoDepartamento();
        DaoProvincia daopro= new DaoProvincia();
        
        
        
        String key=request.getParameter("key");
        
        switch(key)
        {
            case "depPais":
                int idPais= Integer.parseInt(request.getParameter("idPais"));
                List<Departamento> dep= daod.mostrarDeptoPorPais(idPais);
                out.println(json.toJson(dep));
            break;
            case "munDep":
                int idDep= Integer.parseInt(request.getParameter("idDepartamento"));
                List<Provincia> pro= daopro.mostrarDeptoPorPais(idDep);
                out.println(json.toJson(pro));
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
            Logger.getLogger(ProcesarPostulante.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ProcesarPostulante.class.getName()).log(Level.SEVERE, null, ex);
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
