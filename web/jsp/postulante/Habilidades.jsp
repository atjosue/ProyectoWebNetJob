<%-- 
    Document   : Habilidades
    Created on : 11-05-2018, 08:35:21 PM
    Author     : Carlos_Campos
--%>

<%@page import="com.dao.DaoHabilidad"%>
<%@page import="com.modelos.Habilidad"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.DaoDetalleHabilidad"%>
<%@page import="com.modelos.DetalleHabilidad"%>
<%@page import="com.dao.DaoPostulante"%>
<%@page import="com.modelos.Postulante"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="../../utilidades/frontend/headerLinks.jsp" />
        <script src="../../js/postulante/habilidad.js" type="text/javascript"></script>
        
        <title>Mis Habilidades</title>
    </head>
    
    <%
            HttpSession sesion= request.getSession();
            
            
                //extrayendo la informacion
               
                DaoPostulante daop= new DaoPostulante();
                Postulante post= daop.getInfo(Integer.parseInt(sesion.getAttribute("idUsuario").toString()));
                
              
                 
                
                

       %>
    <header>
        <nav class="teal lighten-2">
            <div class="nav-wrapper teal lighten-2">
                
                <ul id="nav-mobile" class="left hide-on-med-and-down" style="margin-left: 5%;">
                    <li>
                        <img src="../../Contenido/Imagenes/Sistema/netjob.png" height="50px" width="50px" class="d-inline-block align-top" >
                        &nbsp;&nbsp;&nbsp;
                    </li>
                    
                    <li class="active"><a href="#">Home</a></li>
                    <li><a class="dropdown-trigger" href="#!" data-target="dropdown2">Mi Información</a></li>
                    
                </ul>
                
                <ul id="nav-mobile" class="right hide-on-med-and-down" style="margin-right:10%; width: 150px; ">
                    
                    <li style="width: 300px;">
                        <a class="dropdown-trigger" href="#!" data-target="dropdown1">
                <img src="data: image / jpg; base64, <%= post.getBase64Image() %>" class="rounded-circle " width="35px" height="35px" style="border-radius: 16px;">&nbsp;<%=post.getNombres()%>
                        </a>
                        
                    </li>
                    
                    
                </ul>
                <!-- Contenedor del submenu de opciones -->
                <ul id="dropdown1" class="dropdown-content" style="width: 150px;">
                      <li><a href="#"><span class="glyphicon glyphicon-user"></span> Perfil</a></li>
                      <li><a href="#"><span class="glyphicon glyphicon-unchecked"></span> Seguimiento</a></li>
                      <li><a href="#"><span class="glyphicon glyphicon-education"></span> Ayuda</a></li>
                      <li><a href="#"><span class="glyphicon glyphicon-log-out"></span> Log-Out</a></li>
                </ul>
                
                <!-- COntenedor del submenu de mi informacion -->
                 <ul id="dropdown2" class="dropdown-content" style="width: 300px;">
                      <li><a href="Experiencia.jsp">Experiencia Laboral</a></li>
                      <li><a href="Habilidades.jsp">Mis Habilidades</a></li>
                      
                </ul>
                
                
            </div>
         </nav>
    </header>
    <body>
       <br><br>
        
      
        <div class="col-md-1 col-sm-1 col-xs-1"></div>
        <div class="col-md-10 col-sm-10 col-xs-10">
            
            <!--Obteniendo ofertas-->
             <h4>Mis Habilidades</h4>   <input type="button" name="btnAgregar" value="Agregar" id="InsertarExperiencia" class="btn default waves-block">
       <hr>
               
            <div class=" col-md-12 col-xs-12 col-sm-12  contenedorTargetas">
                <table id="tableHabilidad" class="tab-content highlight responsive-table" style="width:100%">
                        <thead>
                            <tr>
                                
                               
                                <th>Habilidad</th>
                               
                                <th style="width: 250px;">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                               DetalleHabilidad dt= new DetalleHabilidad();
                               
                                DaoDetalleHabilidad daod= new DaoDetalleHabilidad();
                                List<DetalleHabilidad> lst= daod.mostrar(Integer.parseInt(sesion.getAttribute("idPostulante").toString()));
                                
                               for(DetalleHabilidad ex:lst)
                               {
                            %>
                            <tr>
                                <td><%=ex.getHabilidad().getHabilidad() %></td>
                                
                               
                                <td><input type="button" name="btnELiminar" value="Eliminar" id="<%=ex.getIdDetalleHabilidad() %>" class="btn red waves-block" /></td>
                                
                                
                            </tr>
                            <%}%>
                        </tbody>
                    </table> 
                
            </div>
        </div>
        
        <!-- Contenedor margen derecho-->
        
        
        <div class="col-md-1 col-sm-1 col-xs-1"></div>
 <!-- modal Agragar Experiencia -->       
 <div id="ModalAgregar" class="modal modal-fixed-footer" role="dialog">
    <div class="modal-content">
        <div class="row">
            <div class="col-md-4 col-xs-4 col-sm-4 " style="background-color: #e0f2f1; height:320px;">
                <br><br><br>
                <center><img src="../../Contenido/Imagenes/Sistema/agregar.png" width="250px" height="250px"/></center>
                
            </div>
            <input type="hidden" value="<%=sesion.getAttribute("idPostulante") %>" id="idPostulante"> 
            <div class="col-md-8 col-xs-8 col-sm-8">
                             <table id="tableHab" class="tab-content highlight responsive-table" style="width:100%">
                        <thead>
                            <tr>
                                <th>Habilidad</th>
                        
                                
                                
                                <th style="width: 250px;">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                               Habilidad ha= new Habilidad();
                               
                                DaoHabilidad daoh= new DaoHabilidad();
                                List<Habilidad> lsthab= daoh.mostrar();
                                
                               for(Habilidad hab:lsthab)
                               {
                            %>
                            <tr>
                                <td><%=hab.getHabilidad()%></td>
                                
                               
                                <td><input type="button" name="Añadir" value="Añadir" id="<%=hab.getIdHabilidad() %>" class="btn red waves-block guardar" ></td>
                                
                                
                            </tr>
                            <%}%>
                        </tbody>
                    </table> 
            </div>
        </div>
    </div>
    <div class="modal-footer">
      
        
        <div class="waves-effect waves-green btn btn-danger cans" id="cancelar">Cancelar</div>
    </div>
  </div> 
</html>
