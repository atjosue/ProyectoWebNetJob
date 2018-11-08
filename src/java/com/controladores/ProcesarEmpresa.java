/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controladores;

import com.dao.DaoDepartamento;
import com.dao.DaoEmpresa;
import com.dao.DaoProvincia;
import com.google.gson.Gson;
import com.modelos.Departamento;
import com.modelos.Empresa;
import com.modelos.Provincia;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author josue
 */
@WebServlet("/uploadServlet")
@MultipartConfig( maxFileSize = 16177215)
public class ProcesarEmpresa extends HttpServlet {

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
        DaoEmpresa daoe = new DaoEmpresa();
        Empresa e= new Empresa();
        String op= request.getParameter("key");
        Gson json = new Gson();
        switch(op)
        {
            case"agregarEmpresa":
                e.setNombre(request.getParameter("nombre"));
                e.setTelefono(request.getParameter("tel"));
                e.setCorreo(request.getParameter("correo"));
                e.setIdPais(Integer.parseInt(request.getParameter("pais")));
                e.setIdUsuario(Integer.parseInt(request.getParameter("data")));
                out.println(daoe.agregarEmpresa(e));
                break;
                        
            case"obtenerCombosDepartamento":
                
                DaoDepartamento daoD = new DaoDepartamento();
                
                List<Departamento> listaDepartamento = new ArrayList();
                
                listaDepartamento = daoD.mostrarDeptoPorPais(Integer.parseInt(request.getParameter("pais")));
                
                String jsnD=json.toJson(listaDepartamento);
                
                
                out.println(jsnD);
                break;  
                
              case"obtenerCombosProvincia":
                
                DaoProvincia daoP = new DaoProvincia();
                
                List<Provincia> listaProvincia = new ArrayList();
                
                listaProvincia = daoP.mostrarDeptoPorPais(Integer.parseInt(request.getParameter("dep")));
                
                String jsnP=json.toJson(listaProvincia);
                
                out.println(jsnP);
                break;
                
            case"getDataEmpresa":
                List<Empresa> listaEmpresa = new ArrayList<Empresa>();
                listaEmpresa = daoe.getDataEmpresa(Integer.parseInt(request.getParameter("idUsuario")));
                String jsnE="";
                
                jsnE=json.toJson(listaEmpresa);
                out.print(jsnE);
                
                break;
            
            case "primera":
               
                out.print(daoe.primera(Integer.parseInt(request.getParameter("idUsuario"))));
                //out.print(request.getParameter("idUsuario"));
                break;
            case "actualizarEmpresa":
               int ksk=0; 
                try {
                e= new Empresa();
                
                e.setNombre(request.getParameter("txtNombre"));
                e.setIdUsuario(Integer.parseInt(request.getParameter("idUsuario")));
                e.setDescripcion1(request.getParameter("txtDescripcion1"));
                e.setDescripcion2(request.getParameter("txtDescripcion2"));
                e.setMision(request.getParameter("txtMision"));
                e.setVision(request.getParameter("txtVision"));
                e.setTelefono(request.getParameter("txtTelefono"));
                e.setDireccion(request.getParameter("txtDireccion"));
                e.setCorreo(request.getParameter("txtCorreo"));
                e.setIdRubro(Integer.parseInt(request.getParameter("selectRubro")));
                e.setIdDepartamento(Integer.parseInt(request.getParameter("selectDepa")));
                e.setIdProvincia(Integer.parseInt(request.getParameter("selectProv")));
                e.setPaginaWeb(request.getParameter("txtPagina"));
                e.setFacebook(request.getParameter("txtFace"));
                e.setInstagram(request.getParameter("txtInsta"));
                
//**************************imagen 1
                
                Part filePart = request.getPart("img1"); //Obtener la parte del archivo cargado
                if (filePart != null){
                e.setImagen(filePart.getInputStream());
                e.setEstado(1);
                }else
                {
                e.setEstado(0);
                }
                
                
                //***********************IMAGEN 2
                Part filePart2 = request.getPart("img2"); //Obtener la parte del archivo cargado
                if (filePart2 != null){
                e.setImagen2(filePart2.getInputStream());// Obtiene flujo de entrada del archivo de carga  
                e.setEstadoA(1);    
                }else
                {
                e.setEstadoA(0); 
                }
               
                //out.print(e.getEstadoA());
        //PROCESANDO
               int dec=0;
               
               //solo imagen1
                if (e.getEstado()==1 && e.getEstadoA()==0) {
                    dec=1;
                }
                //solo imagen 2
                if (e.getEstado()==0 && e.getEstadoA()==1) {
                    dec=2;
                }
                //dos imgenes
                if (e.getEstado()==1 && e.getEstadoA()==1) {
                    dec=3;
                }else
                {
                    //ninguna imagen
                    dec=4;
                }
                
                //ksk=daoe.actualizarEmpresa(e,dec);
                out.print("ksk");
                //response.sendRedirect("jsp/empresa/gestionPerfil.jsp");
               
                
           } catch (IOException | NumberFormatException | ServletException ex) {
             out.print(e);
           }
               
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
            Logger.getLogger(ProcesarEmpresa.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ProcesarEmpresa.class.getName()).log(Level.SEVERE, null, ex);
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
