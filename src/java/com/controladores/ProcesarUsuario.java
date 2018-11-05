/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controladores;

import com.dao.DaoUsuario;
import com.modelos.Usuario;
import com.recursos.Encriptacion;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Carlos_Campos
 */
public class ProcesarUsuario extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
         Usuario us= new Usuario();
        DaoUsuario daou= new DaoUsuario();
        Encriptacion enc= new Encriptacion();
        HttpSession sesion=request.getSession();
        int resp=0;
        
        
        String key=request.getParameter("key");
        switch(key)
        {
            case "log":
                us.setNombreUsuario(request.getParameter("user"));
                String pass=enc.SHA1(request.getParameter("pass"));
                String passEnd=enc.MD5(pass);
                us.setContraseña(passEnd);
                Usuario respu = daou.login(us);
                
                if(respu.getIdRol()>0)
                {
                    
                    sesion.setAttribute("user",request.getParameter("user") );
                    sesion.setAttribute("idUsuario",respu.getIdUsuario());
                    
                    if(respu.getIdRol()==3)
                    {
                    int reg=0;
                    reg=daou.verificar(respu.getIdUsuario());
                    if(reg==0)
                    {
                        out.print("no");
                    }
                    else
                    {
                     out.print(respu.getIdRol());
                    }
                    
                    
                    
                    }
                    else
                    {
                     out.print(respu.getIdRol());
                    }
                    
                  
                   
                    
                }
                else
                {
                out.print("Usuario y/o contraseña incorrecta");
                }
                
           break;
           
            case "addPost":
                us.setNombreUsuario(request.getParameter("user"));
                String passAdd=enc.SHA1(request.getParameter("pass"));
                us.setContraseña(enc.MD5(passAdd));
                us.setIdRol(Integer.parseInt(request.getParameter("rol")));
                resp=daou.insertar(us);
                
                out.print(resp);
                
               
        
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
            Logger.getLogger(ProcesarUsuario.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ProcesarUsuario.class.getName()).log(Level.SEVERE, null, ex);
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
