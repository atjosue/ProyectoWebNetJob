
package com.controladores;

import com.dao.DaoAreas;
import com.google.gson.Gson;
import com.modelos.Areas;
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
 * nombre ProcesarArea
 * fecha 28/10/18
 * version 1.0
 * copyright netjob
 * @author josue
 */
public class ProcesarArea extends HttpServlet {

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
        
        String op = request.getParameter("key");
        Areas ar = new Areas();
        DaoAreas daoA = new DaoAreas();
        int a=0;
        switch(op)
        {
            case "agregar":
                ar.setIdEmpresa(1);
                ar.setNombre(request.getParameter("data"));
                ar.setEstado(1);
                a=daoA.insertarArea(ar);
                out.println(a);
                break;
            case "modificar":
                ar.setIdArea(Integer.parseInt(request.getParameter("codigo")));
                ar.setIdEmpresa(1);
                ar.setNombre(request.getParameter("nombre"));
                a = daoA.ModificarArea(ar);
                out.println(a);
                break;
            case "getInfoArea":
                
                List<Areas> lista = daoA.infoArea(Integer.parseInt(request.getParameter("id")));
                
                Gson json = new Gson();
                out.print(json.toJson(lista));
                
                break;
            case "eliminar":
                ar.setIdArea(Integer.parseInt(request.getParameter("id")));
                ar.setEstado(0);
                a = daoA.eliminarArea(ar);
                out.println(a);
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
            Logger.getLogger(ProcesarArea.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ProcesarArea.class.getName()).log(Level.SEVERE, null, ex);
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
