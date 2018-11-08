/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controladores;

import com.dao.DaoDepartamento;
import com.dao.DaoDetalleHabilidad;
import com.dao.DaoPostulante;
import com.dao.DaoProvincia;
import com.dao.DaoRelacion;
import com.google.gson.Gson;
import com.modelos.Departamento;
import com.modelos.DetalleHabilidad;
import com.modelos.Habilidad;
import com.modelos.Postulante;
import com.modelos.Provincia;
import com.modelos.Relacion;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author josue
 */
public class ProcesarPostulante extends HttpServlet {

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
        Gson json= new Gson();
        DaoDepartamento daod= new DaoDepartamento();
        DaoProvincia daopro= new DaoProvincia();
        Postulante pos= new Postulante();
        DaoPostulante daop=new DaoPostulante();
        DetalleHabilidad dt= new DetalleHabilidad();
        Relacion re= new Relacion();
        DaoRelacion daor= new DaoRelacion();
        Habilidad hab= new Habilidad();
        DaoDetalleHabilidad daodh= new DaoDetalleHabilidad();
        Date fecha = new Date();
        SimpleDateFormat df= new SimpleDateFormat("yyyy/MM/dd");
        HttpSession sesion= request.getSession(); 
        
        
        
        String key=request.getParameter("key");
        
        switch(key)
        {
            case "depPais":
                int idPais= Integer.parseInt(request.getParameter("idPais"));
                List<Departamento> dep= daod.mostrarDeptoPorPais(idPais);
                out.println(json.toJson(dep));
            break;
            case "munDep":
                
                int idep=0;
                idep=Integer.parseInt(request.getParameter("idPais"));
          
                
               
              List<Provincia> pro= daopro.mostrarDeptoPorPais(idep);
                out.println(json.toJson(pro));
            break;
            
            case "registrar":
               
                //  SETEANDO DATOS A LA CLASE
                int resp=0;
                 
                try 
                {
                     
                pos.setNombres(request.getParameter("nombres"));
                pos.setApellidos(request.getParameter("apellidos"));
                pos.setGenero(request.getParameter("genero"));
                pos.setFechaNacimiento((request.getParameter("fechaNac")));
                pos.setTelefono(request.getParameter("telefono"));
                pos.setIdProvincia(Integer.parseInt(request.getParameter("municipio")));
                pos.setIdDepartamento(Integer.parseInt(request.getParameter("departamento")));
                pos.setIdPais(Integer.parseInt(request.getParameter("pais")));
                pos.setCorreo(request.getParameter("email"));
                pos.setDireccion(request.getParameter("direccion"));
                pos.setIdProfesion(Integer.parseInt(request.getParameter("profesion")));
                pos.setIdGradoEstudio(Integer.parseInt(request.getParameter("gradoEstudio")));
                pos.setIdIdioma(Integer.parseInt(request.getParameter("idioma")));
                pos.setIdUsuario(Integer.parseInt("idUsuario"));
                    
                Part filePart = request.getPart("fichero"); //Obtener la parte del archivo cargado
                if (filePart != null){
                pos.setImagen(filePart.getInputStream());// Obtiene flujo de entrada del archivo de carga
                   
                }
                 
                
                //fecha actual
                pos.setFechaRegistro(df.format(fecha));  
                
                
                //PROCESANDO
               resp=daop.insertarPostulante(pos);
                out.print(resp);
                
               //seteando Variables de Sesion
               sesion.setAttribute("msj", "En Hora buena Has completado la información Basica de tu perfil!");
               response.sendRedirect("jsp/postulante/dashBoardPostulante.jsp");
               
                }
                catch (Exception e)
                {
                 out.print(e);   
                }
                
            break;
            
            case "addHabilidad":
                
                dt.setIdHabilidad(Integer.parseInt(request.getParameter("id")));
                dt.setIdPostulante(Integer.parseInt(request.getParameter("idPostulante")));
                
                resp=daodh.agregar(dt);
                out.print(resp);
                
            break;
            case "verPerfil":
                sesion.setAttribute("idPostulantePerfil", request.getParameter("idPostulante"));
                out.print(1);
            break;
            
            case "seguir":
                try 
                {
                    re.setIdSeguidor(Integer.parseInt(request.getParameter("idSeguidor")));
                re.setIdSeguido(Integer.parseInt(request.getParameter("idSeguido")));
                
                resp=daor.seguir(re);
                
                out.print(resp);
                }
                catch (Exception e)
                {
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
